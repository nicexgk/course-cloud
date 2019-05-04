package com.example.socialservice.service;

import com.example.common.entity.Course;
import com.example.common.entity.CourseChat;
import org.apache.activemq.command.ActiveMQObjectMessage;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.Serializable;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ActiveMQTest {

    @Value("${course.chat.queue}")
    private String courseChatQueue;
    @Autowired
    private JmsMessagingTemplate jmsMessagingTemplate;

    @Test
    public void providerMsg(){

        CourseChat courseChat = new CourseChat();
        for (int i = 0; i < 10 ; i ++){
            ActiveMQObjectMessage activeMQObjectMessage = new ActiveMQObjectMessage();
            courseChat.setContent("hello nice course" + i);
            Serializable serializable = courseChat;
            jmsMessagingTemplate.convertAndSend(courseChatQueue, courseChat);
        }

    }

}
