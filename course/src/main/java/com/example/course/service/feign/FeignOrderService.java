package com.example.course.service.feign;

import org.springframework.cloud.openfeign.FeignClient;

/**
 *
 * @description 调用order服务接口
 *
 */
@FeignClient(value = "order-service")
public interface FeignOrderService {
}
