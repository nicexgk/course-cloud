package com.example.course.controller;

import com.example.common.entity.Collect;
import com.example.common.entity.Status;
import com.example.common.entity.User;
import com.example.course.service.feign.FeignCourseService;
import io.swagger.annotations.Api;
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

    @ApiOperation(value = "分页查找用户的收藏列表", notes = "页数从0开始不是1")
    @GetMapping("/{page}/{size}")
    public ArrayList<Collect> getCollectList(HttpServletRequest request, @PathVariable("sid")int sid, @PathVariable("page")int page, @PathVariable("size")int size){
        User user = (User) request.getSession().getAttribute("user");
        page = page >= 0 ? page : 0;
        size = size >= 0 ? size : 0;
        return feignCourseService.getCollectList(user.getUserId(), page, size);
    }
}
