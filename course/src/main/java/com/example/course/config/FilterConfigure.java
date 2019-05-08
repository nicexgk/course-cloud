package com.example.course.config;

import com.example.course.filter.VideoFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class FilterConfigure {
//    @Autowired
//    private VideoFilter videoFilter;
//
//    @Bean
//    public FilterRegistrationBean videoFilters() {
//        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
//        registrationBean.setFilter(videoFilter);
//        registrationBean.addUrlPatterns("/upload/video/**", "/login.html");
//        registrationBean.setName("VideoFilter");
//        registrationBean.setOrder(1);
//        return registrationBean;
//    }

}
