package com.example.course.controller;

import com.example.common.entity.Course;
import com.example.common.entity.CourseType;
import com.example.common.entity.User;
import com.example.course.service.feign.FeignCourseService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import springfox.documentation.annotations.ApiIgnore;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@ApiIgnore
@Controller
public class IndexController {

    @Resource
    FeignCourseService feignCourseService;


    @GetMapping("/index.html")
    public String index(HttpServletRequest request){
        request.setAttribute("courseTypeCatalog", feignCourseService.getCourseType());
        return "/index.jsp";
    }

    @GetMapping("/coursemanagenav.html")
    public String courseManageNav(HttpServletRequest request) {
        ArrayList<CourseType> courseTypeArrayList = feignCourseService.getCourseType();
        request.setAttribute("courseTypeCatalog", courseTypeArrayList);
        return "/WEB-INF/views/course-manager-nav.jsp";
    }

    @GetMapping("/course/coursemanagenav.html")
    public String courseManageNav2(HttpServletRequest request) {
        ArrayList<CourseType> courseTypeArrayList = feignCourseService.getCourseType();
        request.setAttribute("courseTypeCatalog", courseTypeArrayList);
        return "/WEB-INF/views/course-manager-nav.jsp";
    }



    @GetMapping("/addcourse.html")
    public String addCourseManage(HttpServletRequest request) {
        ArrayList<CourseType> courseTypeArrayList = feignCourseService.getCourseType();
        request.setAttribute("courseTypeCatalog", courseTypeArrayList);
        return "/WEB-INF/views/add-course.jsp";
    }

    @GetMapping("/mycourselist.html")
    public String myCourseManage(HttpServletRequest request) {
        ArrayList<CourseType> courseTypeArrayList = feignCourseService.getCourseType();
        request.setAttribute("courseTypeCatalog", courseTypeArrayList);
        User user = (User)request.getSession().getAttribute("user");
        System.out.println("coursetyeplist.html");
        System.out.println(user);
        ArrayList<Course> userCourseList = feignCourseService.getUserCourseList(user.getUserId());
        request.setAttribute("userCourseList", userCourseList);
        return "/WEB-INF/views/my-course-list.jsp";
    }


    @GetMapping("/coursetypelist.html")
    public String courseTypeList(HttpServletRequest request) {
        ArrayList<CourseType> courseTypeArrayList = feignCourseService.getCourseType();
        request.setAttribute("courseTypeCatalog", courseTypeArrayList);
        return "/WEB-INF/views/course-type-list.jsp";
    }

    @GetMapping("/editorcourse.html")
    public String editorCourse(HttpServletRequest request){
        ArrayList<CourseType> courseTypeArrayList = feignCourseService.getCourseType();
        request.setAttribute("courseTypeCatalog", courseTypeArrayList);
        System.out.println("editorcourse.html");
        return "/WEB-INF/views/editor-course.jsp";
    }

    @GetMapping("/register.html")
    public String register(){
        return "/WEB-INF/views/register.jsp";
    }

    @GetMapping("/managerheader.html")
    public String managerHeader(){
        return "WEB-INF/views/common/manager-header.jsp";
    }

}
