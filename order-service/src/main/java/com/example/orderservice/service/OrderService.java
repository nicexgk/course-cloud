package com.example.orderservice.service;

import com.example.common.entity.Order;
import com.example.common.entity.Status;

import java.util.ArrayList;

public interface OrderService {

    public Status addOrder(Order order);

    public Status updateOrderStatus(String orderOn, int status);

    public Order getOrderByOrderOn(String orderOn);

    public ArrayList<Order> getOrderListBySidForPageSize(int sid, int page, int size);

}
