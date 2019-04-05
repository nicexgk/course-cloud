package com.example.common.entity;

import lombok.Data;

import java.io.Serializable;

/*
 * 
 * 
 * 
 * -- 3、评论表
DROP TABLE IF EXISTS  comments ;
CREATE TABLE  comments  (
   comment_id  int(11) NOT NULL AUTO_INCREMENT,
   comment_user  int(11) DEFAULT NULL,
   comment_grade  int(11) DEFAULT '5',
   comment_course  int(11) DEFAULT NULL,
   comment_content varchar(1000) DEFAULT NULL,
   comment_date  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ( comment_id ),
  KEY  comment_user  ( comment_user ),
  KEY  comment_course  ( comment_course ),
  CONSTRAINT  comments_ibfk_1  FOREIGN KEY ( comment_user ) REFERENCES  user_info  ( user_id ) ON DELETE CASCADE,
  CONSTRAINT  comments_ibfk_2  FOREIGN KEY ( comment_course ) REFERENCES  course  ( course_id ) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

 * 
 * 
 */

/**
 * 课程评论表
 *
 * @author A1621
 */
@Data
public class Commentary implements Serializable {
    private static final long serialVersionUID = 1L;
    // 评论id
    private Integer commentId;
    // 评论的用户
    private User commentUser;
    // 评论的评分
    private Integer commentGrade;
    // 评论的课程
    private Integer commentCourse;
    // 评论的内容
    private String commentContent;
    // 评论的日期
    private String commentDate;

}
