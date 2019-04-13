package com.example.courseservice.service;

import com.example.common.entity.*;
import com.example.courseservice.dao.CourseMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.LinkedHashMap;

@Service
public class CourseServiceImpl implements CourseService {
    @Resource
    CourseMapper courseMapper;
    @Resource
    CatalogService catalogService;
    @Resource
    CourseTypeService courseTypeService;

    @Override
    public LinkedHashMap<String, ArrayList<Course>> getCourseTopNumByParentType(int parentId, int page, int size) {
        LinkedHashMap<String, ArrayList<Course>> superCourseList = new LinkedHashMap<>();
        ArrayList<CourseType> ChileTypeList = courseTypeService.getCourseTypeByParentIdForChildList(parentId);
        for (CourseType courseType : ChileTypeList) {
            superCourseList.put(courseType.getTypeName(), courseMapper.queryCourseByTypeForStartSize(courseType.getTypeId(), page * size, size));
        }
        return superCourseList;
    }

    @Override
    public Superstate getCourseByTypeForPageSize(int tid, int page, int size) {
        Superstate superstate = new Superstate();
        ArrayList<Course> courseArrayList = null;
        page = page < 0 ? 0 : page;
        size = size < 0 ? 0 : size;
        if (tid < 0) {
            superstate.setType(-1);
            courseArrayList = courseMapper.queryCourseStartSize(page * size, size);
        } else {
            superstate.setType(tid);
            courseArrayList = courseMapper.queryCourseByTypeForStartSize(tid, page * size, size);
        }

        superstate.setResource(courseArrayList);
        superstate.setPage(page);
        superstate.setSize(size);
        superstate.setCount(courseMapper.queryCourseByTypeForCount(tid));
        return superstate;
    }

    @Override
    public Superstate getCourseForPageSize(int page, int size) {
        page = page < 0 ? 0 : page;
        size = size < 0 ? 0 : size;
        ArrayList<Course> courseArrayList = courseMapper.queryCourseStartSize(page * size, size);
        Superstate superstate = new Superstate();
        superstate.setResource(courseArrayList);
        superstate.setPage(page);
        superstate.setSize(size);
        superstate.setType(-1);
        superstate.setCount(courseMapper.queryCourseCount());
        return superstate;
    }

    @Override
    public Status addCourse(Course course) {
        Status status = new Status();
        if (course == null) {
            status.setStatus(400);
            status.setDescription("添加的课程不能为空");
            return status;
        }
        if (course.getCourseTeacher() == null) {
            status.setStatus(400);
            status.setDescription("请先登录。。。");
            return status;
        }
        if (course.getCourseName() == null) {
            status.setStatus(400);
            status.setDescription("课程名字不能为空");
            return status;
        }
        if (course.getCourseType() == null) {
            status.setStatus(400);
            status.setDescription("课程类型不能为空");
            return status;
        }
        if (!courseMapper.insertCourse(course)) {
            status.setStatus(400);
            status.setDescription("课程添加失败，请重试!");
            return status;
        }
        if (course.getCatalogList() == null) {
            status.setStatus(200);
            status.setDescription("课程添加成功");
        }
        for (Catalog catalog : course.getCatalogList()) {
            catalog.setCatalogCourse(course.getCourseId());
            for (Catalog child : catalog.getChildList()) {
                child.setCatalogCourse(course.getCourseId());
            }
        }
        if (!catalogService.addCatalogList(course.getCatalogList())) {
            status.setStatus(400);
            status.setDescription("课程添目录添加失败，请重试!");
        }
        status.setStatus(200);
        status.setDescription("课程添加成功");
        return status;
    }

    @Override
    public ArrayList<Course> getUserCourseList(int id) {

        return courseMapper.queryUserCourseList(id);
    }

    @Override
    public Status modifyCourse(Course course) {
        Status status = new Status();
        if (course.getCourseId() == null) {
            status.setStatus(400);
            status.setDescription("不合法的课程对象");
            return status;
        }

        if (!courseMapper.updateCourse(course)) {
            status.setStatus(400);
            status.setDescription("课程信息修改失败，稍后请重试!");
            return status;
        }
        if (course.getCatalogList() == null) {
            status.setStatus(200);
            status.setDescription("课程添加成功");
            return status;
        }

        System.out.println(course.getCatalogList());
        catalogService.deleteCatalogByCourseId(course.getCourseId());
        System.out.println(course.getCatalogList());
        for (Catalog catalog : course.getCatalogList()) {
            catalog.setCatalogCourse(course.getCourseId());
            for (Catalog child : catalog.getChildList()) {
                child.setCatalogCourse(course.getCourseId());
            }
        }
        if (catalogService.addCatalogList(course.getCatalogList())) {
            status.setStatus(200);
            status.setDescription("课程添加成功");
            return status;
        }

        status.setStatus(400);
        status.setDescription("目录信息修改失败，稍后请重试!");
        return status;
    }

    @Override
    public Course getCourseById(int id) {
        Course course = courseMapper.queryCourseById(id);
        if (course != null) {
            ArrayList<Catalog> catalogList = catalogService.getCatalogList(id);
            course.setCatalogList(catalogList);
        }
        return course;
    }

}
