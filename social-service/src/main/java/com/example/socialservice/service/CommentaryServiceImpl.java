package com.example.socialservice.service;

import com.example.common.entity.Commentary;
import com.example.common.entity.Status;
import com.example.common.entity.Superstate;
import com.example.socialservice.dao.CommentaryMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
public class CommentaryServiceImpl implements CommentaryService{

    @Resource
    private CommentaryMapper commentaryMapper;

    @Override
    public Status addCommentary(Commentary commentary) {
        Status status = new Status();
        if (commentary.getCommentGrade() == null){
            commentary.setCommentGrade(1);
        } else {
            int grade;
            grade = commentary.getCommentGrade() > 5 ? 5 : commentary.getCommentGrade();
            commentary.setCommentGrade(grade);
            grade = commentary.getCommentGrade() <= 0 ? 0 : commentary.getCommentGrade();
            commentary.setCommentGrade(grade);
        }
        if (!commentaryMapper.insertCommentary(commentary)){
            status.setStatus(400);
            status.setDescription("评论添加失败");
            return status;
        }
        status.setStatus(200);
        status.setDescription("评论添加成功");
        return status;
    }


    // 根据课程的id分页查询课程的评论
    @Override
    public Superstate queryCommentaryByCidForPageSize(int cid, int page, int size) {
        Superstate superstate = new Superstate();
        page = page >= 0 ? page : 0;
        size = size >= 0 ? size : 0;
        superstate.setSize(size);
        superstate.setPage(page);
        ArrayList<Commentary> commentaryList = commentaryMapper.queryCommentaryByCidForStartSize(cid, page * size, size);
        int count = commentaryMapper.queryCommentaryByCidCount(cid);
        superstate.setCount(count);
        superstate.setResource(commentaryList);
        return superstate;
    }
}
