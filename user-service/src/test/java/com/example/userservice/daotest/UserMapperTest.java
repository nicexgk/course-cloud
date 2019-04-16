package com.example.userservice.daotest;

import com.example.common.entity.User;
import com.example.userservice.dao.UserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserMapperTest {

    @Resource
    UserMapper userMapper;

    @Test
    public void addUser(){

        User user = new User();
        user.setUserEmail("621392651@Dfd");
        user.setUserName("nice");
        user.setUserOn("34343f44");
        user.setUserPwd("123456");
        user.setUserDescription("nice nci enic enice");
        user.setUserType(1);
        user.setUserAddress(":dd");
        user.setUserPhone("11225");
        System.out.println(userMapper.insertUser(user));

    }

    @Test
    public  void updateUserTest(){
        User user = new User();
        user.setUserId(10);
        user.setUserEmail("621392651@Dfd");
        user.setUserName("nice");
        user.setUserOn("3443f44");
        user.setUserPwd("123456");
        user.setUserDescription("nice nci enic enice");
        user.setUserType(1);
        user.setUserAddress(":dd");
        user.setUserPhone("11225");
        System.out.println(userMapper.updateUser(user));
    }

}
