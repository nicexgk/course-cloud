package com.example.course.controller;

import com.example.common.entity.*;
import com.example.course.service.feign.FeignCourseService;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

@RestController
@RequestMapping("/course")
@Api("课程接口")
public class CourseController {

    @Resource
    FeignCourseService feignCourseService;

    @Autowired
    ObjectMapper objectMapper;

    @ApiOperation(value = "添加课程接口", tags = {"返回一个状态对象", "course-controller"}, notes = "必须与JSON格式提交课要添加的课程对象")
    @PostMapping(value = "/")
    public Status addCourse(HttpServletRequest request, @RequestBody Course course) throws IOException {
        Status status = null;
        System.out.println(course);
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
    public Status modifyCourse(HttpServletRequest request, @RequestBody Course course) {
        Status status = null;
        System.out.println(course);
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            status = new Status();
            status.setStatus(400);
            status.setDescription("您还没有登录，请先登录！！！");
        }
        status = feignCourseService.modifyCourse(course);
        if (status == null) {
            status = new Status();
            status.setStatus(400);
            status.setDescription("课程修改失败，稍后请重试！");
        }
        return status;
    }

    @ApiOperation(value = "根据课程id获取课程接口")
    @GetMapping("/{id}")
    public Course getCourseById(@PathVariable("id") int id) {
        System.out.println(id);
        Course course = feignCourseService.getCourseById(id);
        if (course == null) {
            course = new Course();
        }
        System.out.println(course);
        return course;
    }

    @ApiOperation(value = "获取课程目录列表", tags = {"返回JSON格式的目录对象", "course-controller"})
    @GetMapping("/type/")
    public ArrayList<CourseType> getType() {
        return feignCourseService.getCourseType();
    }

    @ApiOperation("根据用户id获取用户的课程列表接口")
    @GetMapping("/user/{id}")
    public ArrayList<Course> getUserCourseList(@PathVariable("id") int id) {
        System.out.println(id);
        return feignCourseService.getUserCourseList(id);
    }

    @ApiOperation(value = "获取用户的课程列表", notes = "用户必须登录后才能调用此接口")
    @GetMapping("/user/")
    public ArrayList<Course> getUserCourseList(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return null;
        }
        return feignCourseService.getUserCourseList(user.getUserId());
    }

    @ApiOperation(value = "获取指定类型的课程，并分页查询", notes = "页数从0开始不是1")
    @GetMapping("/{tid}/{page}/{size}")
    public Superstate getCourseByTypePageSize(@PathVariable("tid") int tid, @PathVariable("page") int page, @PathVariable("size") int size){
        return  feignCourseService.getCourseList(tid, page, size);
    }

    @ApiOperation(value = "并分页查询课程，", notes = "页数从0开始不是1")
    @GetMapping("/{page}/{size}")
    public Superstate getCourseForPageSize(@PathVariable("page") int page, @PathVariable("size") int size){
        return  feignCourseService.getCourseList(page, size);
    }

    @ApiOperation(value="根据父类的id查询其所有子类型的课程，分页查询，", notes = "页数从0开始不是1")
    @GetMapping("/top/{parentId}/{page}/{size}")
    public LinkedHashMap<String, ArrayList<Course>> getCourseTopNumByParentType(@PathVariable("parentId")int parentId, @PathVariable("page")int page, @PathVariable("size")int size){
        return feignCourseService.getCourseTopNumByParentType(parentId, page, size);
    }

    @ApiOperation(value = "用户评论接口", notes = "用户必须登录后才能调用此接口")
    @PostMapping("/commentary/")
    public Status commentary(HttpServletRequest request, @RequestBody Commentary commentary){
        User user = (User)request.getSession().getAttribute("user");
        commentary.setCommentUser(user);
        Status status = feignCourseService.addCommentary(commentary);
        if(status == null){
            status.setStatus(400);
            status.setDescription("发布评论失败，稍后请重试！");
        }
        return status;
    }

}
