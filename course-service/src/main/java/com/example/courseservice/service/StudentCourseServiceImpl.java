package com.example.courseservice.service;

import com.example.common.entity.Status;
import com.example.common.entity.StudentCourse;
import com.example.courseservice.dao.StudentCourseMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
public class StudentCourseServiceImpl implements StudentCourseService {

    @Resource
    private StudentCourseMapper studentCourseMapper;

    @Override
    public Status addStudentCourse(StudentCourse studentCourse) {
        Status status = new Status();
        if (!studentCourseMapper.insertUserCourse(studentCourse)) {
            status.setStatus(400);
            status.setDescription("添加用户课程信息失败");
            return status;
        }
        status.setStatus(200);
        status.setDescription("添加成功");
        return status;
    }

    @Override
    public ArrayList<StudentCourse> getStudentCourseListByUserIdForPageSize(int sid, int page, int size) {
        return studentCourseMapper.queryUserCourseByUserIdForStatSize(sid, page * size, size);
    }


    @Override
    public StudentCourse getStudentCourseBySidCid(int sid, int cid) {
        return studentCourseMapper.queryStudentBySidCid(sid, cid);
    }
}
