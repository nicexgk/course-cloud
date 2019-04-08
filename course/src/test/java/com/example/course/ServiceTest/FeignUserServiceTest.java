package com.example.course.ServiceTest;

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
}
