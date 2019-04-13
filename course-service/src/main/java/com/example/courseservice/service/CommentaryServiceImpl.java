package com.example.courseservice.service;

import com.example.common.entity.Commentary;
import com.example.common.entity.Status;
import com.example.courseservice.dao.CommentaryMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.xml.stream.events.Comment;

@Service
public class CommentaryServiceImpl implements CommentaryService {

    @Resource
    CommentaryMapper commentaryMapper;

    @Override
    public Status addCommentary(Commentary commentary) {
        Status status = new Status();
        if(!commentaryMapper.addCommentary(commentary)){
            status.setStatus(400);
            status.setDescription("评论发布失败");
            return status;
        }
        status.setStatus(200);
        status.setDescription("评论发布成功");
        return status;
    }
}
