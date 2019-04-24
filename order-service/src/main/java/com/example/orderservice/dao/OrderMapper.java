package com.example.orderservice.dao;

import com.example.common.entity.Order;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface OrderMapper {


    @Insert("insert into orders (order_on, order_user, order_course, order_money, order_status) values(#{orderOn}, #{orderUser}, #{orderCourse.courseId}, #{orderMoney}, #{orderStatus})")
    @Options(useGeneratedKeys = true, keyProperty = "orderId", keyColumn = "order_id")
    public boolean insertOrder(Order order);

    @Update("update orders set order_status = #{arg1} where order_on = #{arg0}")
    public boolean updateOrderStatus(String orderOn, int status);

    @Select("select * from orders t1 inner join course t2 on t1.order_course = t2.course_id and order_on = #{arg0}")
    @Results({
            @Result(property = "orderId" ,column = "order_id"),
            @Result(property = "orderOn", column = "order_On"),
            @Result(property = "orderUser", column = "order_user"),
            @Result(property = "orderMoney", column = "order_money"),
            @Result(property = "orderStatus", column = "order_status"),
            @Result(property = "orderCommentary", column = "order_commentary"),
            @Result(property = "orderDate", column = "order_date"),
            @Result(property = "orderCourse.courseId", column = "course_id"),
            @Result(property = "orderCourse.courseName", column = "course_name"),
            @Result(property = "orderCourse.picUrl", column = "pic_url"),
            @Result(property = "orderCourse.coursePrice", column = "course_price")
    })
    public Order queryOrderByOrderOn(String orderOn);

    @Select("select * from orders t1 inner join course t2 on t1.order_course = t2.course_id and t1.order_user = #{arg0} limit #{arg1}, #{arg2} ")
    @Results({
            @Result(property = "orderId" ,column = "order_id"),
            @Result(property = "orderOn", column = "order_On"),
            @Result(property = "orderUser", column = "order_user"),
            @Result(property = "orderMoney", column = "order_money"),
            @Result(property = "orderStatus", column = "order_status"),
            @Result(property = "orderCommentary", column = "order_commentary"),
            @Result(property = "orderDate", column = "order_date"),
            @Result(property = "orderCourse.courseId", column = "course_id"),
            @Result(property = "orderCourse.courseName", column = "course_name"),
            @Result(property = "orderCourse.picUrl", column = "pic_url"),
            @Result(property = "orderCourse.coursePrice", column = "course_price")
    })
    public ArrayList<Order> queryOrderListBySidStartSize(int sid, int start, int size);

    @Select("select count(1) from orders where order_user = #{arg0}")
    public int queryOrderCountBySid(int sid);
}
