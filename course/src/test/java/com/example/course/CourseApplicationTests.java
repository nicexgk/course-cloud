package com.example.course;

import com.example.course.service.feign.FeignCourseService;
import feign.Feign;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CourseApplicationTests {

	@Resource
	FeignCourseService feignCourseService;

	@Test
	public void contextLoads() {

        System.out.println(feignCourseService.getCourseType());

	}

}
