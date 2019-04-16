package com.example.courseservice.dao;

import com.example.common.entity.StudentCourse;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface StudentCourseMapper {

    @InsertProvider(type = DynamicSqlProvider.class, method = "insertUserCourseProvider")
    @Options(useGeneratedKeys = true, keyProperty = "studentCourseId", keyColumn = "student_course_id")
    public boolean insertUserCourse(StudentCourse studentCourse);


    @Select("select * from student_course t1 inner join course t2 on t1.course_id = t2.course_id and t1.student_id = #{arg0} limit #{arg1}, #{arg2}")
    @Results({
            @Result(property = "studentCourseId", column = "student_course_id"),
            @Result(property = "studentId", column = "student_id"),
            @Result(property = "orderOn", column = "order_on"),
            @Result(property = "studentCourseDate", column = "student_course_date"),
            @Result(property = "course.courseId", column = "course_id"),
            @Result(property = "course.courseName", column = "course_name"),
            @Result(property = "course.picUrl", column = "picUrl"),
            @Result(property = "course.coursePrice", column = "course_price"),
            @Result(property = "course.courseDetail", column = "course_detail")
    })
    public ArrayList<StudentCourse> queryUserCourseByUserIdForStatSize(int sid, int start, int size);


    @Select("select * from student_course t1 inner join course t2 on t1.course_id = t2.course_id and t1.student_id = #{arg0} and t1.course_id = #{arg1} limit 1")
    @Results({
            @Result(property = "studentCourseId", column = "student_course_id"),
            @Result(property = "studentId", column = "student_id"),
            @Result(property = "orderOn", column = "order_on"),
            @Result(property = "studentCourseDate", column = "student_course_date"),
            @Result(property = "course.courseId", column = "course_id"),
            @Result(property = "course.courseName", column = "course_name"),
            @Result(property = "course.picUrl", column = "picUrl"),
            @Result(property = "course.coursePrice", column = "course_price"),
            @Result(property = "course.courseDetail", column = "course_detail")
    })
    public StudentCourse queryStudentBySidCid(int sid, int cid);
}
