package com.example.orderservice.controller;

import com.example.common.entity.Order;
import com.example.common.entity.Status;
import com.example.orderservice.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController()
@RequestMapping("/order")
public class OrderController {

    @Autowired
    OrderService orderService;

    @PostMapping("/")
    public Status addOrder(@RequestBody(required = true) Order order){
        return orderService.addOrder(order);
    }

    @PutMapping("/")
    public Status updateOrderStatus(@RequestParam("orderOn")String orderOn, @RequestParam("status")int status){
        return orderService.updateOrderStatus(orderOn, status);
    }

    @GetMapping("/{orderOn}")
    public Order getOrderByOrderOn(@PathVariable("orderOn") String orderOn){
        return orderService.getOrderByOrderOn(orderOn);
    }

    @GetMapping("/{sid}/{page}/{size}")
    public ArrayList<Order> getOrderListBySidForPageSize(@PathVariable("sid") int sid, @PathVariable("page") int page, @PathVariable("size") int size){
        return orderService.getOrderListBySidForPageSize(sid, page, size);
    }

}
