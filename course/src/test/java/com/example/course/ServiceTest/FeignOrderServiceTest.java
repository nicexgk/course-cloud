package com.example.course.ServiceTest;

import com.example.common.entity.Course;
import com.example.common.entity.Order;
import com.example.course.service.feign.FeignOrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.UUID;

@RunWith(SpringRunner.class)
@SpringBootTest
public class FeignOrderServiceTest {

    @Resource
    FeignOrderService feignOrderService;

    @Test
    public void addOrderTest(){
        Order order = new Order();
        order.setOrderStatus(1);
        order.setOrderUser(8);
        order.setOrderOn(UUID.randomUUID().toString());
        order.setOrderMoney(33);
        Course course = new Course();
        course.setCourseId(179);
        order.setOrderCourse(course);
        System.out.println(feignOrderService.addOrder(order));
    }

    @Test
    public void updateOrderStatusTest(){
        System.out.println(feignOrderService.updateOrderStatus("ee1a9e65-c098-4071-9d79-6d890ddc35b0", 0));
    }

    @Test
    public void getOrderTest(){
        System.out.println(feignOrderService.getOrderByOrderOn("7a1ffa5a-7c0a-432f-9a8b-f6df373869e4"));
    }

    @Test
    public void getOrderListBySidForPageSize(){
        System.out.println(feignOrderService.getOrderListBySidFoePageSize(8, 0 , 10));
    }
}
