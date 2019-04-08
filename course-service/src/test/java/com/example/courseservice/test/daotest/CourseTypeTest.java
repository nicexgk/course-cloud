package com.example.courseservice.test.daotest;

import com.example.courseservice.dao.CourseTypeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CourseTypeTest {

    @Resource
    CourseTypeMapper courseTypeMapper;

    @Test
    public void testCourseType(){
//        System.out.println(courseTypeMapper.queryOriginType());
        System.out.println(courseTypeMapper.queryTypeByIdOnChile(courseTypeMapper.queryOriginType()));
    }


}
