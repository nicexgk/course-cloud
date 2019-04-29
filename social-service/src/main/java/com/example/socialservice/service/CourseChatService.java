package com.example.socialservice.service;

import com.example.common.entity.CourseChat;
import com.example.common.entity.Status;
import com.example.common.entity.Superstate;

public interface CourseChatService {
    public Status addCourseChat(CourseChat courseChat);

    public Superstate getCourseChatListByCidForPageSize(int cid, int page, int size);

}
