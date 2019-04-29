package com.example.course;


import com.example.common.entity.Catalog;
import com.example.common.entity.Course;

import java.io.File;
import java.lang.reflect.Proxy;
import java.util.LinkedHashMap;
import java.util.concurrent.locks.ReentrantLock;

public class Text {
    static ReentrantLock  lock = new ReentrantLock();
    public static void main(String[] args) throws InterruptedException {

        Course course = new Course();
        course.getCourseId();
        Catalog catalog = new Catalog();
        catalog.getCatalogCourse();
        File file  = new File("D:\\course-springcloud\\course\\target\\course-0.0.1-SNAPSHOT\\upload\\video\\2019-04\\0292dc71b416404a97160452f2cc01cb我曾 - 隔壁老樊.mp4");

        System.out.println(file.getName());
//        file.wait();
//        tt();
        System.out.println(nice(4));
        System.out.println(nice(4));

        Proxy.getProxyClass(null);

    }


    public static void tt() throws InterruptedException {
        System.out.println("dddddddddddddddd");
        Text.class.wait();
        System.out.println("nice nice nice");
    }

    public  static int nice(int i){
        int a = 0;
        try {
            lock.lock();
            if(i < 1){
                return 1;
            }
            a = i + nice(i - 1);
        } catch ( Exception e){

        } finally {
//            lock.tryLock();
        }
        return a;
    }

}
