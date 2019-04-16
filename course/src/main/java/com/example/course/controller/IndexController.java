package com.example.course.controller;

import com.example.common.entity.*;
import com.example.course.service.feign.FeignCourseService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import springfox.documentation.annotations.ApiIgnore;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.concurrent.*;

@ApiIgnore
@Controller
public class IndexController {
    //创建一个固定大小的线程池用于调用服务
    public static ExecutorService executorService = Executors.newFixedThreadPool(15);

    @Resource
    FeignCourseService feignCourseService;
    @Autowired
    ObjectMapper objectMapper;

    @ModelAttribute
    public void addAttribute(HttpServletRequest request){
        ArrayList<CourseType> courseTypeArrayList = feignCourseService.getCourseType();
        request.setAttribute("courseTypeCatalog", courseTypeArrayList);
    }

    @ApiOperation(value = "首页数据填充")
    @GetMapping("/index")
    public String index1(HttpServletRequest request) {
        ArrayList<CourseType> courseTypes = (ArrayList<CourseType>) request.getAttribute("courseTypeCatalog");
        FutureTask<?> futureTasks[] = new FutureTask[courseTypes.size()];
        int i = 0;
        for (CourseType courseType : courseTypes) {
            futureTasks[i] = new FutureTask<LinkedHashMap<String, ArrayList<Course>>>(new Callable<LinkedHashMap<String, ArrayList<Course>>>() {
                @Override
                public LinkedHashMap<String, ArrayList<Course>> call() throws Exception {
                    return feignCourseService.getCourseTopNumByParentType(courseType.getTypeId(), 0, 8);
                }
            });
            executorService.submit(futureTasks[i]);
            i++;
        }

        FutureTask<ArrayList<Course>> popularFuture = new FutureTask<>(new Callable<ArrayList<Course>>() {
            @Override
            public ArrayList<Course> call() throws Exception {
                return feignCourseService.getPopularCourseList(0, 8);
            }
        });
        FutureTask<ArrayList<Course>> purchaseFuture = new FutureTask<>(new Callable<ArrayList<Course>>() {
            @Override
            public ArrayList<Course> call() throws Exception {
                return feignCourseService.getPopularCourseList(0, 8);
            }
        });

        executorService.submit(popularFuture);
        executorService.submit(purchaseFuture);
        for (i = 0; i < courseTypes.size(); i++) {
            try {
                request.setAttribute("superType" + i, futureTasks[i].get());
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }
        }

        try {
            ArrayList<Course> popularCourseList = popularFuture.get();
            ArrayList<Course> purchaseCourseList = purchaseFuture.get();
            request.setAttribute("popularCourseList", popularCourseList);
            request.setAttribute("purchaseCourseList", purchaseCourseList);
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

        return "/index.jsp";
    }

    @GetMapping("/index.html")
    public String index(HttpServletRequest request){
        request.setAttribute("courseTypeCatalog", feignCourseService.getCourseType());
        return "/index.jsp";
    }

    public String help(){
        return "/WEB-INF/views/help.jsp";
    }

    @GetMapping("/coursemanagenav.html")
    public String courseManageNav(HttpServletRequest request) {
        return "/WEB-INF/views/course-manager-nav.jsp";
    }

    @GetMapping("/course/coursemanagenav.html")
    public String courseManageNav2(HttpServletRequest request) {
        return "/WEB-INF/views/course-manager-nav.jsp";
    }

    @GetMapping("/addcourse.html")
    public String addCourseManage(HttpServletRequest request) {
        return "/WEB-INF/views/add-course.jsp";
    }

    @GetMapping("/mycourselist.html")
    public String myCourseManage(HttpServletRequest request) {
        return "/WEB-INF/views/my-course-list.jsp";
    }

    @GetMapping("/coursetypelist.html")
    public String courseTypeList(HttpServletRequest request) {
        return "/WEB-INF/views/course-type-list.jsp";
    }

    @GetMapping("/editorcourse.html")
    public String editorCourse(HttpServletRequest request){
        return "/WEB-INF/views/editor-course.jsp";
    }

    @GetMapping("/managerheader.html")
    public String managerHeader(){
        return "WEB-INF/views/common/manager-header.jsp";
    }

    @GetMapping("/coursedetail.html")
    public String courseDetail(){
        return "/WEB-INF/views/course-detail.jsp";
    }

    @GetMapping("/course.html")
    public String course(){
        return"/WEB-INF/views/course.jsp";
    }

    @GetMapping("/addcomment.html")
    public String addComment(){
        return "/WEB-INF/views/add-comment.jsp";
    }

    @GetMapping("/register.html")
    public String register(){
        return "/WEB-INF/views/register.jsp";
    }

    @GetMapping("/courselist.html")
    public String courseList(HttpServletRequest request){
        Superstate superstate = feignCourseService.getCourseList(0, 20);
        ArrayList<Course> courseArrayList = objectMapper.convertValue(superstate.getResource(), new TypeReference<ArrayList<Course>>(){});
        request.setAttribute("courseList", courseArrayList);
        request.setAttribute("pojo", superstate);
        return "/WEB-INF/views/course-list.jsp";
    }

    @GetMapping("/information.html")
    public String information(){
        return "/WEB-INF/views/common/information.jsp";
    }

    @GetMapping("/studentcourse.html")
    public String studentCourse(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        ArrayList<StudentCourse> studentCourses = feignCourseService.getStudentCourseListByUserIdForPageSize(user.getUserId(), 0, 10);
        request.setAttribute("studentCourses", studentCourses);
        return "/WEB-INF/views/information/student-course.jsp";
    }

    @GetMapping("/order.html")
    public String order(){
        return "/WEB-INF/views/information/order.jsp";
    }

    @GetMapping("/collection.html")
    public String studentCollection(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        ArrayList<Collect> collects = feignCourseService.getCollectList(user.getUserId(), 0, 10);
        System.out.println(collects);
        request.setAttribute("collects", collects);
        return "/WEB-INF/views/information/collection.jsp";
    }

    @GetMapping("/userinfo.html")
    public String userInfo(){
        return "/WEB-INF/views/information/user-info.jsp";
    }

}
