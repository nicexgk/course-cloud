package com.example.courseservice.test.daotest;

import com.example.common.entity.Commentary;
import com.example.common.entity.User;
import com.example.courseservice.dao.CommentaryMapper;
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
    public void addCommentaryTest(){
        Commentary commentary = new Commentary();
        User user = new User();
        user.setUserId(7);
        commentary.setCommentUser(user);
        commentary.setCommentCourse(179);
        commentary.setCommentContent("nice nice nice");
        commentary.setCommentGrade(5);
        System.out.println(commentaryMapper.addCommentary(commentary));
    }
}
