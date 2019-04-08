package com.example.userservice.service;

import com.example.common.entity.User;

public interface UserService {
    public User userLogin(String account, String pwd);
}
