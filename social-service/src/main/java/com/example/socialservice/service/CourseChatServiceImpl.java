package com.example.socialservice.service;

import com.example.common.entity.CourseChat;
import com.example.common.entity.Status;
import com.example.common.entity.Superstate;
import com.example.socialservice.dao.CourseChatMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
public class CourseChatServiceImpl implements CourseChatService{

    @Resource
    private CourseChatMapper courseChatMapper;

    @Override
    public Status addCourseChat(CourseChat courseChat) {
        Status status = new Status();
        if(!courseChatMapper.insertCourseChat(courseChat)){
            status.setStatus(400);
            status.setDescription("发送信息失败");
            return status;
        }
        status.setStatus(200);
        status.setDescription("发送信息成功");
        return status;
    }

    @Override
    public Superstate getCourseChatListByCidForPageSize(int cid, int page, int size) {
        page = page >= 0 ? page : 0;
        size = size >= 0 ? size : 0;
        ArrayList<CourseChat> courseChats = courseChatMapper.queryCourseChatListByCidForStartSize(cid, page, size);
        Superstate superstate = new Superstate();
        superstate.setSize(size);
        superstate.setPage(page);
        superstate.setResource(courseChats);
        superstate.setCount(courseChatMapper.queryCourseChatCountByCid(cid));
        return superstate;
    }

}
