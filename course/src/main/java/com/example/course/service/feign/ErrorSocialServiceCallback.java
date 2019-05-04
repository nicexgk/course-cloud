package com.example.course.service.feign;

import com.example.common.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.stereotype.Component;

import javax.jms.Destination;

@Component
public class ErrorSocialServiceCallback implements FeignSocialService{
    @Autowired
    private JmsMessagingTemplate jmsMessagingTemplate;
    @Value("${social.service}")
    private String serviceName;
    @Autowired
    @Qualifier("error-log-queue")
    private Destination queue;
    private static final String defaultContent = new String("调用服务出错");

    // 将变量放在线程里，避免每次都new一个ErrorLog对象，
    private ThreadLocal<ErrorLog> logThreadLocal = new ThreadLocal<ErrorLog>() {
        @Override
        protected ErrorLog initialValue() {
            return new ErrorLog();
        }
    };

    public void sendErrorLog(String errorFunction, String errorContent) {
        ErrorLog errorLog = logThreadLocal.get();
        errorLog.setErrorService(serviceName);
        errorLog.setErrorFunction(errorFunction);
        errorLog.setErrorContent(errorContent);
        try {
            jmsMessagingTemplate.convertAndSend(queue, errorLog);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Status getDefaultErrorStatus() {
        Status status = new Status();
        status.setStatus(500);
        status.setDescription("服务出错啦！稍后请重试。。。");
        return status;
    }

    @Override
    public Status addCommentary(Commentary commentary) {
        sendErrorLog("Status addCommentary(Commentary commentary)", defaultContent);
        return getDefaultErrorStatus();
    }

    @Override
    public Superstate getCommentaryListByCidForPageSize(int cid, int page, int size) {
        sendErrorLog("Superstate getCommentaryListByCidForPageSize(int cid, int page, int size)", defaultContent);
        return null;
    }

    @Override
    public Status addCourseChat(CourseChat courseChat) {
        sendErrorLog("Status addCourseChat(CourseChat courseChat)", defaultContent);
        return getDefaultErrorStatus();
    }

    @Override
    public Superstate getCourseChatListByCidForPageSize(int cid, int page, int size) {
        sendErrorLog("Status addCourseChat(CourseChat courseChat)", defaultContent);
        return null;
    }
}
