package com.example.course.controller;

import com.example.common.entity.Course;
import com.example.common.entity.CourseType;
import com.example.common.entity.Status;
import com.example.common.entity.User;
import com.example.course.service.feign.FeignCourseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;
import java.util.ArrayList;

@RestController
@RequestMapping("/course")
@Api("课程接口")
public class CourseController {

    @Resource
    FeignCourseService feignCourseService;

    @ApiOperation(value = "添加课程接口", tags = {"返回一个状态对象", "course-controller"}, notes = "必须与JSON格式提交课要添加的课程对象")
    @PostMapping("/")
    public Status addCourse(HttpServletRequest request, Course course) {
        Status status = null;
        System.out.println(course);
        course.getCourseDetail();
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            status = new Status();
            status.setStatus(400);
            status.setDescription("您还没有登录，请先登录！！！");
        }
        course.setCourseTeacher(user);
        status = feignCourseService.addCourse(course);
        if (status == null){
            status = new Status();
            status.setStatus(400);
            status.setDescription("课程添加失败，稍后请重试！");
        }
        return status;
    }

    @ApiOperation(value = "修改课程接口", notes = "用户需要有权限才能修改课程")
    @PutMapping("/")
    public Status modifyCourse(HttpServletRequest request, Course course){
        Status status = null;
        System.out.println(course);
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            status = new Status();
            status.setStatus(400);
            status.setDescription("您还没有登录，请先登录！！！");
        }
        status = feignCourseService.modifyCourse(course);
        if(status == null){
            status = new Status();
            status.setStatus(400);
            status.setDescription("课程修改失败，稍后请重试！");
        }
        return status;
    }

    @ApiOperation(value = "获取课程目录列表", tags = {"返回JSON格式的目录对象", "course-controller"})
    @GetMapping("/type/")
    public ArrayList<CourseType> getType() {
        return feignCourseService.getCourseType();
    }

    @ApiOperation("根据用户id获取用户的课程列表接口")
    @GetMapping("/user/{id}")
    public ArrayList<Course> getUserCourseList(@PathVariable("id") int id){
        System.out.println(id);
        return feignCourseService.getUserCourseList(id);
    }

    @ApiOperation(value = "获取用户的课程列表", notes = "用户必须登录后才能调用此接口")
    @GetMapping("/user/")
    public ArrayList<Course> getUserCourseList(HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        if (user == null){
            return null;
        }
        return feignCourseService.getUserCourseList(user.getUserId());
    }

}
