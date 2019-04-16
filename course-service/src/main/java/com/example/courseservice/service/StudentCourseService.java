package com.example.courseservice.service;

import com.example.common.entity.Status;
import com.example.common.entity.StudentCourse;

import java.util.ArrayList;

public interface StudentCourseService {

    public Status addStudentCourse(StudentCourse studentCourse);

    public ArrayList<StudentCourse> getStudentCourseListByUserIdForPageSize(int sid, int page, int size);

    public StudentCourse getStudentCourseBySidCid(int sid, int cid);
}
