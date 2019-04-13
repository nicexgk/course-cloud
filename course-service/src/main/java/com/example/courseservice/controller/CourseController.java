package com.example.courseservice.controller;

import com.example.common.entity.Course;
import com.example.common.entity.Superstate;
import com.example.common.entity.Status;
import com.example.courseservice.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.LinkedHashMap;

@RestController()
@RequestMapping("/course")
public class CourseController {
    @Autowired
    CourseService courseService;

    @PostMapping("/")
    public Status addCourse(@RequestBody Course course){
        System.out.println("insertCourse");
        Status status = courseService.addCourse(course);
        System.out.println(status);
        return status;
    }

    @PutMapping("/")
    public Status modifyCourse(@RequestBody Course course){
        System.out.println("modifyCourse");
        Status status = courseService.modifyCourse(course);
        System.out.println(status);
        return status;
    }

    @GetMapping("/{id}")
    public Course getCourseById(@PathVariable("id") int id){
        Course course = courseService.getCourseById(id);
        return course;
    }

    @GetMapping("/user/{id}")
    public ArrayList<Course> getUserCourseList(@PathVariable("id") int id){
        return courseService.getUserCourseList(id);
    }

    @GetMapping("/{tid}/{page}/{size}")
    public Superstate getCourseList(@PathVariable("tid") int tid, @PathVariable("page") int page, @PathVariable("size") int size){
        return courseService.getCourseByTypeForPageSize(tid, page, size);
    }

    @GetMapping("/{page}/{size}")
    public Superstate getCourseList(@PathVariable("page") int page, @PathVariable("size") int size){
        return courseService.getCourseForPageSize(page, size);
    }

    // 分页获取热门个课程
    @GetMapping("/popular/{page}/{size}")
    public ArrayList<Course> popularCourseList(@PathVariable("page") int page, @PathVariable("size") int size){

        return null;
    }

    // 分页获取某主类下所有子类的课程热门课程
    @GetMapping("/top/{parentId}/{page}/{size}")
    public LinkedHashMap<String, ArrayList<Course>> getCourseTopNumByParentType(@PathVariable("parentId") int parentId, @PathVariable("page") int page, @PathVariable("size") int size){
        System.out.println("parentId = " + parentId);
        System.out.println("page = " + page);
        System.out.println("size = " + size);
        return courseService.getCourseTopNumByParentType(parentId, page, size);
    }

}
