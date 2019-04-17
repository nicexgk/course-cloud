package com.example.courseservice.dao;

import com.example.common.entity.Course;
import com.example.common.entity.StudentCourse;
import org.apache.ibatis.jdbc.SQL;

//  动态添加课程SQL提供类
public class DynamicSqlProvider {

    // 生成动态添加课程SQL
    public String addCourseProvide(Course course) {
        return new SQL() {
            {
                INSERT_INTO("course");
                String str = "";
                String val = "";
                boolean flag = false;
                if (course.getCourseTeacher() != null) {
                    if(flag)
                        str += ",";
                    flag = true;
                    str += "course_teacher_id";
                }
                if (course.getCoursePrice() != null) {
                    if(flag)
                        str += ",";
                    flag = true;
                    str += "course_price";
                }
                if (course.getCourseType() != null) {
                    if(flag)
                        str += ",";
                    flag = true;
                    str += "course_type";
                }
                if (course.getCoursePersonNumber() != null) {
                    if(flag)
                        str += ",";
                    flag = true;
                    str += "course_person_number";
                }
                if (course.getCourseName() != null) {
                    if(flag)
                        str += ",";
                    flag = true;
                    str += "course_name";
                }
                if (course.getDescription() != null) {
                    if(flag)
                        str += ",";
                    flag = true;
                    str += "description";
                }
                if (course.getPicUrl() != null) {
                    if(flag)
                        str += ",";
                    flag = true;
                    str += "pic_url";
                }
                if (course.getCourseDetail() != null) {
                    if(flag)
                        str += ",";
                    flag = true;
                    str += "course_detail";
                }

                flag = false;
                if (course.getCourseTeacher() != null) {
                    if(flag)
                        str += ",";
                    flag = true;
                    val += "#{courseTeacher.studentId}";
                }
                if (course.getCoursePrice() != null) {
                    if(flag)
                        val += ",";
                    flag = true;
                    val += "#{coursePrice}";
                }
                if (course.getCourseType() != null) {
                    if(flag)
                        val += ",";
                    flag = true;
                    val += "#{courseType}";
                }
                if (course.getCoursePersonNumber() != null) {
                    if(flag)
                        val += ",";
                    flag = true;
                    val += "#{coursePersonNumber}";
                }
                if (course.getCourseName() != null) {
                    if(flag)
                        val += ",";
                    flag = true;
                    val += "#{courseName}";
                }
                if (course.getDescription() != null) {
                    if(flag)
                        val += ",";
                    flag = true;
                    val += "#{description}";
                }
                if (course.getPicUrl() != null) {
                    if(flag)
                        val += ",";
                    flag = true;
                    val += "#{picUrl}";
                }
                if (course.getCourseDetail() != null) {
                    if(flag)
                        val += ",";
                    flag = true;
                    val += "#{courseDetail}";
                }
                VALUES(str, val);
            }
        }.toString();
    }

    // 生成动态修改课程SQL
    public String updateCourseProvide(Course course){
        return new SQL(){
            {
                UPDATE("course");
                if (course.getCourseType() != null)
                    SET("course_type = #{courseType}");
                if (course.getCourseName() != null)
                    SET("course_name = #{courseName}");
                if (course.getDescription() != null )
                    SET("description = #{description}");
                if (course.getCourseDetail() != null)
                    SET("course_detail = #{courseDetail}");
                if (course.getCoursePersonNumber() != null)
                    SET("course_person_number = #{coursePersonNumber}");
                if (course.getCoursePrice() != null)
                    SET("course_price = #{coursePrice}");
                if (course.getPicUrl() != null )
                    SET("pic_url = #{picUrl}");
                WHERE("course_id = #{courseId}");
            }
        }.toString();
    }

    // 生成动态的添加用户课程信息SQL
    public String insertUserCourseProvider(StudentCourse studentCourse){
        return new SQL(){
            {
                INSERT_INTO("student_course");
                String str = "";
                String val = "";
                boolean flag = false;
                if (studentCourse.getCourse() != null) {
                    if(flag){
                        str += ",";
                        val += ",";
                    }
                    flag = true;
                    str += "course_id";
                    val += "#{course.courseId}";
                }
                if(studentCourse.getOrderOn() != null){
                    if(flag){
                        str += ",";
                        val += ",";
                    }
                    flag = true;
                    str += "order_on";
                    val += "#{orderOn}";
                }
                if(studentCourse.getStudentId() != null){
                    if(flag){
                        str += ",";
                        val += ",";
                    }
                    flag = true;
                    str += "student_id";
                    val += "#{studentId}";
                }
                VALUES(str, val);
            }
        }.toString();
    }

}
