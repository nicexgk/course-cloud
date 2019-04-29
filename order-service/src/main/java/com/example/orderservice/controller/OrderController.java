package com.example.orderservice.controller;

import com.example.common.entity.Order;
import com.example.common.entity.Status;
import com.example.common.entity.Superstate;
import com.example.orderservice.service.OrderService;
import org.apache.ibatis.annotations.Delete;
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
    public Superstate getOrderListBySidForPageSize(@PathVariable("sid") int sid, @PathVariable("page") int page, @PathVariable("size") int size){
        return orderService.getOrderListBySidForPageSize(sid, page, size);
    }

    @DeleteMapping("/{sid}/{oid}")
    public Status deleteOrderByOid(@PathVariable("sid") int sid, @PathVariable("oid") int oid){
        return orderService.deleteOrderById(sid, oid);
    }

}
