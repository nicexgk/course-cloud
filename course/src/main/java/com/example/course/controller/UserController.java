package com.example.course.controller;

import com.example.common.entity.Status;
import com.example.common.entity.User;
import com.example.course.service.feign.FeignUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Api("用户接口")
@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    FeignUserService feignUserService;
    @Autowired
    RedisTemplate<String, Object> redisTemplate;

    @ApiOperation(value = "用户登录接口", tags = {"以JSON格式返回用户的信息对象", "user-controller"}, notes = "登录需提交account和pwd；两个属性")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "account", value = "用户账号", required = true),
            @ApiImplicitParam(name = "pwd", value = "用户密码", required = true)
    })
    @GetMapping("/")
    public User userLogin(HttpServletRequest request, String account, String pwd){
        User user = null;
        System.out.println(account + "  " + pwd);
        if (account != null && pwd != null) {
            user = feignUserService.getUser(account, pwd);
        }
        if (user == null){
            user = new User();
        } else {
            request.getSession().setAttribute("user", user);
        }
        user.setUserPwd(null);
        System.out.println(user);
        return user;
    }

    @ApiOperation(value = "用户注册接口")
    @PostMapping("/{check}")
    public Status register(@RequestBody User user, @PathVariable("check")Integer check){
        Status status = null;
        Integer reCheck = (Integer)redisTemplate.opsForValue().get(user.getUserEmail());
        if(reCheck == null || reCheck.intValue() != check){
            status = new Status();
            status.setStatus(400);
            status.setDescription("验证码不正确！");
            return status;
        }

        if(user.getUserEmail() == null || user.getUserPwd() == null ){
            status.setStatus(400);
            status.setDescription("邮箱或密码格式错误！");
            return status;
        }
        status = feignUserService.register(user);
        if(status == null){
            status.setStatus(400);
            status.setDescription("注册失败！稍后请重试");
        }
        return status;
    }

    @ApiOperation(value = "退出登录接口",tags = {"返回一个状态对象", "user-controller"}, notes = "请求方式delete")
    @DeleteMapping("/")
    public Status userLoginOuter(HttpServletRequest request){
        request.getSession().setAttribute("user", null);
        System.out.println("login outer user");
        Status status = new Status();
        status.setStatus(200);
        return status;
    }

}
