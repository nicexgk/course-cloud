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

    @ApiOperation("订单操作接口，用户完成用户的呢订单操作")
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
//        if (course.getCoursePrice() <= 0) {
        if(true){
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
        status.setResource(createTradeInfo(course));

        order.setOrderStatus(0);
        Status status1 = feignOrderService.addOrder(order);
        if(status1.getStatus() != 200){
            return status1;
        }
        redisTemplate.opsForValue().set(order.getOrderOn(), order);
        redisTemplate.expire(order.getOrderOn(), 60 * 60 * 12, TimeUnit.SECONDS);
        return status;
    }

    @ApiOperation("支付宝完成自付同步返回接口")
    @GetMapping("/trade/return/")
    public void orderTrade(HttpServletResponse response, HttpServletRequest request) throws UnsupportedEncodingException {

        System.out.println("nice nice nice nic enic enice nie");
        System.out.println("this createTradeInfo return url");

        // 获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        boolean signVerified;
        try {
            signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,
                    AlipayConfig.sign_type);
            // ——请在这里编写您的程序（以下代码仅作参考）——
            if (signVerified) {
                // 商户订单号
                String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
                // 支付宝交易号
                String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
                // 付款金额
                String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");
                Order order = (Order) redisTemplate.opsForValue().get(out_trade_no);
                if(order == null){
                    order = feignOrderService.getOrderByOrderOn(out_trade_no);
                }
                if(order == null){

                }
                feignOrderService.updateOrderStatus(out_trade_no, 1);
                response.getWriter().write("trade_no:" + trade_no + "<br/>out_trade_no:" + out_trade_no
                        + "<br/>total_amount:" + total_amount);
            } else {
                response.getWriter().write("验签失败");
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        } // 调用SDK验证签名
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    @ApiOperation("支付宝完成自付异步返回接口")
    @RequestMapping("/trade/notify/")
    public void orderTradeNotify(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        /*
         * * 功能：支付宝服务器同步通知页面 日期：2017-03-30 说明：
         * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
         * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
         *************************
         *
         * 页面功能说明************************* 该页面仅做页面展示，业务逻辑处理请勿在该页面执行
         */
        System.out.println("nice nice nice nic enic enice nie");
        System.out.println("this createTradeInfo notify url");

        // 获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        boolean signVerified;
        try {
            signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,
                    AlipayConfig.sign_type);
            // ——请在这里编写您的程序（以下代码仅作参考）——
            if (signVerified) {
                // 商户订单号
                String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

                // 支付宝交易号
                String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

                // 付款金额
                String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

                response.getWriter().write("trade_no:" + trade_no + "<br/>out_trade_no:" + out_trade_no
                        + "<br/>total_amount:" + total_amount);
            } else {
                response.getWriter().write("验签失败");
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        } // 调用SDK验证签名
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    @ApiOperation(value = "分页查询用户订单接口", notes = "页数是从0开始不是1")
    @GetMapping("/{page}/{size}")
    public ArrayList<Order> getOrderListBySidForPageSize(HttpServletRequest request,@PathVariable("page") int page, @PathVariable("size")int size){
        page = page >= 0 ? page : 0;
        size = size >= 0 ? size : 0;
        User user = (User) request.getSession().getAttribute("user");
        return feignOrderService.getOrderListBySidFoePageSize(user.getUserId(), page, size);
    }

    public String createTradeInfo(Course course) throws UnsupportedEncodingException, AlipayApiException {
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
                AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key,
                AlipayConfig.sign_type);
        // 设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        String orderOn = UUID.randomUUID().toString();
        System.out.println("订单编号为 ： " + orderOn);

        String str = "<!DOCTYPE html><html><head><meta charset=\"utf-8\"></head><body>";

        // 商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = new String(orderOn.getBytes("ISO-8859-1"), "UTF-8");
        // 付款金额，必填
        String total_amount = new String(Integer.toString(course.getCoursePrice()).getBytes("ISO-8859-1"), "UTF-8");
        // 订单名称，必填
        String subject = new String(course.getCourseName().getBytes("ISO-8859-1"), "UTF-8");
        // 商品描述，可空
        String body = new String((course.getCourseName() + ",课程的购买").getBytes("ISO-8859-1"), "UTF-8");

        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"," + "\"total_amount\":\"" + total_amount
                + "\"," + "\"subject\":\"" + subject + "\"," + "\"body\":\"" + body + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        result = str + result;
        result += "</head><body>";
        return result;
    }

}
