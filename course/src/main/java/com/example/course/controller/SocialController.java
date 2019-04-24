package com.example.course.controller;

import com.example.common.entity.Commentary;
import com.example.common.entity.Status;
import com.example.common.entity.Superstate;
import com.example.common.entity.User;
import com.example.course.service.feign.FeignSocialService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.socket.WebSocketSession;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

@RestController
@RequestMapping("/social")
public class SocialController {

    @Resource
    private FeignSocialService feignSocialService;


    @ApiOperation(value = "用户评论接口", notes = "用户必须登录后才能调用此接口，否则将被拦截器拦截")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "request", value = "请求对象"),
            @ApiImplicitParam(name = "commentary", value = "评论对象")
    })
    @PostMapping("/commentary/")
    public Status addCommentary(HttpServletRequest request, @RequestBody Commentary commentary) {
        User user = (User) request.getSession().getAttribute("user");
        commentary.setCommentUser(user);
        // 调用社交服务添加评论
        Status status = feignSocialService.addCommentary(commentary);
        if (status == null) {
            status.setStatus(400);
            status.setDescription("发布评论失败，稍后请重试！");
        }
        return status;
    }

    @ApiOperation(value = "根据课程的Cid分页获取评论信息", notes = "页数从0开始不是1")
    @GetMapping("/commentary/{cid}/{page}/{size}")
    public Superstate getCommentaryListByCidForPageSize(@PathVariable("cid") int cid, @PathVariable("page") int page, @PathVariable("size") int size) {
        page = page >= 0 ? page : 0;
        size = size >= 0 ? size : 0;
        return feignSocialService.getCommentaryListByCidForPageSize(cid, page, size);
    }



}
