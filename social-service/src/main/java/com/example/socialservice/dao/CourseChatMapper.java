package com.example.socialservice.dao;

import com.example.common.entity.CourseChat;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface CourseChatMapper {

    @Insert("insert into course_chat(send_user, receive_course_id, content) values(#{sendUser.userId}, #{receiveCourseId}, #{content}) ")
    public boolean insertCourseChat(CourseChat courseChat);

    @Select("select * from course_chat t1 inner join user_info t2 on t1.send_user = t2.user_id and receive_course_id = #{arg0} limit #{arg1}, #{arg2}")
    @Results({
            @Result(property = "courseChatId", column = "course_chat_id"),
            @Result(property = "receiveCourseId", column = "receive_course_id"),
            @Result(property = "content", column = "content"),
            @Result(property = "courseChatDate", column = "course_chat_date"),
            @Result(property = "sendUser.userId", column = "user_id"),
            @Result(property = "sendUser.userName", column = "user_name"),
            @Result(property = "sendUser.userIcon", column = "user_icon"),
            @Result(property = "sendUser.userSex", column = "user_sex"),
    })
    public ArrayList<CourseChat> queryCourseChatListByCidForStartSize(int cid, int start, int size);

    @Select("select count(1) from course_chat where receive_course_id = #{arg0}")
    public int queryCourseChatCountByCid(int cid);

}
