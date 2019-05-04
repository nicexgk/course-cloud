package com.example.common.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;

/*
 * 
 * DROP TABLE IF EXISTS  catalog ;
   CREATE TABLE  catalog_list  (
   catalog_id  int(11) NOT NULL AUTO_INCREMENT,
   parent_id   int(11) DEFAULT NULL,
   catalog_course  int(11) DEFAULT NULL,
   catalog_order  int(11) DEFAULT NULL,
   catalog_type int(11)DEFAULT 0,
   catalog_name  varchar(200) DEFAULT NULL,
   catalog_content varchar(200) DEFAULT NULL,
  PRIMARY KEY ( catalog_id ),
  KEY  catalog_course  ( catalog_course ),
  CONSTRAINT  catalog_ibfk_1  FOREIGN KEY ( parent_id ) REFERENCES  catalog  ( catalog_list ) ON DELETE CASCADE
  CONSTRAINT  catalog_ibfk_2  FOREIGN KEY ( catalog_course ) REFERENCES  course  ( course_id ) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
 * 
 * 
 */

/**
 * 目录类
 *
 * @author A1621
 *
 */
@Data
public class Catalog implements Serializable {
    private static final long serialVersionUID = 1L;
    // 目录id
    private Integer catalogId;
    // 目录的父类id
    private Integer parentId;
    // 目录所在的课程
    private Integer catalogCourse;
    // 目录的循序
    private Integer catalogOrder;
    // 目录的类型 0 代表目录，1代表视频，2代表课件
    private Integer catalogType;
    // 目录的名字
    private String catalogName;
    // 目录的内容一般为url路径
    private String catalogResource;
    // 目录创建的时间
    private String catalogDate;
    //该目录下的所有子类
    private ArrayList<Catalog> childList;

}
