package com.example.course.service.feign;

import com.example.common.entity.ErrorLog;
import com.example.common.entity.Status;
import com.example.common.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.stereotype.Component;

import javax.jms.Destination;

@Component
public class ErrorUserServiceCallback implements FeignUserService{
    @Autowired
    private JmsMessagingTemplate jmsMessagingTemplate;
    @Value("${order.service}")
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
    public User getUser(String account, String pwd) {
        sendErrorLog("User getUser(String account, String pwd)", defaultContent);
        return null;
    }

    @Override
    public Status register(User user) {
        sendErrorLog("Status register(User user)", defaultContent);
        return getDefaultErrorStatus();
    }

    @Override
    public Status updateUser(User user) {
        sendErrorLog("Status updateUser(User user)", defaultContent);
        return getDefaultErrorStatus();
    }

    @Override
    public User getUser(int uid) {
        sendErrorLog("User getUser(int uid)", defaultContent);
        return null;
    }

    @Override
    public Status resetPwdByEmail(String email, String pwd) {
        sendErrorLog("User getUser(int uid)", defaultContent);
        return getDefaultErrorStatus();
    }
}
