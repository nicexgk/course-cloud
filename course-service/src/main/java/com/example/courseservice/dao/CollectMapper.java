package com.example.courseservice.dao;

import com.example.common.entity.Collect;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface CollectMapper {

    @Insert("insert collect (collect_user, collect_course) values(#{arg0}, #{arg1})")
    public boolean insertCollect(int sid, int cid);

    @Delete("delete from collect where collect_user = #{arg0} and collect_course = #{arg1}")
    public boolean deleteCollect(int sid, int cid);

    @Select("select * from collect t1 inner join course t2 on t1.collect_course = t2.course_id where t1.collect_user = #{arg0} limit #{arg1}, #{arg2}")
    @Results({
            @Result(property = "collectId", column = "collect_id"),
            @Result(property = "collectUser", column = "collect_user"),
            @Result(property = "collectDate", column = "collect_date"),
            @Result(property = "collectCourse.courseId", column = "course_id"),
            @Result(property = "collectCourse.courseName", column = "course_Name"),
            @Result(property = "collectCourse.courseDetail", column = "course_detail"),
            @Result(property = "collectCourse.picUrl", column = "pic_url"),
            @Result(property = "collectCourse.coursePrice", column = "course_price"),
    })
    public ArrayList<Collect> queryCollectListBySidForStartSize(int sid, int start, int size);

    @Select("select * from collect t1 inner join course t2 on t1.collect_course = t2.course_id and t1.collect_user = #{arg0} and t1.collect_course = #{arg1}")
    @Results({
            @Result(property = "collectId", column = "collect_id"),
            @Result(property = "collectUser", column = "collect_user"),
            @Result(property = "collectDate", column = "collect_date"),
            @Result(property = "collectCourse.courseId", column = "course_id"),
            @Result(property = "collectCourse.courseName", column = "course_Name"),
            @Result(property = "collectCourse.courseDetail", column = "course_detail"),
            @Result(property = "collectCourse.picUrl", column = "pic_url"),
            @Result(property = "collectCourse.coursePrice", column = "course_price"),
    })
    public Collect queryCollectBySidCid(int sid, int cid);

    @Select("select count(1) from collect where collect_user = #{arg0}")
    public int queryCollectCount(int sid);
}
