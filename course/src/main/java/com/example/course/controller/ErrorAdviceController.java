package com.example.course.controller;

import com.example.common.entity.ErrorLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

import javax.jms.Destination;
import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
public class ErrorAdviceController {
    @Autowired
    private JmsMessagingTemplate jmsMessagingTemplate;
    @Autowired
    @Qualifier("error-log-queue")
    private Destination queue;

    @ExceptionHandler(value = Exception.class)
    public String error(HttpServletRequest request, Exception e) {
        if(e != null){
            ErrorLog errorLog = new ErrorLog();
            errorLog.setErrorContent(e.getMessage());
            try{
                jmsMessagingTemplate.convertAndSend(queue, errorLog);
            } catch (Exception e1){
                e1.printStackTrace();
            }
            request.setAttribute("error", e.getCause());
            System.out.println(e.getCause());
        }
        return "/error.html";
    }

}
