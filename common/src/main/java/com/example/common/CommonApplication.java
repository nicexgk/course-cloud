package com.example.common;

import com.example.common.entity.Course;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CommonApplication {

	public static void main(String[] args) {
		SpringApplication.run(CommonApplication.class, args);
		Course course = new Course();
		course.getDescription();
		course.getCourseDetail();
	}

}
