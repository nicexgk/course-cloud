package com.example.course.controller;

import com.example.common.entity.Status;
import com.example.common.entity.Superstate;
import com.example.common.entity.User;
import com.example.course.service.feign.FeignCourseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Api("学生课程信息接口")
@RestController
@RequestMapping("/student")
public class StudentController {
    @Resource
    private FeignCourseService feignCourseService;

    @ApiOperation(value = "分页查询学生课程信息接口", notes = "页数从0开始，不是1，用户必须登录了才可以访问该接口，否则将被拦截器拦截")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "page", value = "页数，从0开始"),
            @ApiImplicitParam(name = "size", value = "页的大小")
    })
    @GetMapping("/course/{page}/{size}")
    public Superstate getStudentCourseBySidForPageSize(HttpServletRequest request, @PathVariable("page") int page, @PathVariable("size") int size) {
        page = page >= 0 ? page : 0;
        size = size >= 0 ? size : 0;
        User user = (User) request.getSession().getAttribute("user");
        // 调用课程服务，分页查询用户课程列表
        return feignCourseService.getStudentCourseListByUserIdForPageSize(user.getUserId(), page, size);
    }

    @ApiOperation(value = "删除学生课程接口")
    @DeleteMapping("/course/{cid}")
    public Status cancelCourse(HttpServletRequest request, @PathVariable("cid") int cid) {
        User user = (User) request.getSession().getAttribute("user");
        return feignCourseService.deleteCollect(user.getUserId(), cid);
    }


}
