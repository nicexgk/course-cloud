package com.example.orderservice.service;

import com.example.common.entity.Order;
import com.example.common.entity.Status;
import com.example.common.entity.Superstate;

import java.util.ArrayList;

public interface OrderService {

    public Status addOrder(Order order);

    public Status updateOrderStatus(String orderOn, int status);

    public Order getOrderByOrderOn(String orderOn);

    public Superstate getOrderListBySidForPageSize(int sid, int page, int size);

    public Status deleteOrderById(int sid, int oid);
}
