package com.example.socialservice.dao;

import com.example.common.entity.Commentary;
import com.example.common.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CommentaryMapperTest {
    @Resource
    CommentaryMapper commentaryMapper;

    @Test
    public void insetCommentaryTest(){

        Commentary commentary = new Commentary();
        User user = new User();
        user.setUserId(8);
        commentary.setCommentUser(user);
        commentary.setCommentCourse(179);
        commentary.setCommentGrade(5);
        commentary.setCommentContent("nice nice nice");
        System.out.println(commentaryMapper.insertCommentary(commentary));

    }

}
