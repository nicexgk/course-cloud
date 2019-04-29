package com.example.courseservice.service;

import com.example.common.entity.Course;
import com.example.common.entity.Status;
import com.example.common.entity.Superstate;

import java.util.ArrayList;
import java.util.LinkedHashMap;

public interface CourseService {

    /**
     * 添加课程方法
     * @param course 课程对象
     * @return 返回是否添加成功的转态对象
     */
    public Status addCourse(Course course);

    /**
     * 根据用户的id获取用户的授课课程列表
     * @param id 用户id
     * @return 返回用户授课的课程列表
     */
    public ArrayList<Course> getUserCourseList(int id);

    /**
     * 更改课程方法
     * @param course 要更改的课程对象，将根据该对象的课程id在数据库中找到对应的数据进行更改
     * @return 返回一个是否修改成功的转态对象
     */
    public Status modifyCourse(Course course);

    /**
     * 根据课程id获取课程对象
     * @param id 课程id
     * @return 返回课程id对应的课对象
     */
    public Course getCourseById(int id);

    public Superstate getCourseByTypeForPageSize(int tid, int page, int size);

    public Superstate getCourseForPageSize(int page, int size);

    public LinkedHashMap<String, ArrayList<Course>> getCourseTopNumByParentType(int parentId, int page, int size);

    public ArrayList<Course> getPopularCourseList(int page, int size);

    public ArrayList<Course> getPurchaseCourseList(int page, int size);

    public ArrayList<Course> getStudentCourseList(int uid, int page, int size);

    public ArrayList<Course> searchCourseListByNameForPageSize(String text, int page, int size);

}
