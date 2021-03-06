package com.example.course.service.feign;

import com.example.common.entity.*;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.LinkedHashMap;

/**
 *
 * @description 调用course服务接口
 *
 */
@FeignClient(value = "${course.service}", fallback = ErrorCourseServiceCallback.class)
public interface FeignCourseService {

    @GetMapping("/type/")
    public ArrayList<CourseType> getCourseType();

    @PostMapping("/course/")
    public Status addCourse(@RequestBody Course course);

    @DeleteMapping("/course/{ }")
    public Status deleteCourse(@PathVariable("cid") int cid);

    @PutMapping("/course/")
    public Status modifyCourse(@RequestBody Course course);

    @GetMapping("/course/user/{id}")
    public ArrayList<Course> getUserCourseList(@PathVariable("id") int id);

    @GetMapping("/course/{id}")
    public Course getCourseById(@PathVariable("id") int id);

    @GetMapping("/course/{tid}/{page}/{size}")
    public Superstate getCourseList(@PathVariable("tid") int tid, @PathVariable("page")int page, @PathVariable("size") int size);

    @GetMapping("/course/{page}/{size}")
    public Superstate getCourseList(@PathVariable("page") int page, @PathVariable("size") int size);

    @GetMapping("/course/top/{parentId}/{page}/{size}")
    public LinkedHashMap<String, ArrayList<Course>> getCourseTopNumByParentType(@PathVariable("parentId")int parentId, @PathVariable("page")int page, @PathVariable("size")int size);

    @GetMapping("/course/popular/{page}/{size}")
    public ArrayList<Course> getPopularCourseList(@PathVariable("page")int page, @PathVariable("size")int size);

    @GetMapping("/course/purchase/{page}/{size}")
    public ArrayList<Course> getPurchaseCourseList(@PathVariable("page")int page, @PathVariable("size")int size);

    @GetMapping("/course/student/{uid}/{page}/{size}")
    public ArrayList<Course> getStudentCourseList(@PathVariable("uid")int uid, @PathVariable("page")int page, @PathVariable("size")int size);


    @GetMapping("/student/course/{sid}/{page}/{size}")
    public Superstate getStudentCourseListByUserIdForPageSize(@PathVariable("sid")int sid, @PathVariable("page")int page, @PathVariable("size")int size);

    @PostMapping("/student/course/")
    public Status addStudentCourse(@RequestBody StudentCourse studentCourse);

    @GetMapping("/student/course/{sid}/{cid}")
    public StudentCourse getStudentCourseBySidCid(@PathVariable("sid") int sid, @PathVariable("cid")int cid);

    @DeleteMapping("/student/course/{sid}/{cid}")
    public Status deleteStudentCourseBySidCid(@PathVariable("sid") int sid, @PathVariable("cid") int cid);



    @PostMapping("/collection/{sid}/{cid}")
    public Status addCollect(@PathVariable("sid") int sid, @PathVariable("cid")int cid);

    @DeleteMapping("/collection/{sid}/{cid}")
    public Status deleteCollect(@PathVariable("sid")int sid, @PathVariable("cid")int cid);

    @GetMapping("/collection/{sid}/{page}/{size}")
    public Superstate getCollectListBySidForPageSize(@PathVariable("sid")int sid, @PathVariable("page")int page, @PathVariable("size")int size);

    @GetMapping("/collection/{sid}/{cid}")
    public Collect getCollectBySidCid(@PathVariable("sid")int sid, @PathVariable("cid")int cid);



    @GetMapping("/search/course/{text}/{page}/{size}")
    public Superstate searchCourseListByNameForPageSize(@PathVariable("text") String text, @PathVariable("page")int page, @PathVariable("size")int size);
}
