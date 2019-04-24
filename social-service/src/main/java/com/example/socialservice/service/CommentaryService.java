package com.example.socialservice.service;

import com.example.common.entity.Commentary;
import com.example.common.entity.Status;
import com.example.common.entity.Superstate;

public interface CommentaryService {
    // 添加评论方法
    public Status addCommentary(Commentary commentary);

    // 根据课程查询评论
    public Superstate queryCommentaryByCidForPageSize(int cid, int page, int size);
}
