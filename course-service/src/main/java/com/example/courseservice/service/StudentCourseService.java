package com.example.courseservice.service;

import com.example.common.entity.Status;
import com.example.common.entity.StudentCourse;
import com.example.common.entity.Superstate;

import java.util.ArrayList;

public interface StudentCourseService {

    public Status addStudentCourse(StudentCourse studentCourse);

    public Superstate getStudentCourseListByUserIdForPageSize(int sid, int page, int size);

    public StudentCourse getStudentCourseBySidCid(int sid, int cid);
}
