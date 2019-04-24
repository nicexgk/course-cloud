package com.example.course.controller;

import com.example.common.entity.Collect;
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
import java.util.ArrayList;

@Api("收藏接口")
@RestController
@RequestMapping("/collection")
public class CollectionController {

    @Resource
    private FeignCourseService feignCourseService;

    @ApiOperation("根据课程的cid添加收藏")
    @PostMapping("/{cid}")
    public Status addCollect(HttpServletRequest request, @PathVariable("cid")int cid){
        User user = (User) request.getSession().getAttribute("user");
        return feignCourseService.addCollect(user.getUserId(), cid);
    }

    @ApiOperation("根据课程的cid删除收藏")
    @DeleteMapping("/{cid}")
    public Status deleteCollect(HttpServletRequest request, @PathVariable("cid")int cid){
        User user = (User) request.getSession().getAttribute("user");
        return feignCourseService.deleteCollect(user.getUserId(), cid);
    }

    @ApiOperation(value = "分页查询学生收藏列表信息接口", notes = "页数从0开始，不是1，用户必须登录了才可以访问该接口，否则将被拦截器拦截")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "page", value = "页数，从0开始"),
            @ApiImplicitParam(name = "size", value = "页的大小")
    })
    @GetMapping("/{page}/{size}")
    public Superstate getStudentCollectionBySidForPageSize(HttpServletRequest request, @PathVariable("page")int page, @PathVariable("size")int size){
        page = page >= 0 ? page : 0;
        size = size >= 0 ? size : 0;
        User user = (User) request.getSession().getAttribute("user");
        // 调用课程服务，分页查询用户收藏列表
        return feignCourseService.getCollectListBySidForPageSize(user.getUserId(), page, size);
    }
}
