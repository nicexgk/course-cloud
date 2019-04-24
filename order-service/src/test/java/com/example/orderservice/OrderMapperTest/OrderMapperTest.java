package com.example.orderservice.OrderMapperTest;


import com.example.common.entity.Course;
import com.example.common.entity.Order;
import com.example.orderservice.dao.OrderMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.UUID;

@RunWith(SpringRunner.class)
@SpringBootTest
public class OrderMapperTest {

    @Resource
    OrderMapper orderMapper;

    @Test
    public void insertOrderTest(){
        Order order  = new Order();
        Course course = new Course();
        course.setCourseId(179);
        order.setOrderCourse(course);
        order.setOrderUser(8);
        order.setOrderOn(UUID.randomUUID().toString());
        order.setOrderMoney(9999);
        order.setOrderStatus(0);

        System.out.println(orderMapper.insertOrder(order));
        System.out.println(order);
    }

    @Test
    public void updateOrderTest(){
        System.out.println(orderMapper.updateOrderStatus("7626fe1b-d756-4465-9a59-4a19e481ad25", 1));
    }

    @Test
    public void queryOrderByOrderOnTest(){

        System.out.println(orderMapper.queryOrderByOrderOn("7a1ffa5a-7c0a-432f-9a8b-f6df373869e4"));

    }

    @Test
    public void queryOrderBySidPageSizeTest(){
        System.out.println(orderMapper.queryOrderListBySidStartSize(8, 0  ,10 ));
    }

    @Test
    public void queryOrderCountBySid(){
        System.out.println(orderMapper.queryOrderCountBySid(21));
    }


}
