package com.example.course.ServiceTest;

import com.example.common.entity.User;
import com.example.course.service.feign.FeignUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class FeignUserServiceTest {

    @Resource
    FeignUserService feignUserService;

    @Test
    public void userServiceTest(){
        System.out.println(feignUserService.getUser("123456", "123456"));
    }

    @Test
    public void addUserTest(){
        User user = new User();
        user.setUserEmail("621392d651@Dfd");
        user.setUserName("nice");
        user.setUserOn("34343df44");
        user.setUserPwd("123456");
        user.setUserDescription("nice nci enic enice");
        user.setUserType(1);
        user.setUserAddress(":dd");
        user.setUserPhone("11225");
        System.out.println(feignUserService.register(user));
    }

    @Test
    public void updateUserTest(){
        User user = new User();
        user.setUserId(10);
        user.setUserEmail("2132d651@Dfd");
        user.setUserName("nice");
        user.setUserOn("34df44");
        user.setUserPwd("123456");
        user.setUserDescription("nice nci enic enice");
        user.setUserType(1);
        user.setUserAddress(":dd");
        user.setUserPhone("11225");
        System.out.println(feignUserService.updateUser(user));
    }
}
