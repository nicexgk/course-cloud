package com.example.common.entity;

import lombok.Data;

import java.io.Serializable;

/*
 * 
 * 
 * -- 9、用户课程表
DROP TABLE IF EXISTS  user_course ;
CREATE TABLE  user_course  (
   user_course_id  int(11) NOT NULL AUTO_INCREMENT,
   user_id  int(11) DEFAULT NULL,
   course_id  int(11) DEFAULT NULL,
   user_course_date  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ( user_course_id ),
  KEY  user_id  ( user_id ),
  KEY  course_id  ( course_id ),
  CONSTRAINT  user_course_ibfk_1  FOREIGN KEY ( user_id ) REFERENCES  user_info  ( user_id ),
  CONSTRAINT  user_course_ibfk_2  FOREIGN KEY ( course_id ) REFERENCES  course  ( course_id )
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

 * 
 * 
 */

/**
 * 用户课程表
 *
 * @author A1621
 */
@Data
public class UserCourse implements Serializable {
    private static final long serialVersionUID = 1L;
    // 用户课程表对应的id
    private Integer userCourseId;
    // 用户对应的id
    private Integer userId;
    // 课程对象
    private Course course;
    // 用户参加课程的时间
    private String userCourseDate;

}
