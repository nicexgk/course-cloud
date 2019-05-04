package com.example.courseservice.controller;

import com.example.common.entity.CourseType;
import com.example.courseservice.service.CourseTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;


@RestController
@RequestMapping("/type")
public class CourseTypeController {

    @Autowired
    private CourseTypeService courseTypeService;

    @GetMapping("/")
    public ArrayList<CourseType> getCourseType(){
        return courseTypeService.courseTypeNavigation();
    }

}
