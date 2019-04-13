package com.example.course.ServiceTest;

import com.example.common.entity.Commentary;
import com.example.common.entity.Course;
import com.example.common.entity.Superstate;
import com.example.common.entity.User;
import com.example.course.service.feign.FeignCourseService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class FeignCourseServiceTest {

    @Resource
    FeignCourseService feignCourseService;

    @Autowired
    ObjectMapper objectMapper;

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

    @Test
    public void addCommentaryTest(){

        Commentary commentary = new Commentary();
        User user = new User();
        user.setUserId(7);
        commentary.setCommentUser(user);
        commentary.setCommentCourse(179);
        commentary.setCommentContent("nice nice nice");
        commentary.setCommentGrade(5);
        System.out.println(feignCourseService.addCommentary(commentary));

    }

    @Test
    public void getCourseByTypePageSizeTest(){
//        System.out.println(feignCourseService.getCourseList(46, 1, 3));
        Superstate superstate = feignCourseService.getCourseList(46, 1, 3);
        ArrayList<Course> arrayList = objectMapper.convertValue(superstate.getResource(), new TypeReference<ArrayList<Course>>(){});
        System.out.println(arrayList);
//        System.out.println(feignCourseService.getCourseList(1, 4));
    }

    @Test
    public void getCourseTopNumByParentType(){
        LinkedHashMap<String, ArrayList<Course>>  nice = feignCourseService.getCourseTopNumByParentType(46, 0 , 8);
        for (Map.Entry<String, ArrayList<Course>> enty : nice.entrySet()){
            System.out.println(enty.getValue());
        }
    }

}
