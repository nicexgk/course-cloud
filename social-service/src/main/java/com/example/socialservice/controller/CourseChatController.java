package com.example.socialservice.controller;

import com.example.common.entity.CourseChat;
import com.example.common.entity.Status;
import com.example.common.entity.Superstate;
import com.example.socialservice.service.CourseChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/course/chat")
public class CourseChatController {
    @Autowired
    private CourseChatService courseChatService;

    @PostMapping("/")
    public Status addCourseChat(@RequestBody CourseChat courseChat) {
        return courseChatService.addCourseChat(courseChat);
    }

    @GetMapping("/{cid}/{page}/{size}")
    public Superstate getCourseChatListByCidForPageSize(@PathVariable("cid") int cid, @PathVariable("page") int page, @PathVariable("size") int size) {
        return courseChatService.getCourseChatListByCidForPageSize(cid, page, size);
    }

}
