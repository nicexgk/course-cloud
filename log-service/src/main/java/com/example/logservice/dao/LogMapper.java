package com.example.logservice.dao;

import com.example.common.entity.ErrorLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LogMapper {
    @Insert("insert into error_log(error_service, error_function, error_content) values(#{errorService}, #{errorFunction}, #{errorContent})")
    public boolean insertErrorLog(ErrorLog errorLog);
}
