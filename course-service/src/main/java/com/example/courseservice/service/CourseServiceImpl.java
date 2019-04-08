package com.example.courseservice.service;

import com.example.common.entity.Course;
import com.example.common.entity.CourseType;
import com.example.common.entity.Status;
import com.example.courseservice.dao.CourseMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
public class CourseServiceImpl implements CourseService{
    @Resource
    CourseMapper courseMapper;

    @Override
    public Status addCourse(Course course) {
        Status status = new Status();
        if(course == null){
            status.setStatus(400);
            status.setDescription("添加的课程不能为空");
            return status;
        }
        if(course.getCourseTeacher() == null){
            status.setStatus(400);
            status.setDescription("请先登录。。。");
            return status;
        }
        if(course.getCourseName() == null){
            status.setStatus(400);
            status.setDescription("课程名字不能为空");
            return status;
        }
        if(course.getCourseType() == null){
            status.setStatus(400);
            status.setDescription("课程类型不能为空");
            return status;
        }
        if(!courseMapper.addCourse(course)){
            status.setStatus(400);
            status.setDescription("课程添加失败，请重试!");
            return status;
        }
        status.setStatus(200);
        status.setDescription("课程添加成功");
        return status;
    }

    @Override
    public ArrayList<Course> getUserCourseList(int id) {

        return courseMapper.queryUserCourseList(id);
    }

    @Override
    public Status modifyCourse(Course course) {
        Status status = new Status();
        if(course.getCourseId() == null){
            status.setStatus(400);
            status.setDescription("不合法的课程对象");
            return status;
        }

        if (!courseMapper.updateCourse(course)){
            status.setStatus(400);
            status.setDescription("课程信息修改失败，稍后请重试!");
        }
        status.setStatus(200);
        status.setDescription("课程添加成功");
        return status;
    }
}
