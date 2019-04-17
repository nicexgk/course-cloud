package com.example.courseservice.service;

import com.example.common.entity.Status;
import com.example.common.entity.StudentCourse;
import com.example.common.entity.Superstate;
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
    public Superstate getStudentCourseListByUserIdForPageSize(int sid, int page, int size) {
        Superstate superstate = new Superstate();
        page = page >= 0 ? page : 0;
        size = size >= 0 ? size : 0;
        superstate.setPage(page);
        superstate.setSize(size);
        superstate.setResource(studentCourseMapper.queryUserCourseByUserIdForStatSize(sid, page * size, size));
        superstate.setCount(studentCourseMapper.queryStudentBySidCount(sid));
        return superstate;
    }


    @Override
    public StudentCourse getStudentCourseBySidCid(int sid, int cid) {
        return studentCourseMapper.queryStudentBySidCid(sid, cid);
    }
}
