package com.example.userservice.service;

import com.example.common.entity.Course;
import com.example.common.entity.Status;
import com.example.common.entity.User;
import com.example.userservice.dao.UserMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService{
    @Resource
    UserMapper userMapper;

    @Override
    public Status updateUser(User user) {
        Status status = new Status();
        if (!userMapper.insertUser(user)){
            status.setStatus(400);
            status.setDescription("信息修改失败");
            return status;
        }
        status.setStatus(200);
        status.setDescription("信息修改成功");
        return status;
    }

    @Override
    public User userLogin(String account, String pwd) {
        User user = userMapper.queryUser(account, pwd);
        return user;
    }

    @Override
    public Status addUser(User user) {
        Status status = new Status();
        if(!userMapper.insertUser(user)) {
            status.setStatus(400);
            status.setDescription("注册失败！！！");
            return status;
        }
        status.setStatus(200);
        status.setDescription("注册成功！");
        return status;
    }

    @Override
    public User getUser(int uid) {
        return userMapper.queryUserByUid(uid);
    }

    @Override
    public Status resetPwdByEmail(String email, String pwd) {
        Status status = new Status();
        if(!userMapper.updatePwdByEmail(email, pwd)){
            status.setStatus(400);
            status.setDescription("重置密码失败！！！");
            return status;
        }
        status.setStatus(200);
        status.setDescription("密码已重置！");
        return status;
    }
}
