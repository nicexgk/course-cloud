package com.example.course.controller;

import com.example.common.entity.Status;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Api("上传接口")
@RestController
@RequestMapping("/upload")
public class UploadController {

    public static SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM");

    // 上传图片
    @ApiOperation(value = "上传图片接口", tags = {"返回一个JSON格式的状态对象", "upload-controller"}, notes = "上传图片的name应为file")
    @PostMapping("/image")
    public Status uploadImage(HttpServletRequest request, @RequestParam(name = "file") MultipartFile upfile){
        // 获得指定目录的真实路径
        String path = request.getServletContext().getRealPath("/upload/image");
        // 创建文件名
        String filename =  UUID.randomUUID().toString().replace("-","")  + upfile.getOriginalFilename();
        // 获取当前的 年月
        String date = simpleDateFormat.format(new Date());
        // 拼接创建文件的路径
        path += "\\" + date + "\\" + filename;
        // 创建文件的保存对象
        File file = new File(path);
        // 创建目录
        if (!file.getParentFile().exists()){
            file.getParentFile().mkdirs();
            System.out.println("mk dirs");
        }
        // 创建返回前端的状态对象
        Status status = new Status();
        try {
            // 创建文件
            if(!file.exists()){
                file.createNewFile();
                System.out.println("mk file");
            }
            upfile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
            status.setStatus(400);
            return status;
        }
        System.out.println(file.getAbsolutePath());
        System.out.println(path);
        status.setResource("/upload/image/" + date + "/" + file.getName());
        status.setStatus(200);
        System.out.println(status);
        return status;
    }

    // 上传视频
    @ApiOperation(value = "视频上传接口", tags = {"返回一个JSON格式的状态对象", "upload-controller"})
    @PostMapping("/video")
    public Status upload(HttpServletRequest request,  @RequestParam(name = "file") MultipartFile upfile) {
        // 获得指定目录的真实路径
        String path = request.getServletContext().getRealPath("/upload/video");
        // 创建文件名
        String filename =  UUID.randomUUID().toString().replace("-","")  + upfile.getOriginalFilename();
        // 获取当前的 年月
        String date = simpleDateFormat.format(new Date());
        // 拼接创建文件的路径
        path += "\\" + date + "\\" + filename;
        // 创建文件的保存对象
        File file = new File(path);
        // 创建目录
        if (!file.getParentFile().exists()){
            file.getParentFile().mkdirs();
            System.out.println("mk dirs");
        }
        // 创建返回前端的状态对象
        Status status = new Status();
        try {
            // 创建文件
            if(!file.exists()){
                file.createNewFile();
                System.out.println("mk file");
            }
            upfile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
            status.setStatus(400);
            return status;
        }
        System.out.println(file.getAbsolutePath());
        System.out.println(path);
        status.setResource("/upload/video/" + date + "/" + file.getName());
        status.setStatus(200);
        System.out.println(status);
        return status;
    }

}
