package com.example.course.ServiceTest;

import com.example.common.entity.Commentary;
import com.example.common.entity.User;
import com.example.course.service.feign.FeignSocialService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class FeignSocialServiceTest {
    @Resource
    FeignSocialService feignSocialService;


    @Test
    public void addCommentary(){
        Commentary commentary = new Commentary();
        User user = new User();
        user.setUserId(7);
        commentary.setCommentUser(user);
        commentary.setCommentCourse(179);
        commentary.setCommentGrade(5);
        commentary.setCommentContent("nice nice nice");
        System.out.println(feignSocialService.addCommentary(commentary));

    }

    @Test
    public void getCommentaryListByCidForPageSizeTest(){
        System.out.println(feignSocialService.getCommentaryListByCidForPageSize(179, 0 , 10));
    }

}
