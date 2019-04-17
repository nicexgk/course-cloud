package com.example.course.controller;

import com.example.common.entity.Superstate;
import com.example.common.entity.User;
import com.example.course.service.feign.FeignCourseService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/student")
public class StudentController {
    @Resource
    private FeignCourseService feignCourseService;

    @GetMapping("/course/{page}/{size}")
    public Superstate getStudentCourseBySidForPageSize(HttpServletRequest request, @PathVariable("page") int page, @PathVariable("size") int size){
        User user = (User) request.getSession().getAttribute("user");
        return feignCourseService.getStudentCourseListByUserIdForPageSize(user.getUserId(), page, size);
    }

}
