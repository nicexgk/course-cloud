package com.example.courseservice.controller;

import com.example.common.entity.Course;
import com.example.common.entity.Status;
import com.example.courseservice.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.ArrayList;

@RestController()
@RequestMapping("/course")
public class CourseController {
    @Autowired
    CourseService courseService;

    @PostMapping("/")
    public Status addCourse(@RequestBody Course course){
        System.out.println("addCourse");
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
    public ArrayList<Course> getUserCourseList(@PathParam("id") int id){
        return courseService.getUserCourseList(id);

    }
}
