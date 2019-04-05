package com.example.common.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;

/*
 * 
 * 
 * -- 6、课程类型表
DROP TABLE IF EXISTS  course_type ;
CREATE TABLE  course_type  (
   type_id  int(11) NOT NULL AUTO_INCREMENT,
   parent_id  int(11) DEFAULT '1',
   type_name  varchar(255) DEFAULT NULL,
  PRIMARY KEY ( type_id ),
  CONSTRAINT  parent_id_k1  FOREIGN KEY ( parent_id ) REFERENCES  course_type  ( type_id ) ON DELETE SET DELETE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

 * 
 * 
 */

/**
 * 课程类型表
 *
 * @author A1621
 */
@Data
public class CourseType implements Serializable {
    private static final long serialVersionUID = 1L;
    // 类型的Id
    private Integer typeId;
    // 类型的父类Id
    private Integer parentId;
    // 类型的名字
    private String typeName;
    // 类型的日期
    private String typeDate;
    // 保存子类类型的列表
    private ArrayList<CourseType> childList;


}
