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
//        registry.addResourceHandler("/upload/video/**").resourceChain(true).addResourceLocations("/upload/");

    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 登录拦截
        registry.addInterceptor(loginInterceptor).addPathPatterns("/collection/**")
                .addPathPatterns("/course/user/**")
                .addPathPatterns("/order/**")
                .addPathPatterns("/social/**")
                .addPathPatterns("/student/**")
                .addPathPatterns("/upload/image/")
                .addPathPatterns("/upload/video/")
                .addPathPatterns("/addcourse.html")
                .addPathPatterns("/download/")
                .addPathPatterns("/order.html")
                .addPathPatterns("/collection.html")
                .addPathPatterns("/userinfo.html")
                .addPathPatterns("/studentcourse.html")
                .addPathPatterns("editorcourse.html")
                .addPathPatterns("/commentary/**");

        // 权限拦截
        registry.addInterceptor(managerInterceptor).addPathPatterns("/addcourse.html")
                .addPathPatterns("/coursemanagenav.html")
                .addPathPatterns("/course/")
                .addPathPatterns("/course/user/")
                .addPathPatterns("/course/user/")
                .addPathPatterns("/editorcourse.html");
    }

}
