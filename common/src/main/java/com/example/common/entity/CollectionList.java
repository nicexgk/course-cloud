package com.example.common.entity;

import lombok.Data;

import java.io.Serializable;

/*
 * 
 * 
 * -- 2、收藏表
DROP TABLE IF EXISTS  collection_list;
CREATE TABLE  collection_list (
   collection_id  int(11) NOT NULL AUTO_INCREMENT,
   collection_user  int(11) DEFAULT NULL,
   collection_course  int(11) DEFAULT NULL,
   collection_date  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ( collection_id ),
  KEY  collection_user  ( collection_user ),
  KEY  collection_course  ( collection_course ),
  CONSTRAINT  collection_ibfk_1  FOREIGN KEY ( collection_user ) REFERENCES  user_info  ( user_id ),
  CONSTRAINT  collection_ibfk_2  FOREIGN KEY ( collection_course ) REFERENCES  course  ( course_id )
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 * 
 * 
 */

/**
 * 收藏表
 *
 * @author A1621
 */
@Data
public class CollectionList implements Serializable {
    private static final long serialVersionUID = 1L;
    // 收藏id
    private Integer collectionId;
    // 收藏的用户
    private Integer collectionUser;
    // 收藏对应的课程
    private Course collectionCourse;
    // 收藏的时间
    private String collectionDate;

}
