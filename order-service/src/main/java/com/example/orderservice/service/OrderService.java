package com.example.orderservice.service;

import com.example.common.entity.Order;
import com.example.common.entity.Status;

public interface OrderService {

    public Status addOrder(Order order);

    public Status updateOrderStatus(String orderOn, int status);

    public Order getOrderByOrderOn(String orderOn);

}
