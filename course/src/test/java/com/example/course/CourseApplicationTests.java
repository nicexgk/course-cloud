package com.example.course;

import com.example.common.entity.User;
import com.example.course.service.feign.FeignCourseService;
import org.apache.activemq.command.ActiveMQQueue;
import org.apache.activemq.command.ActiveMQTopic;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import javax.jms.Destination;
import javax.jms.Queue;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CourseApplicationTests {

	@Resource
	FeignCourseService feignCourseService;

	@Resource
	RedisTemplate<String, Object> redisTemplate;

	@Autowired
	JmsMessagingTemplate jmsMessagingTemplate;

	@Autowired
    Queue queue;

	@Test
	public void contextLoads() {

//        System.out.println(feignCourseService.getCourseType());

        User user = new User();
        user.setUserId(2);
        user.setUserName("nice nic");
        user.setUserEmail("dkkddkkddkkd");
        user.setUserDescription("kdldfdkfdjfldjfkdlfjdlfj");
        redisTemplate.opsForValue().set("nice nice nice", user);
        redisTemplate.opsForSet().add("user", user);
        redisTemplate.opsForZSet().add("zuser", user, 10);
        redisTemplate.opsForHash().put("huser", "user", user);
        redisTemplate.opsForList().leftPush("luser", user);
		System.out.println(redisTemplate.opsForHash().hasKey("huser", "user"));
		System.out.println(redisTemplate.opsForHash().hasKey("huser", "usder"));
//		redisTemplate.expire
	}


	@Test
    public void activeMqTset(){
		System.out.println(jmsMessagingTemplate);
        ActiveMQQueue destination = new ActiveMQQueue("nice");
        destination.createDestination("nice1");
        ActiveMQTopic activeMQTopic = new ActiveMQTopic("topic");
	    jmsMessagingTemplate.convertAndSend(activeMQTopic, "nice nice nice");
	    jmsMessagingTemplate.convertAndSend(destination, "nice nice nice");
    }

    @JmsListener(destination = "nice", containerFactory = "jmsListenerContainerQueue")
    public void String(String text){
        System.out.println(text);
    }

}
