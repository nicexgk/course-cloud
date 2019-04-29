package com.example.course;

import com.example.course.controller.WebSocketController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.ConfigurableApplicationContext;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
@EnableSwagger2
public class CourseApplication {

	public static void main(String[] args) {
		SpringApplication.run(CourseApplication.class, args);
//        SpringApplication springApplication = new SpringApplication(CourseApplication.class);
//		ConfigurableApplicationContext configurableApplicationContext = springApplication.run(args);
//        WebSocketController.applicationContext = configurableApplicationContext;
	}

}
