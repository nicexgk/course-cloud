package com.example.course.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.example.common.entity.*;
import com.example.course.config.AlipayConfig;
import com.example.course.service.feign.FeignCourseService;
import com.example.course.service.feign.FeignOrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;
import java.util.concurrent.TimeUnit;

@Api("订单接口")
@RestController
@RequestMapping("/order")
public class OrderController {

    @Resource
    FeignCourseService feignCourseService;
    @Resource
    FeignOrderService feignOrderService;
    @Autowired
    RedisTemplate<String, Object> redisTemplate;

    @ApiOperation("订单操作接口，用于完成用户的订单操作")
    @GetMapping("/trade/{cid}")
    public Status order(HttpServletRequest request,  @PathVariable("cid") int cid) throws IOException, AlipayApiException {
        Course course = feignCourseService.getCourseById(cid);
        Status status = null;
        User user = (User) request.getSession().getAttribute("user");
        Order order = new Order();
        order.setOrderCourse(course);
        order.setOrderUser(user.getUserId());
        order.setOrderOn(UUID.randomUUID().toString());
        order.setOrderMoney(course.getCoursePrice());
        order.setOrderCommentary(0);
        if (course.getCoursePrice() <= 0) {
            order.setOrderStatus(1);
            status = feignOrderService.addOrder(order);
            StudentCourse studentCourse = new StudentCourse();
            if (status.getStatus() == 200) {
                studentCourse.setStudentId(user.getUserId());
                studentCourse.setOrderOn(order.getOrderOn());
                studentCourse.setCourse(course);
                Status status1 = feignCourseService.addStudentCourse(studentCourse);
                if (status.getStatus() == 200) {
                    return  status;
                }
                status.setDescription("课程报名失败，请重试");
                return status1;
            }
            status = new Status();
            status.setStatus(400);
            status.setDescription("课程报名失败，请重试");
            return status;
        }
        status = new Status();
        status.setStatus(300);
        status.setResource(order.getOrderOn());
        order.setOrderStatus(0);
        Status status1 = feignOrderService.addOrder(order);
        if(status1.getStatus() != 200){
            return status1;
        }
        try{
            redisTemplate.opsForValue().set(order.getOrderOn(), order);
            redisTemplate.expire(order.getOrderOn(), 60 * 60 * 12, TimeUnit.SECONDS);
        } catch (Exception e){
            e.printStackTrace();
        }
        return status;
    }

    @ApiOperation(value = "分页查询学生订单列表信息接口", notes = "页数从0开始，不是1，用户必须登录了才可以访问该接口，否则将被拦截器拦截")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "page", value = "页数，从0开始"),
            @ApiImplicitParam(name = "size", value = "页的大小")
    })
    @GetMapping("/{page}/{size}")
    public Superstate getOrderListBySidForPageSize(HttpServletRequest request,@PathVariable("page") int page, @PathVariable("size")int size){
        page = page >= 0 ? page : 0;
        size = size >= 0 ? size : 0;
        User user = (User) request.getSession().getAttribute("user");
        // 调用订单服务接口，分页查询用户订单信息
        return feignOrderService.getOrderListBySidFoePageSize(user.getUserId(), page, size);
    }

    @ApiOperation(value = "删除订单接口", notes = "返回是否删除成功得状态")
    @DeleteMapping("/{oid}")
    public Status cancelOrder(HttpServletRequest request, @PathVariable("oid") int oid){
        User user = (User) request.getSession().getAttribute("user");
        return feignOrderService.deleteOrderBySidOid(user.getUserId(), oid);
    }

}
