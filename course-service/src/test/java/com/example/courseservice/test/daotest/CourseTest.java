package com.example.courseservice.test.daotest;

import com.example.common.entity.Course;
import com.example.common.entity.User;
import com.example.courseservice.dao.CourseMapper;
import com.sun.org.apache.xpath.internal.SourceTree;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CourseTest {

    @Resource
    CourseMapper courseMapper;

    @Test
    public void addCourseTest(){
        Course course = new Course();
        course.setCourseName("nice nice nice nice ncie nic ");
        course.setCoursePrice(00);
        course.setCourseDetail("dfjdfjdlf");
//        course.setCourseTeacher();
        System.out.println(courseMapper.addCourse(course));
    }

    @Test
    public void userCourseListTest(){
        System.out.println(courseMapper.queryUserCourseList(7));
    }

    @Test
    public void updateCourseTest(){

        Course course = new Course ();
        course.setCourseId(50);
        course.setCourseDetail("Java  架构师课程");
        course.setCourseName("java 架构师");
        course.setCoursePrice(30000);
        course.setDescription("nice nice nice nice nice nice nice nice nice nice");
        System.out.println(courseMapper.updateCourse(course));

    }
}
