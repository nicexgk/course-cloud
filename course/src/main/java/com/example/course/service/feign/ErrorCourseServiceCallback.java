package com.example.course.service.feign;

import com.example.common.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.stereotype.Component;

import javax.jms.Destination;
import java.util.ArrayList;
import java.util.LinkedHashMap;

@Component
public class ErrorCourseServiceCallback implements FeignCourseService {

    @Autowired
    private JmsMessagingTemplate jmsMessagingTemplate;
    @Value("${course.service}")
    private String serviceName;
    @Autowired
    @Qualifier("error-log-queue")
    private Destination queue;
    private static final String defaultContent = new String("调用服务出错");
    // 将变量放在线程里，避免每次都new一个ErrorLog对象，
    private ThreadLocal<ErrorLog> logThreadLocal = new ThreadLocal<ErrorLog>() {
        @Override
        protected ErrorLog initialValue() {
            return new ErrorLog();
        }
    };

    public void sendErrorLog(String errorFunction, String errorContent) {
        ErrorLog errorLog = logThreadLocal.get();
        errorLog.setErrorService(serviceName);
        errorLog.setErrorFunction(errorFunction);
        errorLog.setErrorContent(errorContent);
        try {
            jmsMessagingTemplate.convertAndSend(queue, errorLog);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Status deleteCourse(int cid) {
        Status status = new Status();
        status.setStatus(500);
        status.setDescription("服务出错啦！稍后请重试。。。");
        return status;
    }

    public Status getDefaultErrorStatus() {
        sendErrorLog("Status getDefaultErrorStatus()", defaultContent);
        return getDefaultErrorStatus();
    }

    @Override
    public ArrayList<CourseType> getCourseType() {
        sendErrorLog("ArrayList<CourseType> getCourseType()", defaultContent);
        return null;
    }

    @Override
    public Status addCourse(Course course) {
        sendErrorLog("Status addCourse(Course course)", defaultContent);
        return getDefaultErrorStatus();
    }

    @Override
    public Status modifyCourse(Course course) {
        sendErrorLog("Status modifyCourse(Course course)", defaultContent);
        return getDefaultErrorStatus();
    }

    @Override
    public ArrayList<Course> getUserCourseList(int id) {
        sendErrorLog("ArrayList<Course> getUserCourseList(int id)", defaultContent);
        return null;
    }

    @Override
    public Course getCourseById(int id) {
        sendErrorLog("Course getCourseById(int id)", defaultContent);
        return null;
    }

    @Override
    public Superstate getCourseList(int tid, int page, int size) {
        sendErrorLog("Superstate getCourseList(int tid, int page, int size)", defaultContent);
        return null;
    }

    @Override
    public Superstate getCourseList(int page, int size) {
        sendErrorLog("Superstate getCourseList(int page, int size)", defaultContent);
        return null;
    }

    @Override
    public LinkedHashMap<String, ArrayList<Course>> getCourseTopNumByParentType(int parentId, int page, int size) {
        sendErrorLog("LinkedHashMap<String, ArrayList<Course>> getCourseTopNumByParentType(int parentId, int page, int size)", defaultContent);
        return null;
    }

    @Override
    public ArrayList<Course> getPopularCourseList(int page, int size) {
        sendErrorLog("ArrayList<Course> getPopularCourseList(int page, int size)", defaultContent);
        return null;
    }

    @Override
    public ArrayList<Course> getPurchaseCourseList(int page, int size) {
        sendErrorLog("ArrayList<Course> getPurchaseCourseList(int page, int size)", defaultContent);
        return null;
    }

    @Override
    public ArrayList<Course> getStudentCourseList(int uid, int page, int size) {
        sendErrorLog("ArrayList<Course> getStudentCourseList(int uid, int page, int size)", defaultContent);
        return null;
    }

    @Override
    public Superstate getStudentCourseListByUserIdForPageSize(int sid, int page, int size) {
        sendErrorLog("Superstate getStudentCourseListByUserIdForPageSize(int sid, int page, int size)", defaultContent);
        return null;
    }

    @Override
    public Status addStudentCourse(StudentCourse studentCourse) {
        sendErrorLog("Status addStudentCourse(StudentCourse studentCourse)", defaultContent);
        return getDefaultErrorStatus();
    }

    @Override
    public StudentCourse getStudentCourseBySidCid(int sid, int cid) {
        sendErrorLog("StudentCourse getStudentCourseBySidCid(int sid, int cid)", defaultContent);
        return null;
    }

    @Override
    public Status deleteStudentCourseBySidCid(int sid, int cid) {
        sendErrorLog("Status deleteStudentCourseBySidCid(int sid, int cid)", defaultContent);
        return getDefaultErrorStatus();
    }

    @Override
    public Status addCollect(int sid, int cid) {
        sendErrorLog("Status addCollect(int sid, int cid)", defaultContent);
        return getDefaultErrorStatus();
    }

    @Override
    public Status deleteCollect(int sid, int cid) {
        sendErrorLog("Status deleteCollect(int sid, int cid)", defaultContent);
        return getDefaultErrorStatus();
    }

    @Override
    public Superstate getCollectListBySidForPageSize(int sid, int page, int size) {
        sendErrorLog("Superstate getCollectListBySidForPageSize(int sid, int page, int size)", defaultContent);
        return null;
    }

    @Override
    public Collect getCollectBySidCid(int sid, int cid) {
        sendErrorLog("Collect getCollectBySidCid(int sid, int cid)", defaultContent);
        return null;
    }

    @Override
    public Superstate searchCourseListByNameForPageSize(String text, int page, int size) {
        sendErrorLog("ArrayList<Course> searchCourseListByNameForPageSize(String text, int page, int size)", defaultContent);
        return null;
    }
}
