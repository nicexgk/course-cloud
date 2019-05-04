package com.example.logservice.service;

import com.example.common.entity.ErrorLog;
import com.example.logservice.dao.LogMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class LogServiceImpl implements LogService{

    @Resource
    private LogMapper logMapper;

    @Override
    public boolean insertErrorLog(ErrorLog errorLog) {
        return logMapper.insertErrorLog(errorLog);
    }
}
