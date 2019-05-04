package com.example.userservice.service;

import com.example.common.entity.Course;
import com.example.common.entity.Status;
import com.example.common.entity.User;

public interface UserService {

    public User userLogin(String account, String pwd);

    public Status addUser(User user);

    public Status updateUser(User user);

    public User getUser(int uid);

    public Status resetPwdByEmail(String email, String pwd);
}
