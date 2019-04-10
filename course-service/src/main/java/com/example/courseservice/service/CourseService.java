package com.example.courseservice.service;

import com.example.common.entity.Course;
import com.example.common.entity.Status;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

public interface CourseService {

    public Status addCourse(Course course);

    public ArrayList<Course> getUserCourseList(int id);

    public Status modifyCourse(Course course);

    public Course getCourseById(int id);
}
