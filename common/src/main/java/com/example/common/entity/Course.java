package com.example.common.entity;

import lombok.Data;

import java.io.Serializable;

/*
 * 
 * 
 * -- 5、课程表
DROP TABLE IF EXISTS  course ;
CREATE TABLE  course  (
   course_id  int(11) NOT NULL AUTO_INCREMENT,
   course_teacher_id  int(11) DEFAULT '4',
   course_price  int(11) DEFAULT '0',
   course_type  int(11) DEFAULT NULL,
   course_person_number  varchar(255) DEFAULT NULL,
   course_name  varchar(50) DEFAULT NULL,
   description  text,
   pic_url  varchar(200) DEFAULT 'icon/6.jpg',
   course_content_list varchar(50) DEFAULT NULL,
   course_date  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ( course_id ),
  KEY  course_teacher_id  ( course_teacher_id ),
  KEY  course_course_type_fk  ( course_type ),
  CONSTRAINT  course_ibfk_1  FOREIGN KEY ( course_teacher_id ) REFERENCES  user_info  ( user_id ) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

 * 
 * 
 */

/**
 * 课程类
 *
 * @author A1621
 */
@Data
public class Course implements Serializable {
    private static final long serialVersionUID = 1L;
    // 课程id
    private Integer courseId;
    // 课程教师
    private User courseTeacher;
    // 课程价格
    private Integer coursePrice;
    // 课程类型
    private Integer courseType;
    // 课程编号
    private String coursePersonNumber;
    // 课程名字
    private String courseName;
    // 课程描述
    private String description;
    // 课程图标url路径
    private String picUrl;
    // 课程内容列表
    private String courseDetail;
    // 课程创建日期
    private String courseDate;

}
