package com.example.course.controller;

import com.example.common.entity.*;
import com.example.course.service.feign.FeignCourseService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.concurrent.*;

@Api("课程页面接口")
@Controller
@RequestMapping("/course/page")
public class CoursePageController {
    public static ExecutorService executorService = Executors.newFixedThreadPool(8);
    @Resource
    FeignCourseService feignCourseService;
    @Autowired
    ObjectMapper objectMapper;

    @ModelAttribute
    public void addAttribute(HttpServletRequest request) {
        ArrayList<CourseType> courseTypeArrayList = feignCourseService.getCourseType();
        request.setAttribute("courseTypeCatalog", courseTypeArrayList);
    }

    @ApiOperation(value = "根据课程的id获取课程的的详细页面信息", notes = "返回的是HTML代码不是JOSN数据")
    @GetMapping("/{cid}")
    public String getCoursePage(HttpServletRequest request, @PathVariable("cid") int cid) throws ExecutionException, InterruptedException {
        System.out.println("this is course page controller");
        System.out.println(cid);
        // 异步调用课程服务获取评论列表
        FutureTask<Superstate> commentaryTask = new FutureTask<>(new Callable<Superstate>() {
            @Override
            public Superstate call() throws Exception {
                return feignCourseService.getCommentaryListByCidForPageSize(cid, 0, 10);
            }
        });
        executorService.submit(commentaryTask);
        // 异步调用课程服务获取课程信息
        FutureTask<Course> courseFutureTask = new FutureTask<>(new Callable<Course>() {
            @Override
            public Course call() throws Exception {
                return feignCourseService.getCourseById(cid);
            }
        });
        executorService.submit(courseFutureTask);
        // 获取异步调用处理后返回的结果
        Superstate superstate = commentaryTask.get();
        ArrayList<Commentary> commentaryList = objectMapper.convertValue(superstate.getResource(), new TypeReference<ArrayList<Commentary>>(){});
        Course course = courseFutureTask.get();

        User user = (User) request.getSession().getAttribute("user");
        if(user != null){
            StudentCourse studentCourse = feignCourseService.getStudentBySidCid(user.getUserId(), cid);
            Collect collect = feignCourseService.getCollectBySidCid(user.getUserId(), cid);
            request.setAttribute("studentCourse", studentCourse);
            request.setAttribute("collect", collect);
        }
        System.out.println(course);
        request.setAttribute("commentaryList", commentaryList);
        request.setAttribute("course", course);
        request.setAttribute("pojo", superstate);
        return "/WEB-INF/views/course.jsp";
    }

    @ApiOperation(value = "根据课程的id和目录id获取播放的该目录的页面信息", notes = "返回的是HTML代码不是JSON数据")
    @GetMapping("/play/{cid}/{gid}")
    public String getCoursePlayCatalog(HttpServletRequest request, @PathVariable("cid") int cid, @PathVariable("gid") int gid) {
        System.out.println("course is " + cid);
        System.out.println("play catalog is  " + gid);
        return "/WEB-INF/views/course.jsp";
    }

    @ApiOperation(value = "根据课程的类型查询课程，并指定分页的大小，返回课程列表页面信息", notes = "页数是从1开始不是0")
    @GetMapping("/{tid}/{page}/{size}")
    public String getCourseList(HttpServletRequest request, @PathVariable("tid") int tid, @PathVariable("page") int page, @PathVariable("size") int size) {
        System.out.println("tid = " + tid);
        Superstate superstate = feignCourseService.getCourseList(tid, page, size);
        ArrayList courseArrayList = objectMapper.convertValue(superstate.getResource(), new TypeReference<ArrayList<Course>>() {
        });
        request.setAttribute("courseList", courseArrayList);
        request.setAttribute("pojo", superstate);
        ArrayList<CourseType> courseTypes = (ArrayList<CourseType>) request.getAttribute("courseTypeCatalog");
        ArrayList<CourseType> studyList = null;
        ArrayList<CourseType> routeList = null;
        CourseType parentType = null;
        if (superstate.getType() == -1) {
            studyList = courseTypes;
        } else {
            studyList = studyList(courseTypes, tid);
            routeList = routeList(courseTypes, tid);
            if (routeList.size() > 1) {
                parentType = routeList.get(routeList.size() - 2);
            }
            System.out.println(routeList);
        }

        request.setAttribute("studyList", studyList);
        request.setAttribute("routeList", routeList);
        request.setAttribute("parentType", parentType);
        return "/WEB-INF/views/course-list.jsp";
    }

    @ApiOperation(value = "分页查询课程，返回课程列表页面信息", notes = "页数是从1开始不是0")
    @GetMapping("/{page}/{size}")
    public String getCourseList(HttpServletRequest request, @PathVariable("page") int page, @PathVariable("size") int size) {
        Superstate superstate = feignCourseService.getCourseList(page, size);
        ArrayList courseArrayList = objectMapper.convertValue(superstate.getResource(), new TypeReference<ArrayList<Course>>() {
        });

        request.setAttribute("courseList", superstate.getResource());
        request.setAttribute("pojo", superstate);
        ArrayList<CourseType> courseTypes = (ArrayList<CourseType>) request.getAttribute("courseTypeCatalog");
        ArrayList<CourseType> studyList = null;
        ArrayList<CourseType> routeList = null;
        if (superstate.getType() == -1) {
            studyList = courseTypes;
        }
        request.setAttribute("studyList", studyList);
        return "/WEB-INF/views/course-list.jsp";
    }

    @ApiOperation(value = "根据cid获取对应课程的评分页面信息", notes = "返回的是HTML代码不是JSON数据")
    @GetMapping("/commentary/{cid}")
    public String getCourseComment(HttpServletRequest request, @PathVariable("cid") int cid) {
        System.out.println(cid);
        Course course = feignCourseService.getCourseById(cid);
        System.out.println(course);
        request.setAttribute("course", course);
        return "/WEB-INF/views/add-comment.jsp";
    }



    public ArrayList<CourseType> studyList(ArrayList<CourseType> courseTypes, int tid) {
        ArrayList<CourseType> studyList = null;
        if (courseTypes == null) {
            return null;
        }
        for (CourseType courseType : courseTypes) {
            if (courseType != null && courseType.getTypeId() == tid && courseType.getChildList() != null) {
                studyList = courseType.getChildList();
                return studyList;
            } else if (courseType != null && courseType.getTypeId() == tid) {
                studyList = courseTypes;
                return studyList;
            } else {
                studyList = studyList(courseType.getChildList(), tid);
            }
            if (studyList != null) {
                break;
            }
        }
        return studyList;
    }

    public ArrayList routeList(ArrayList<CourseType> courseTypes, int tid) {
        if (courseTypes == null) {
            return null;
        }
        ArrayList<CourseType> routeList = null;
        for (CourseType courseType : courseTypes) {
            if (courseType.getTypeId() == tid) {
                routeList = new ArrayList<CourseType>();
                routeList.add(courseType);
                return routeList;
            } else {
                routeList = routeList(courseType.getChildList(), tid);
                if (routeList != null) {
                    routeList.add(0, courseType);
                    return routeList;
                }
            }
        }
        return null;
    }
}
