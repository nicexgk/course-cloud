package com.example.course.service.feign;

import com.example.common.entity.Status;
import com.example.common.entity.User;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;

/**
 *
 * @description 调用user服务接口
 *
 */
@FeignClient(value = "${user.service}", fallback = ErrorUserServiceCallback.class)
public interface FeignUserService {

    @GetMapping("/user/{account}/{pwd}")
    public User getUser(@PathVariable("account") String account, @PathVariable("pwd") String pwd);

    @PostMapping("/user/")
    public Status register(@RequestBody User user);

    @PutMapping("/user/")
    public  Status updateUser(@RequestBody User user);

    @GetMapping("/user/{uid}")
    public User getUser(@PathVariable("uid") int uid);

    @PutMapping("/user/reset/")
    public Status resetPwdByEmail(@RequestParam("email") String email, @RequestParam("pwd") String pwd);

}
