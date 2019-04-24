package com.example.socialservice.controller;

import com.example.common.entity.Commentary;
import com.example.common.entity.Status;
import com.example.common.entity.Superstate;
import com.example.socialservice.service.CommentaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


// 评论控制器
@RestController
@RequestMapping("/commentary")
public class CommentaryController {

    @Autowired
    private CommentaryService commentaryService;

    // 添加评论接口
    @PostMapping("/")
    public Status commentaryCourse(@RequestBody Commentary commentary) {
        Status status = null;
        System.out.println(commentary);
        return commentaryService.addCommentary(commentary);
    }

    // 根据课程Cid分页查询课程评论接口
    @GetMapping("/{cid}/{page}/{size}")
    public Superstate queryCommentaryListByCidForPageSize(@PathVariable("cid") int cid, @PathVariable("page") int page, @PathVariable("size") int size) {
        return commentaryService.queryCommentaryByCidForPageSize(cid, page, size);
    }

}
