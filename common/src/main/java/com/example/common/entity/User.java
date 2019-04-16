package com.example.common.entity;

import lombok.Data;

import java.io.Serializable;

/*
 * 
 * 
-- 8、用户信息表
-- 8、用户信息表
DROP TABLE IF EXISTS  user_info ;
CREATE TABLE  user_info  (
   user_id  int(11) NOT NULL AUTO_INCREMENT,
   user_type  int(11) DEFAULT NULL,
   user_on  varchar(20) DEFAULT NULL,
   user_name  varchar(50) DEFAULT NULL,
   user_pwd  varchar(36) DEFAULT '123456',
   user_email  varchar(50) DEFAULT NULL,
   user_phone  varchar(11) DEFAULT NULL,
   user_address  varchar(500) DEFAULT NULL,
   user_icon  varchar(200) DEFAULT 'icon/d24.jpg',
   user_introduce  text DEFAULT '这人很懒什么也没留下',
   user_date  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ( user_id ),
  UNIQUE KEY  uaerPhone_unique  ( user_on ),
  UNIQUE KEY  user_email_unique  ( user_email )
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
 * 
 */
@Data
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    // 用户id
    private Integer userId;
    // 用户类型
    private Integer userType;
    // 用户学号
    private String userOn;
    // 用户名称
    private String userName;
    // 用户性别
    private Integer userSex;
    // 个性签名
    private String userAutograph;
    // 用户密码
    private String userPwd;
    // 用户邮箱
    private String userEmail;
    // 用户手机
    private String userPhone;
    // 用户地址
    private String userAddress;
    // 用户图标
    private String userIcon;
    // 用户描述
    private String userDescription;
    // 用户创建日期
    private String userDate;

}
