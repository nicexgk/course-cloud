package com.example.courseservice.test.servicetest;


import com.example.courseservice.service.CourseTypeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CourseTypeServiceTest {
    @Resource
    CourseTypeService courseTypeService;

    @Test
    public void test(){
//        System.out.println(courseTypeService.originCourseType());
//        System.out.println(courseTypeService.originCourseType());
        System.out.println(courseTypeService.courseTypeNavigation());
    }
}
