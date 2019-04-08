package com.example.course.service.feign;

import com.example.common.entity.Course;
import com.example.common.entity.CourseType;
import com.example.common.entity.Status;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

/**
 *
 * @description 调用course服务接口
 *
 */
@FeignClient(value = "course-service")
public interface FeignCourseService {

    @GetMapping("/type/")
    public ArrayList<CourseType> getCourseType();

    @PostMapping("/course/")
    public Status addCourse(@RequestBody Course course);

    @PutMapping("/course/")
    public Status modifyCourse(@RequestBody Course course);

    @GetMapping("/course/user/{id}")
    public ArrayList<Course> getUserCourseList(@RequestParam("id") int id);

}
