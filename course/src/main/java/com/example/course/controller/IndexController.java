package com.example.course.controller;

import com.example.common.entity.*;
import com.example.course.service.feign.FeignCourseService;
import com.example.course.service.feign.FeignOrderService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.concurrent.*;
@Api("索引接口")
@Controller
public class IndexController {
    //创建一个固定大小的线程池用于调用服务
    public static final ExecutorService executorService = Executors.newFixedThreadPool(15);

    @Resource
    private FeignCourseService feignCourseService;
    @Resource
    private FeignOrderService feignOrderService;
    @Autowired
    private ObjectMapper objectMapper;

    @ModelAttribute
    public void addAttribute(HttpServletRequest request){
        ArrayList<CourseType> courseTypeArrayList = feignCourseService.getCourseType();
        request.setAttribute("courseTypeCatalog", courseTypeArrayList);
    }

    @ApiOperation(value = "首页数据填充")
    @GetMapping("/index.html")
    public String index1(HttpServletRequest request) {
        ArrayList<CourseType> courseTypes = (ArrayList<CourseType>) request.getAttribute("courseTypeCatalog");
        FutureTask<?> futureTasks[] = null;
        if (courseTypes != null){
            futureTasks = new FutureTask[courseTypes.size()];
        } else {
            futureTasks = new FutureTask[0];
        }
        int i = 0;
        // 根据课程类型获取指定条数的课程
        for (CourseType courseType : courseTypes) {
            futureTasks[i] = new FutureTask<LinkedHashMap<String, ArrayList<Course>>>(new Callable<LinkedHashMap<String, ArrayList<Course>>>() {
                @Override
                public LinkedHashMap<String, ArrayList<Course>> call() throws Exception {
                    return feignCourseService.getCourseTopNumByParentType(courseType.getTypeId(), 0, 8);
                }
            });
            // 异步调用课程服务获取课程信息
            executorService.submit(futureTasks[i]);
            i++;
        }
        // 获取浏览排行榜列表
        FutureTask<ArrayList<Course>> popularFuture = new FutureTask<>(new Callable<ArrayList<Course>>() {
            @Override
            public ArrayList<Course> call() throws Exception {
                // 异步调用课程服务，获取浏览排行榜信息
                return feignCourseService.getPopularCourseList(0, 8);
            }
        });
        // 获取购买排行榜,列表
        FutureTask<ArrayList<Course>> purchaseFuture = new FutureTask<>(new Callable<ArrayList<Course>>() {
            @Override
            public ArrayList<Course> call() throws Exception {
                // 异步调用课程服务获取购买排行榜列表
                return feignCourseService.getPurchaseCourseList(0, 8);
            }
        });

        // 获取异步调用返回的结果
        executorService.submit(popularFuture);
        executorService.submit(purchaseFuture);
        for (i = 0; i < futureTasks.length; i++) {
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

    @ApiOperation(value = "获取帮助页面")
    @GetMapping("/help.html")
    public String help(){
        return "/WEB-INF/views/help.jsp";
    }

    @ApiOperation(value = "登录页面")
    @GetMapping("/login.html")
    public String login(){
        return "/WEB-INF/views/login.jsp";
    }

    @ApiOperation("课程管理主页")
    @GetMapping("/coursemanagenav.html")
    public String courseManageNav(HttpServletRequest request) {
        return "/WEB-INF/views/course-manager-nav.jsp";
    }

    @ApiOperation(value = "添加课程页面")
    @GetMapping("/addcourse.html")
    public String addCourseManage(HttpServletRequest request) {
        return "/WEB-INF/views/add-course.jsp";
    }

    @ApiOperation(value = "我的授课课程列表界面")
    @GetMapping("/mycourselist.html")
    public String myCourseManage(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        ArrayList<Course> userCourseList = feignCourseService.getUserCourseList(user.getUserId());
        request.setAttribute("userCourseList", userCourseList);
        return "/WEB-INF/views/my-course-list.jsp";
    }

    @ApiOperation(value = "编辑课程页面")
    @GetMapping("/editorcourse.html")
    public String editorCourse(HttpServletRequest request){
        return "/WEB-INF/views/editor-course.jsp";
    }

    @ApiOperation(value = "课程管理头部界面")
    @GetMapping("/managerheader.html")
    public String managerHeader(){
        return "WEB-INF/views/common/manager-header.jsp";
    }

    @GetMapping("/coursedetail.html")
    public String courseDetail(){
        return "/WEB-INF/views/course-detail.jsp";
    }

    @ApiOperation(value = "课程信息界面")
    @GetMapping("/course.html")
    public String course(){
        return"/WEB-INF/views/course.jsp";
    }

    @ApiOperation(value = "添加课程界面")
    @GetMapping("/addcomment.html")
    public String addComment(){
        return "/WEB-INF/views/add-comment.jsp";
    }

    @ApiOperation(value = "用户注册界面")
    @GetMapping("/register.html")
    public String register(){
        return "/WEB-INF/views/register.jsp";
    }

    @ApiOperation(value = "课程列表界面")
    @GetMapping("/courselist.html")
    public String courseList(HttpServletRequest request) throws ExecutionException, InterruptedException {
        // 异步调用课程服务获取课程信息
        FutureTask<ArrayList<Course>> coursePopularFutureTask = new FutureTask<>(() -> {
            return feignCourseService.getPopularCourseList(0, 7);
        });
        executorService.submit(coursePopularFutureTask);

        Superstate superstate = feignCourseService.getCourseList(0, 20);
        ArrayList<Course> courseArrayList = objectMapper.convertValue(superstate.getResource(), new TypeReference<ArrayList<Course>>(){});

        ArrayList<Course> popularList = coursePopularFutureTask.get();
        request.setAttribute("courseList", courseArrayList);
        request.setAttribute("pojo", superstate);
        request.setAttribute("popularList", popularList);
        return "/WEB-INF/views/course-list.jsp";
    }


    @GetMapping("/information.html")
    public String information(){
        return "/WEB-INF/views/common/information.jsp";
    }

    @ApiOperation(value = "用户课程列表界面")
    @GetMapping("/studentcourse.html")
    public String studentCourse(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        Superstate superstate = feignCourseService.getStudentCourseListByUserIdForPageSize(user.getUserId(), 0, 10);
        ArrayList<StudentCourse> studentCourses = objectMapper.convertValue(superstate.getResource(),new TypeReference<ArrayList<StudentCourse>>(){});
        request.setAttribute("studentCourses", studentCourses);
        request.setAttribute("pojo", superstate);
        return "/WEB-INF/views/information/student-course.jsp";
    }

    @ApiOperation(value = "用户订单列表界面")
    @GetMapping("/order.html")
    public String order(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        Superstate superstate = feignOrderService.getOrderListBySidFoePageSize(user.getUserId(), 0 , 10 );
        ArrayList<Order> orderList = objectMapper.convertValue(superstate.getResource(),new TypeReference<ArrayList<Order>>(){});
        request.setAttribute("orderList", orderList);
        request.setAttribute("pojo", superstate);
        return "/WEB-INF/views/information/order.jsp";
    }

    @ApiOperation(value = "用户收藏列表界面")
    @GetMapping("/collection.html")
    public String studentCollection(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        Superstate superstate = feignCourseService.getCollectListBySidForPageSize(user.getUserId(), 0, 10);
        ArrayList<Collect> collects = objectMapper.convertValue(superstate.getResource(),new TypeReference<ArrayList<Collect>>(){});
        System.out.println(collects);
        request.setAttribute("collects", collects);
        request.setAttribute("pojo", superstate);
        return "/WEB-INF/views/information/collection.jsp";
    }

    @ApiOperation(value = "用户信息界面")
    @GetMapping("/userinfo.html")
    public String userInfo(){
        return "/WEB-INF/views/information/user-info.jsp";
    }

    @ApiOperation(value = "根据cid获取对应课程的评论页面信息", notes = "返回的是HTML代码不是JSON数据")
    @GetMapping("/commentary/{cid}")
    public String getCourseComment(HttpServletRequest request, @PathVariable("cid") int cid) {
        System.out.println(cid);
        Course course = feignCourseService.getCourseById(cid);
        System.out.println(course);
        request.setAttribute("course", course);
        return "/WEB-INF/views/add-comment.jsp";
    }

    @ApiOperation(value = "忘记密码界面")
    @GetMapping("/forgetpassword.html")
    public String forgetPassword(){
        return "/WEB-INF/views/forget-password.jsp";
    }

    @ApiOperation(value = "错误界面")
    @GetMapping("/error.html")
    public String error(){
        return "/WEB-INF/views/error/error.jsp";
    }

    @ApiOperation(value = "错误界面")
    @GetMapping("/404.html")
    public String notFound(){
        return "/WEB-INF/views/error/404.jsp";
    }
}
