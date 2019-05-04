package com.example.logservice.service.activemq.Consumer;

import com.example.common.entity.ErrorLog;
import com.example.logservice.service.LogService;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.jms.annotation.JmsListeners;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class ErrorLogConsumer {
    @Resource
    private LogService logService;

    @JmsListeners({
            @JmsListener(id = "1", destination = "${error.log.queue}", containerFactory = "jmsListenerContainerQueue"),
            @JmsListener(id = "2", destination = "${error.log.queue}", containerFactory = "jmsListenerContainerQueue"),
            @JmsListener(id = "3", destination = "${error.log.queue}", containerFactory = "jmsListenerContainerQueue"),
            @JmsListener(id = "4", destination = "${error.log.queue}", containerFactory = "jmsListenerContainerQueue"),
            @JmsListener(id = "5", destination = "${error.log.queue}", containerFactory = "jmsListenerContainerQueue"),
    })
    public void receiveQueue(ErrorLog errorLog) {
        if (logService.insertErrorLog(errorLog)) {
            System.out.println("success");
        } else {
            System.out.println("fail");
        }
    }

}
