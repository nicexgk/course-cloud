package com.example.userservice.service;

import com.example.common.entity.User;
import com.example.userservice.dao.UserMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService{
    @Resource
    UserMapper userMapper;

    @Override
    public User userLogin(String account, String pwd) {
        User user = userMapper.queryUser(account, pwd);
        return user;
    }
}
