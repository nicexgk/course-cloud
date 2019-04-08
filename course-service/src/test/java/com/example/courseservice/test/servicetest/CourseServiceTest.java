package com.example.courseservice.test.servicetest;

import com.example.common.entity.Course;
import com.example.courseservice.service.CourseService;
import com.netflix.discovery.converters.Auto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CourseServiceTest {
    @Autowired
    CourseService courseService;

    @Test
    public void courseServerTest(){


        Course course = new Course();
        course.setCourseName("nice nice nice nice ncie nic ");
        System.out.println(courseService.addCourse(course));

    }
}
