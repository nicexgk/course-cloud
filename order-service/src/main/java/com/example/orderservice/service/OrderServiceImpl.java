package com.example.orderservice.service;

import com.example.common.entity.Order;
import com.example.common.entity.Status;
import com.example.orderservice.dao.OrderMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    OrderMapper orderMapper;

    @Override
    public Status addOrder(Order order) {
        Status status = new Status();
        if(!orderMapper.insertOrder(order)){
            status.setStatus(400);
            status.setDescription("订单创建失败");
            return status;
        }
        status.setStatus(200);
        status.setDescription("订单创建成功");
        return status;
    }

    @Override
    public Status updateOrderStatus(String orderOn, int status) {
        Status status1 = new Status();
        if(!orderMapper.updateOrderStatus(orderOn, status)){
            status1.setStatus(400);
            status1.setDescription("订单修改失败");
            return status1;
        }
        status1.setStatus(200);
        status1.setDescription("订单状态修改失败");
        return status1;
    }

    @Override
    public Order getOrderByOrderOn(String orderOn) {
        return orderMapper.queryOrderByOrderOn(orderOn);
    }
}
