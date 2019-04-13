package com.example.course.controller;

import com.google.common.io.Files;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.aspectj.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@Api("文件下载接口")
@Controller
@RequestMapping("/download")
public class DownloadController {

    @ApiOperation("文件下载接口")
    @GetMapping("/")
    public void downloadFile(HttpServletRequest request, HttpServletResponse response, @RequestParam("path") String path) throws IOException {
        System.out.println(path);
        String realPath = request.getServletContext().getRealPath(path);
        System.out.println(realPath);

        File file = new File(realPath);
        long length = file.length();
        response.setCharacterEncoding("utf-8");
        response.setContentLengthLong(length);
        response.setContentType("application/x-msdownload");
        String fileName = file.getName().substring(32);
        fileName = fileName.replaceAll(" ", "");
        response.setHeader("Content-Disposition", "attachment; filename=" + new String(fileName.getBytes("utf-8"), "ISO8859-1"));
        Files.copy(file, response.getOutputStream());
    }
}
