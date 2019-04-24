package com.example.socialservice.dao;

import com.example.common.entity.Commentary;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface CommentaryMapper {

    @Insert("insert into commentary(commentary_user, commentary_course, commentary_grade, commentary_content)" +
            "values(#{commentUser.userId}, #{commentCourse}, #{commentGrade}, #{commentContent})")
    public boolean insertCommentary(Commentary commentary);

    @Select("select * from commentary t1 inner join user_info t2 on t1.commentary_user = t2.user_id and commentary_course = #{arg0} limit #{arg1}, #{arg2}")
    @Results({
            @Result(property = "commentId", column = "commentary_id"),
            @Result(property = "commentContent", column = "commentary_content"),
            @Result(property = "commentGrade", column = "commentary_grade"),
            @Result(property = "commentCourse", column = "commentary_course"),
            @Result(property = "commentDate", column = "commentary_date"),
            @Result(property = "commentUser.userId", column = "user_id"),
            @Result(property = "commentUser.userName", column = "user_name"),
            @Result(property = "commentUser.userIcon", column = "user_icon"),
    })
    public ArrayList<Commentary> queryCommentaryByCidForStartSize(int cid, int start, int size);

    @Select("select count(1) from commentary where commentary_course = #{arg0}")
    public int queryCommentaryByCidCount(int cid);

}
