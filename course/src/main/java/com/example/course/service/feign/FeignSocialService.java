package com.example.course.service.feign;

import org.springframework.cloud.openfeign.FeignClient;
/**
 *
 * @description 调用social服务接口
 *
 */
@FeignClient(value = "social-service")
public interface FeignSocialService {
}
