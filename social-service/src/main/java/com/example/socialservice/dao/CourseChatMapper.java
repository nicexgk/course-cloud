package com.example.socialservice.dao;

import com.example.common.entity.CourseChat;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;

@Mapper
public interface CourseChatMapper {

    @Insert("insert into course_chat(send_user, receive_course_id, content) values(#{sendUser.userId}, #{receiveCourseId}, #{content}) ")
    public boolean insertCourseChat(CourseChat courseChat);

    @Select("select * from course_chat t1 inner join user_info t2 on t1.send_user = t2.user_id and receive_course_id = #{arg0} limit #{arg1}, #{arg2}")
    public ArrayList<CourseChat> queryCourseChatListByCidForStartSize(int cid, int start, int size);

    @Select("select count(1) from course_chat where receive_course_id = #{arg0}")
    public int queryCourseChatCountByCid(int cid);

}
