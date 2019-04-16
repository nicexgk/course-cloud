package com.example.courseservice.controller;

import com.example.common.entity.Status;
import com.example.common.entity.StudentCourse;
import com.example.courseservice.service.StudentCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/student/course")
public class StudentCourseController {

    @Autowired
    StudentCourseService studentCourseService;

    @PostMapping("/")
    public Status addStudentCourse(@RequestBody StudentCourse studentCourse){
        return studentCourseService.addStudentCourse(studentCourse);
    }

    @GetMapping("/{sid}/{page}/{size}")
    public ArrayList<StudentCourse> getStudentCourseListByUserIdForPageSize(@PathVariable("sid")int sid, @PathVariable("page")int page, @PathVariable("size")int size){
        return studentCourseService.getStudentCourseListByUserIdForPageSize(sid, page, size);
    }

    @GetMapping("/{sid}/{cid}")
    public StudentCourse getStudentCourseBySidCid(@PathVariable("sid")int sid, @PathVariable("cid")int cid){
        return studentCourseService.getStudentCourseBySidCid(sid, cid);
    }


}
