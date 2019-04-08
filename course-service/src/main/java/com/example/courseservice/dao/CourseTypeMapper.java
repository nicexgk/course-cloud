package com.example.courseservice.dao;

import com.example.common.entity.CourseType;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;

@Mapper
public interface CourseTypeMapper {

    @Select("select * from course_type where parent_id is null")
    @Results({
            @Result(property = "typeId", column = "type_id"),
            @Result(property = "parentId", column = "parent_id"),
            @Result(property = "typeName", column = "type_name"),
            @Result(property = "typeDate", column = "type_date")
    })
    public ArrayList<CourseType> queryOriginType();


    //    @SelectProvider(type = DynamicSelectProvider.class, method = "queryChildCourseType")
    @Select("<script>" +
            "select * from course_type where parent_id in " +
            "<foreach item='item' index='index' collection='list' open='(' separator=',' close=')'> #{item.typeId} </foreach> " +
            "</script>")
    @Results({
            @Result(property = "typeId", column = "type_id"),
            @Result(property = "parentId", column = "parent_id"),
            @Result(property = "typeName", column = "type_name"),
            @Result(property = "typeDate", column = "type_date")
    })
    public ArrayList<CourseType> queryTypeByIdOnChile(ArrayList<CourseType> parentCourseType);

}
