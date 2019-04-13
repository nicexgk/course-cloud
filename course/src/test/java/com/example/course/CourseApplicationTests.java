package com.example.course;

import com.example.common.entity.User;
import com.example.course.service.feign.FeignCourseService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CourseApplicationTests {

	@Resource
	FeignCourseService feignCourseService;

	@Resource
	RedisTemplate<String, Object> redisTemplate;

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

}
