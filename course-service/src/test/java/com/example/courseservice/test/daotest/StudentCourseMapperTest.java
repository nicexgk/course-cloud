package com.example.courseservice.test.daotest;

import com.example.common.entity.Course;
import com.example.common.entity.StudentCourse;
import com.example.courseservice.dao.StudentCourseMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class StudentCourseMapperTest {

    @Resource
    private StudentCourseMapper studentCourseMapper;

    @Test
    public void insertUserCourseTest(){
        Course course = new Course();
        course.setCourseId(179);
        StudentCourse studentCourse = new StudentCourse();
        studentCourse.setCourse(course);
        studentCourse.setOrderOn("7626fe1b-d756-4465-9a59-4a19e481ad25");
        studentCourse.setStudentId(9);
        System.out.println(studentCourseMapper.insertUserCourse(studentCourse));
    }

    @Test
    public void selectUserCourseTest(){
        System.out.println(studentCourseMapper.queryUserCourseByUserIdForStatSize(9, 0, 10));
        StudentCourse studentCourse = new StudentCourse();
    }

    @Test
    public void queryStudentCourseBySidCidTest(){
        System.out.println(studentCourseMapper.queryStudentBySidCid(9, 179));
    }

    @Test
    public void queryStudentCourseByCount(){
        System.out.println(studentCourseMapper.queryStudentBySidCount(21));
    }

    @Test
    public void deleteStudentCourse(){
        System.out.println(studentCourseMapper.deleteStudentCourseByCidAndSid(179, 21));
    }
}
