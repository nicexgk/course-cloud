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
//                        @Result(property = "course", column = "course_id"),
    })
    public ArrayList<Course> queryUserCourseList(int id);

    @UpdateProvider(type = DynamicSqlProvider.class, method = "updateCourseProvide")
    public boolean updateCourse(Course course);

    @Select("select * from course t1 inner join user_info t2 on t1.course_teacher_id = t2.user_id and t1.course_id = #{arg0}")
    @Results({
            @Result(property = "courseId", column = "course_id"),
            @Result(property = "coursePrice", column = "course_price"),
            @Result(property = "courseType", column = "course_type"),
            @Result(property = "coursePersonNumber", column = "course_person_number"),
            @Result(property = "courseName", column = "course_name"),
            @Result(property = "description", column = "description"),
            @Result(property = "picUrl", column = "pic_url"),
            @Result(property = "courseDetail", column = "course_detail"),
            @Result(property = "courseDate", column = "course_date"),
            @Result(property = "courseTeacher.userId", column = "user_id"),
            @Result(property = "courseTeacher.userName", column = "user_name"),
            @Result(property = "courseTeacher.userIcon", column = "user_icon"),
    })
    public Course queryCourseByCid(int id);

    @InsertProvider(type = DynamicSqlProvider.class, method = "addCourseProvide")
    @Options(useGeneratedKeys = true, keyProperty = "courseId", keyColumn = "course_id")
    public boolean insertCourse(Course course);

    @Select("select * from course t1 inner join user_info t2 on t1.course_teacher_id = t2.user_id " +
            "and t1.course_type in ( " +
            "select t3.type_id from course_type t1 inner join course_type t2 on t2.parent_id = t1.type_id and t1.type_id = #{arg0} " +
            "inner join course_type t3 on t3.parent_id = t2.type_id " +
            "  union all " +
            "select t2.type_id from course_type t1 inner join course_type t2 on t2.parent_id = t1.type_id and t1.type_id = #{arg0} " +
            "  union all " +
            "select t1.type_id from course_type t1 where t1.type_id = #{arg0} " +
            ") order by t1.course_id desc limit #{arg1}, #{arg2}")
    @Results({
            @Result(property = "courseId", column = "course_id"),
            @Result(property = "coursePrice", column = "course_price"),
            @Result(property = "courseType", column = "course_type"),
            @Result(property = "coursePersonNumber", column = "course_person_number"),
            @Result(property = "courseName", column = "course_name"),
            @Result(property = "description", column = "description"),
            @Result(property = "picUrl", column = "pic_url"),
            @Result(property = "courseDetail", column = "course_detail"),
            @Result(property = "courseDate", column = "course_date"),
            @Result(property = "courseTeacher.userId", column = "user_id"),
            @Result(property = "courseTeacher.userName", column = "user_name"),
            @Result(property = "courseTeacher.userIcon", column = "user_icon"),
    })
    public ArrayList<Course> queryCourseByTypeForStartSize(int tid, int start, int size);

    @Select("select count(1) from course t1 inner join user_info t2 on t1.course_teacher_id = t2.user_id " +
            "and t1.course_type in ( " +
            "select t3.type_id from course_type t1 inner join course_type t2 on t2.parent_id = t1.type_id and t1.type_id = #{arg0} " +
            "inner join course_type t3 on t3.parent_id = t2.type_id " +
            "  union all " +
            "select t2.type_id from course_type t1 inner join course_type t2 on t2.parent_id = t1.type_id and t1.type_id = #{arg0} " +
            "  union all " +
            "select t1.type_id from course_type t1 where t1.type_id = #{arg0} " +
            ")")
    public int queryCourseByTypeForCount(int tid);

    @Select("select * from course t1 inner join user_info t2 on t1.course_teacher_id = t2.user_id order by t1.course_id desc limit #{arg0}, #{arg1}")
    @Results({
            @Result(property = "courseId", column = "course_id"),
            @Result(property = "coursePrice", column = "course_price"),
            @Result(property = "courseType", column = "course_type"),
            @Result(property = "coursePersonNumber", column = "course_person_number"),
            @Result(property = "courseName", column = "course_name"),
            @Result(property = "description", column = "description"),
            @Result(property = "picUrl", column = "pic_url"),
            @Result(property = "courseDetail", column = "course_detail"),
            @Result(property = "courseDate", column = "course_date"),
            @Result(property = "courseTeacher.userId", column = "user_id"),
            @Result(property = "courseTeacher.userName", column = "user_name"),
            @Result(property = "courseTeacher.userIcon", column = "user_icon"),
    })
    public ArrayList<Course> queryCourseStartSize(int start, int size);

    @Select("select count(1) from course t1 inner join user_info t2 on t1.course_teacher_id = t2.user_id")
    public int queryCourseCount();

    @Select("select * from course t1 inner join user_course t2 on t1.user_id = t2.course_id and user_id = #{arg0} limit #{arg1}, #{arg1}")
    @Results({
            @Result(property = "courseId", column = "course_id"),
            @Result(property = "coursePrice", column = "course_price"),
            @Result(property = "courseType", column = "course_type"),
            @Result(property = "coursePersonNumber", column = "course_person_number"),
            @Result(property = "courseName", column = "course_name"),
            @Result(property = "description", column = "description"),
            @Result(property = "picUrl", column = "pic_url"),
            @Result(property = "courseDetail", column = "course_detail"),
            @Result(property = "courseDate", column = "course_date"),
            @Result(property = "courseTeacher.userId", column = "user_id"),
            @Result(property = "courseTeacher.userName", column = "user_name"),
            @Result(property = "courseTeacher.userIcon", column = "user_icon"),
    })
    public ArrayList<Course> queryCourseByStudentForStartSize(int uid, int start, int size);

    @Select("select * from course t1 inner join user_info t2 on t1.course_teacher_id = t2.user_id and course_name like concat('%', #{arg0}, '%') limit #{arg1}, #{arg2}")
    @Results({
            @Result(property = "courseId", column = "course_id"),
            @Result(property = "coursePrice", column = "course_price"),
            @Result(property = "courseType", column = "course_type"),
            @Result(property = "coursePersonNumber", column = "course_person_number"),
            @Result(property = "courseName", column = "course_name"),
            @Result(property = "description", column = "description"),
            @Result(property = "picUrl", column = "pic_url"),
            @Result(property = "courseDetail", column = "course_detail"),
            @Result(property = "courseDate", column = "course_date"),
            @Result(property = "courseTeacher.userId", column = "user_id"),
            @Result(property = "courseTeacher.userName", column = "user_name"),
            @Result(property = "courseTeacher.userIcon", column = "user_icon"),
    })
    public ArrayList<Course> likeCourseByNameForStartSize(String name, int start, int size);

}
