package com.example.logservice.service;

import com.example.common.entity.ErrorLog;

public interface LogService {

    public boolean  insertErrorLog(ErrorLog errorLog);
}
