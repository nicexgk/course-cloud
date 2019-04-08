package com.example.courseservice.service;

import com.example.common.entity.CourseType;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

public interface CourseTypeService {

    public ArrayList<CourseType> courseTypeNavigation();
    public ArrayList<CourseType> originCourseType();
    public ArrayList<CourseType> courseTypeOnChile(ArrayList<CourseType> parentTypeList);
}
