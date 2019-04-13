package com.example.courseservice.controller;

import com.example.common.entity.Commentary;
import com.example.common.entity.Status;
import com.example.courseservice.service.CommentaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.xml.stream.events.Comment;

@RestController
@RequestMapping("/commentary")
public class CommentaryController {

    @Autowired
    private CommentaryService commentaryService;

    @PostMapping("/")
    public Status commentaryCourse(@RequestBody Commentary commentary){
        Status status = null;
        System.out.println(commentary);
        return commentaryService.addCommentary(commentary);
    }


}
