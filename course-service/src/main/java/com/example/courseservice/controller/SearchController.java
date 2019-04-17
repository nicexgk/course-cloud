package com.example.courseservice.controller;

import com.example.common.entity.Course;
import com.example.courseservice.service.CourseService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;

@RestController
@RequestMapping("/search/course")
public class SearchController {
    @Resource
    private CourseService courseService;

    @GetMapping("/{text}/{page}/{size}")
    public ArrayList<Course> searchCourseListForPageSize(@PathVariable("text")String text, @PathVariable("page")int page, @PathVariable("size")int size){
        return courseService.searchCourseListByNameForPageSize(text, page, size);
    }

}
