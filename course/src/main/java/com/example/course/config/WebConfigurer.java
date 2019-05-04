package com.example.course.config;

import com.example.course.interceptor.LoginInterceptor;
import com.example.course.interceptor.ManagerInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfigurer implements WebMvcConfigurer {

    @Autowired
    private LoginInterceptor loginInterceptor;

    @Autowired
    private ManagerInterceptor managerInterceptor;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 登录拦截
        registry.addInterceptor(loginInterceptor).addPathPatterns("/collection/*")
                .addPathPatterns("/course/user/*")
                .addPathPatterns("/order/*")
                .addPathPatterns("/social/*")
                .addPathPatterns("/student/*")
                .addPathPatterns("/upload/*").addPathPatterns("/addcourse.html")
                .addPathPatterns("editorcourse.html")
                .addPathPatterns("/commentary/*");

        // 权限拦截
        registry.addInterceptor(managerInterceptor).addPathPatterns("/addcourse.html")
                .addPathPatterns("/coursemanagenav.html")
                .addPathPatterns("/course/")
                .addPathPatterns("/editorcourse.html");
    }

}
