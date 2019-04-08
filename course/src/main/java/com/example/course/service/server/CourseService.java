package com.example.course.service.server;

import com.example.common.entity.CourseType;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;

public interface CourseService {

    public ArrayList<CourseType> getCourseType();

}
