package com.example.course.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.example.common.entity.Course;
import com.example.common.entity.Order;
import com.example.course.config.AlipayConfig;
import com.example.course.service.feign.FeignCourseService;
import com.example.course.service.feign.FeignOrderService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/alipay")
public class AlipayTradeController {

    @Resource
    FeignOrderService feignOrderService;
    @Autowired
    RedisTemplate<String, Object> redisTemplate;

    @ApiOperation(value = "获取支付页面接口")
    @ApiImplicitParam(name = "orderOn", value = "订单编号")
    @GetMapping("/trade/page/{orderOn}")
    public void getTradePage(HttpServletResponse response, HttpServletRequest request, @PathVariable("orderOn") String orderOn) throws IOException, AlipayApiException {
        Order order = feignOrderService.getOrderByOrderOn(orderOn);
        Course course = order.getOrderCourse();
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
                AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key,
                AlipayConfig.sign_type);
        // 设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        System.out.println("订单编号为 ： " + orderOn);

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
        response.getWriter().write(result);
    }

    @ApiOperation("支付宝完成自付同步返回接口")
    @GetMapping("/trade/return/")
    public void orderTrade(HttpServletResponse response, HttpServletRequest request) throws IOException, ServletException {
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
        String out_trade_no = null;
        try {
            signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,
                    AlipayConfig.sign_type);
            // ——请在这里编写您的程序（以下代码仅作参考）——
            if (signVerified) {
                // 商户订单号
                out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
                // 支付宝交易号
                String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
                // 付款金额
                String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");
                Order order = (Order) redisTemplate.opsForValue().get(out_trade_no);
                if (order == null) {
                    order = feignOrderService.getOrderByOrderOn(out_trade_no);
                }
                if (order == null) {

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
        if (out_trade_no != null){
            Order order = feignOrderService.getOrderByOrderOn(out_trade_no);
            request.getRequestDispatcher("/course/page/" + order.getOrderCourse().getCourseId()).forward(request, response);
        }
    }

    @ApiOperation(value = "支付宝完成自付异步返回接口", notes = "此接口仅由支付宝自动调用")
    @RequestMapping("/trade/notify/")
    public String orderTradeNotify(HttpServletRequest request) throws IOException{
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
        String out_trade_no = null;
        try {
            signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,
                    AlipayConfig.sign_type);
            // ——请在这里编写您的程序（以下代码仅作参考）——
            if (signVerified) {
                // 商户订单号
                out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

                // 支付宝交易号
                String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

                // 付款金额
                String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

            } else {
                return "success";
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        } // 调用SDK验证签名
        catch (IOException e) {
            e.printStackTrace();
        }
        return "success";
    }

}
