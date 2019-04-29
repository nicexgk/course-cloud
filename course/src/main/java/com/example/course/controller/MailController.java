package com.example.course.controller;

import ch.qos.logback.core.util.TimeUtil;
import com.example.common.entity.Status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.management.timer.Timer;
import java.util.Date;
import java.util.Random;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/mail")
public class MailController {

    private static final Random random = new Random();
    @Autowired
    public JavaMailSender javaMailSender;
    @Autowired
    RedisTemplate<String, Object> redisTemplate;

    @GetMapping("/")
    public Status verification(@RequestParam("email") String receiveMail){
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();

        simpleMailMessage.setFrom("1621392651@qq.com");
        simpleMailMessage.setTo(receiveMail);
        int check = (int)((random.nextDouble() + 0.000001) * 1000000);
        simpleMailMessage.setSubject("Nice课堂");
        simpleMailMessage.setText("亲爱的" + receiveMail + "您好！您在Nice课堂的注册验证码为 " + check + " 请及时使用，该验证码5分钟内有效。");
        javaMailSender.send(simpleMailMessage);
        redisTemplate.opsForValue().set(receiveMail, check);
        redisTemplate.expire(receiveMail, 60 * 5, TimeUnit.SECONDS);
        Status status = new Status();
        status.setStatus(200);
        status.setDescription("nice nice nice");
        return status;
    }
}
