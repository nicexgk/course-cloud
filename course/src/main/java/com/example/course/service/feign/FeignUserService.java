package com.example.course.service.feign;

import com.example.common.entity.User;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.websocket.server.PathParam;

/**
 *
 * @description 调用user服务接口
 *
 */
@FeignClient(value = "user-service" )
public interface FeignUserService {

    @GetMapping("/user/{account}/{pwd}")
    public User getUser(@RequestParam("account") String account, @RequestParam("pwd") String pwd);

}
