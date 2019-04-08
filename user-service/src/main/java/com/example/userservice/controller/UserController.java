package com.example.userservice.controller;

import com.example.common.entity.User;
import com.example.userservice.dao.UserMapper;
import com.example.userservice.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.websocket.server.PathParam;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @GetMapping("/{account}/{pwd}")
    public User getUser(@PathVariable("account")String account, @PathVariable("pwd") String pwd){

        return userService.userLogin(account, pwd);
    }
}
