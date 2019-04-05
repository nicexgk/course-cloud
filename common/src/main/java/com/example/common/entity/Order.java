package com.example.common.entity;

import lombok.Data;

import java.io.Serializable;

/*
 * 
 * 
 * -- 7、订单表
DROP TABLE IF EXISTS  orders ;
CREATE TABLE  orders  (
   order_id  int(11) NOT NULL AUTO_INCREMENT,
   order_on  varchar(36) DEFAULT NULL,
   order_status  int(11) DEFAULT '0',
   order_user  int(11) DEFAULT NULL,
   order_course  int(11) DEFAULT NULL,
   order_date  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ( order_id ),
  UNIQUE KEY  order_on  ( order_on ),
  KEY  order_user  ( order_user ),
  KEY  order_course  ( order_course ) USING BTREE,
  CONSTRAINT  orders_ibfk_1  FOREIGN KEY ( order_user ) REFERENCES  user_info  ( user_id ),
  CONSTRAINT  orders_ibfk_2  FOREIGN KEY ( order_course ) REFERENCES  course  ( course_id )
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

 * 
 * 
 */

/**
 * 订单类
 *
 * @author A1621
 */
@Data
public class Order implements Serializable {
    private static final long serialVersionUID = 1L;
    // 订单id
    private Integer orderId;
    // 订单编号
    private Integer orderOn;
    // 订单状态
    private Integer orderStatus;
    // 订单的用户
    private Integer orderUser;
    // 订单的对应的课程
    private Course orderCourse;
    // 订单的金额
    private Double orderMoney;
    // 订单创建日期
    private String orderDate;


}
