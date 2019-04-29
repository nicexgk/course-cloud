package com.example.courseservice.service;

import com.example.common.entity.*;
import com.example.courseservice.dao.CourseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.DefaultTypedTuple;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;
import java.util.concurrent.TimeUnit;

@Service
public class CourseServiceImpl implements CourseService {
    public static double SCORE = 0;
    @Resource
    CourseMapper courseMapper;
    @Resource
    CourseTypeService courseTypeService;
    @Autowired
    CatalogService catalogService;
    @Autowired
    RedisTemplate<String, Object> redisTemplate;

    @Override
    public ArrayList<Course> getStudentCourseList(int uid, int page, int size) {
        return courseMapper.queryCourseByStudentForStartSize(uid, page * size, size);
    }

    // 获取购买排行榜
    @Override
    public ArrayList<Course> getPurchaseCourseList(int page, int size) {
        Set<Object> purchaseSet = redisTemplate.opsForZSet().range("purchase-course-zset", page * size, size);
        ArrayList<Course> purchaseCourseList = null;
        if (purchaseSet == null || purchaseSet.isEmpty()) {
            Set<ZSetOperations.TypedTuple<Object>> tupleSet = new HashSet<>();
            purchaseCourseList = courseMapper.queryCourseStartSize(page * size, size);
            for (Course course : purchaseCourseList) {
                tupleSet.add(new DefaultTypedTuple<Object>(course, SCORE));
            }
            long add = redisTemplate.opsForZSet().add("purchase-course-zset", tupleSet);
            redisTemplate.expire("purchase-course-zset", 60, TimeUnit.SECONDS);
            System.out.println("purchase-course-zset add " + add);
        } else {
            System.out.println(purchaseSet.size());
            purchaseCourseList = new ArrayList<>();
            for (Iterator iterator = purchaseSet.iterator(); iterator.hasNext(); ) {
                purchaseCourseList.add((Course) iterator.next());
            }
        }
        return purchaseCourseList;
    }

    // 获取热门排行榜
    @Override
    public ArrayList<Course> getPopularCourseList(int page, int size) {
        Set<Object> popularSet = redisTemplate.opsForZSet().range("popular-course-zset", page * size, size);
        ArrayList<Course> popularCourseList = null;
        if (popularSet == null || popularSet.isEmpty()) {
            Set<ZSetOperations.TypedTuple<Object>> tupleSet = new HashSet<>();
            popularCourseList = courseMapper.queryCourseStartSize(page * size, size);
            for (Course course : popularCourseList) {
                tupleSet.add(new DefaultTypedTuple<Object>(course, SCORE));
            }
            long add = redisTemplate.opsForZSet().add("popular-course-zset", tupleSet);
            redisTemplate.expire("popular-course-zset", 60, TimeUnit.SECONDS);
            System.out.println("popular-course-zset add " + add);
        } else {
            System.out.println(popularSet.size());
            popularCourseList = new ArrayList<>();
            for (Iterator iterator = popularSet.iterator(); iterator.hasNext(); ) {
                popularCourseList.add((Course) iterator.next());
            }
        }
        return popularCourseList;
    }

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
    public Course getCourseById(int cid) {
        Course course = courseMapper.queryCourseByCid(cid);
        if (course != null) {
//            redisTemplate.opsForZSet().
            ArrayList<Catalog> catalogList = catalogService.getCatalogList(cid);
            course.setCatalogList(catalogList);
        }
        return course;
    }

    // 搜索课程
    @Override
    public ArrayList<Course> searchCourseListByNameForPageSize(String text, int page, int size) {
        page = page >= 0 ? page : 0;
        size = size >= 0 ? size : 0;
        text = text.trim();
        return courseMapper.likeCourseByNameForStartSize(text, page * size, size);
    }
}
