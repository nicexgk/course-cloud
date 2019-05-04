package com.example.logservice.dao;

import com.example.common.entity.ErrorLog;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class LogMapperTest {
    @Resource
    private LogMapper logMapper;

    @Test
    public void insertLog(){
        ErrorLog errorLog = new ErrorLog();
        errorLog.setErrorFunction("nice ");
        errorLog.setErrorService("err");
        errorLog.setErrorContent("===============");
        System.out.println(logMapper.insertErrorLog(errorLog));
    }
}
