package com.example.courseservice.controller;

import com.example.common.entity.Course;
import com.example.common.entity.Superstate;
import com.example.courseservice.service.CourseService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;

@RestController
@RequestMapping("/search/course")
public class SearchController {
    @Resource
    private CourseService courseService;

    @GetMapping("/{text}/{page}/{size}")
    public Superstate searchCourseListForPageSize(@PathVariable("text")String text, @PathVariable("page")int page, @PathVariable("size")int size){
        System.out.println(courseService.searchCourseListByNameForPageSize(text, page, size));
        return courseService.searchCourseListByNameForPageSize(text, page, size);
    }


}
