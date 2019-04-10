package com.example.course.ServiceTest;

import com.example.common.entity.Course;
import com.example.course.service.feign.FeignCourseService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class FeignCourseServiceTest {

    @Resource
    FeignCourseService feignCourseService;

    @Test
    public void courseServiceTest(){

        Course course = new Course();
        course.setCourseName("test text test test");
        System.out.println(feignCourseService.addCourse(course));
    }

    @Test
    public void getUserCourtseListTest(){
        System.out.println(feignCourseService.getUserCourseList(7));
    }

    @Test
    public void modifyCourseTest(){
        Course course = new Course ();
        course.setCourseId(50);
        course.setCourseDetail("Java  架构师课程");
        course.setCourseName("java 架构师");
        course.setCoursePrice(30000);
        course.setDescription("nice nice nice nice nice nice nice nice nice nice");
        System.out.println(feignCourseService.modifyCourse(course));
    }

    @Test
    public void getCourseByIdTest(){
        System.out.println(feignCourseService.getCourseById(40));
    }
}
