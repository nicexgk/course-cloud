package com.example.courseservice.dao;

import com.example.common.entity.Commentary;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentaryMapper {

    @Insert("insert into commentary(commentary_user, commentary_course, commentary_grade, commentary_content)" +
            "values(#{commentUser.studentId}, #{commentCourse}, #{commentGrade}, #{commentContent})")
    public boolean addCommentary(Commentary commentary);
}
