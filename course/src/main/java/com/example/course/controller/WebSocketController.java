package com.example.course.controller;

import com.example.common.entity.CourseChat;
import com.example.common.entity.User;
import com.example.course.pojo.Message;
import com.example.course.service.feign.FeignSocialService;
import com.example.course.service.feign.FeignUserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.activemq.command.ActiveMQQueue;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.stereotype.Component;

import javax.jms.Queue;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@ServerEndpoint("/web/socket/{cid}/{sid}")
@Component
public class WebSocketController implements ApplicationContextAware {
    public static final ConcurrentHashMap<Integer, ConcurrentHashMap<Session, User>> concurrentHashMap = new ConcurrentHashMap<>();
    public static final ExecutorService executorService = Executors.newFixedThreadPool(20);
    public static ApplicationContext applicationContext;
    public static ObjectMapper objectMapper;

    private FeignSocialService feignSocialService;
    private FeignUserService feignUserService;
    private JmsMessagingTemplate jmsMessagingTemplate;
    private ActiveMQQueue queue;
    private Integer sid;
    private int cid;

    public WebSocketController() {
        System.out.println("new WebSocketController");
        System.out.println(applicationContext);
        // Spring 在初始该对象是没有传递 applicationContext对象进行来
        if (applicationContext != null) {
            feignSocialService = applicationContext.getBean(FeignSocialService.class);
            feignUserService = applicationContext.getBean(FeignUserService.class);
            jmsMessagingTemplate = applicationContext.getBean(JmsMessagingTemplate.class);
            queue = (ActiveMQQueue) applicationContext.getBean("course-chat-queue");
            objectMapper = applicationContext.getBean(ObjectMapper.class);
        }
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        WebSocketController.applicationContext = applicationContext;
    }

    @OnOpen
    public void onOpen(Session session, @PathParam("cid") int cid, @PathParam("sid") Integer sid) throws IOException {
        this.sid = sid;
        this.cid = cid;
        if (concurrentHashMap.get(cid) == null) {
            concurrentHashMap.put(cid, new ConcurrentHashMap<>());
            System.out.println("concurrentHashMap is null");
        }
        User user = feignUserService.getUser(sid);
        System.out.println(user);
        if (user != null) {
            System.out.println("user not null");
            concurrentHashMap.get(cid).put(session, user);
        }
    }

    @OnClose
    public void onClose(Session session) {
        System.out.println("close close close");
        System.out.println(session);
        // 移除该关闭的session
        if (session != null) {
            if (concurrentHashMap.get(cid) != null) {
                concurrentHashMap.get(cid).remove(session);
            }
            ;
        }
    }

    @OnMessage
    public void onMessage(String msg, Session session) throws IOException {
        System.out.println(msg);
        Message message = objectMapper.readValue(msg, Message.class);
        if (message.getOpe() == 0) {
            sendMsg(session, message.getMsg());
        }
        if (message.getOpe() == 1) {
            feignSocialService.getCourseChatListByCidForPageSize(cid, message.getPage(), message.getSize());
            String str = objectMapper.writeValueAsString(message);
            session.getAsyncRemote().sendText(str);
        }
    }

    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println(error);
        System.out.println("error error error");
    }


    public void sendMsg(Session session, String msg) {
        executorService.execute(() -> {
            ConcurrentHashMap<Session, User> tempMap = concurrentHashMap.get(cid);
            User user = tempMap.get(session);
            CourseChat courseChat = new CourseChat();
            courseChat.setSendUser(user);
            courseChat.setContent(msg);
            courseChat.setReceiveCourseId(cid);
            jmsMessagingTemplate.convertAndSend(queue, courseChat);
//            feignSocialService.addCourseChat(courseChat);
            String str = null;
            try {
                str = objectMapper.writeValueAsString(courseChat);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
            for (Iterator<Map.Entry<Session, User>> iterator = concurrentHashMap.get(cid).entrySet().iterator(); iterator.hasNext(); ) {
                Session session1 = iterator.next().getKey();
                if (session1 != session) {
                    session1.getAsyncRemote().sendText(str);
                }
            }
        });
    }
}
