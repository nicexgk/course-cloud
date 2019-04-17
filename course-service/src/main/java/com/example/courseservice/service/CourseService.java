package com.example.courseservice.service;

import com.example.common.entity.Course;
import com.example.common.entity.Status;
import com.example.common.entity.Superstate;

import java.util.ArrayList;
import java.util.LinkedHashMap;

public interface CourseService {

    public Status addCourse(Course course);

    public ArrayList<Course> getUserCourseList(int id);

    public Status modifyCourse(Course course);

    public Course getCourseById(int id);

    public Superstate getCourseByTypeForPageSize(int tid, int page, int size);

    public Superstate getCourseForPageSize(int page, int size);

    public LinkedHashMap<String, ArrayList<Course>> getCourseTopNumByParentType(int parentId, int page, int size);

    public ArrayList<Course> getPopularCourseList(int page, int size);

    public ArrayList<Course> getPurchaseCourseList(int page, int size);

    public ArrayList<Course> getStudentCourseList(int uid, int page, int size);

    public ArrayList<Course> searchCourseListByNameForPageSize(String text, int page, int size);

}
