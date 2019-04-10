package com.example.courseservice.dao;

import com.example.common.entity.Course;
import com.example.common.entity.CourseType;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.jdbc.SQL;
import org.hibernate.validator.constraints.ParameterScriptAssert;

import java.util.ArrayList;

@Mapper
public interface CourseMapper {


    @Select("select * from course t1 where t1.course_teacher_id = #{arg0}")
    @Results({
            @Result(property = "courseId", column = "course_id"),
            @Result(property = "coursePrice", column = "course_price"),
            @Result(property = "courseType", column = "course_type"),
            @Result(property = "coursePersonNumber", column = "course_person_number"),
            @Result(property = "courseName", column = "course_name"),
            @Result(property = "description", column = "description"),
            @Result(property = "picUrl", column = "pic_url"),
            @Result(property = "courseDetail", column = "course_detail"),
            @Result(property = "courseDate", column = "course_date")
            //            @Result(property = "course", column = "course_id"),
    })
    public ArrayList<Course> queryUserCourseList(int id);

    @UpdateProvider(type = DynamicSqlProvider.class, method = "updateCourseProvide")
    public boolean updateCourse(Course course);

    @Select("select * from course t1 where t1.course_id = #{arg0}")
    @Results({
            @Result(property = "courseId", column = "course_id"),
            @Result(property = "coursePrice", column = "course_price"),
            @Result(property = "courseType", column = "course_type"),
            @Result(property = "coursePersonNumber", column = "course_person_number"),
            @Result(property = "courseName", column = "course_name"),
            @Result(property = "description", column = "description"),
            @Result(property = "picUrl", column = "pic_url"),
            @Result(property = "courseDetail", column = "course_detail"),
            @Result(property = "courseDate", column = "course_date")
//            @Result(property = "course.teacher", column = "course_id"),
    })
    public Course queryCourseById(int id);

    public ArrayList<Course> queryCourseByName(String name);

    public ArrayList<Course> getCourse(int size);

    public ArrayList<Course> queryCourseByTeacher(String teacher, int size);

    @InsertProvider(type = DynamicSqlProvider.class, method = "addCourseProvide")
    @Options(useGeneratedKeys = true, keyProperty = "courseId", keyColumn = "course_id")
    public boolean addCourse(Course course);

}
