package com.example.socialservice.dao;

import com.example.common.entity.CourseChat;
import com.example.common.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CourseChatMapperTest {

    @Resource
    private CourseChatMapper courseChatMapper;

    @Test
    public void insertCourseChatTest(){
        CourseChat courseChat = new CourseChat();
        courseChat.setContent("nice nic enic e");
        courseChat.setReceiveCourseId(179);
        User user = new User();
        user.setUserId(21);
        courseChat.setSendUser(user);
        System.out.println(courseChatMapper.insertCourseChat(courseChat));
    }

    @Test
    public void queryCourseChatListTest(){
        System.out.println(courseChatMapper.queryCourseChatListByCidForStartSize(179, 0, 0));
    }

    @Test
    public void queryCourseChatCountByCid(){
        System.out.println(courseChatMapper.queryCourseChatCountByCid(179));
    }
}
