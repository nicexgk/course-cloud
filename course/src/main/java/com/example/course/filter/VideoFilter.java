package com.example.course.filter;

import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import java.io.IOException;

@WebFilter(filterName = "nice", urlPatterns = {"/upload/video/**", "/login.html"})
public class VideoFilter implements Filter{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        System.out.println(req.getRequestURI());
        System.out.println(req.getPathInfo());
        System.out.println(req.getServletPath());
        System.out.println(req.getRemoteUser());
        System.out.println("===========================================");
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
