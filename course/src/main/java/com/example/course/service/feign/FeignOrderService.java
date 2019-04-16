package com.example.course.service.feign;

import com.example.common.entity.Order;
import com.example.common.entity.Status;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @description 调用order服务接口
 *
 */
@FeignClient(value = "order-service")
public interface FeignOrderService {

    @PostMapping("/order/")
    public Status addOrder(@RequestBody Order order);

    @PutMapping("/order/")
    public Status updateOrderStatus(@RequestParam("orderOn")String orderOn, @RequestParam("status") int status);

    @GetMapping("/order/{orderOn}")
    public Order getOrderByOrderOn(@PathVariable("orderOn") String OrderOn);

}
