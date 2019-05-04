package com.example.socialservice.service.activemq.Consumer;

import com.example.common.entity.Course;
import com.example.common.entity.CourseChat;
import com.example.socialservice.dao.CourseChatMapper;
import org.apache.activemq.command.ActiveMQObjectMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.jms.annotation.JmsListeners;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.jms.ObjectMessage;

@Component
public class CourseChatConsumer {
    @Resource
    private CourseChatMapper courseChatMapper;
    private ThreadLocal<Integer> integerThreadLocal = new ThreadLocal<Integer>(){
        @Override
        protected Integer initialValue() {
            return 0;
        }
    };

//    @JmsListener(destination = "${course.chat.queue}", containerFactory = "jmsListenerContainerQueue")
    @JmsListeners({
            @JmsListener(id = "consumer1", destination = "${course.chat.queue}", containerFactory = "jmsListenerContainerQueue"),
            @JmsListener(id = "consumer2", destination = "${course.chat.queue}", containerFactory = "jmsListenerContainerQueue"),
            @JmsListener(id = "consumer3", destination = "${course.chat.queue}", containerFactory = "jmsListenerContainerQueue"),
            @JmsListener(id = "consumer4", destination = "${course.chat.queue}", containerFactory = "jmsListenerContainerQueue")
    })
    public void receiveQueue(CourseChat courseChat) throws JMSException {
        System.out.println("======================" + integerThreadLocal.get());
        System.out.println(Thread.currentThread().getId());
        if(courseChatMapper.insertCourseChat(courseChat)){
            System.out.println("success");
        } else {
            System.out.println("fail");
        }
    }
}
