package com.example.courseservice.dao;

import com.example.common.entity.Catalog;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface CatalogMapper {
    @Insert("insert into catalog_list (parent_id, catalog_course, catalog_name, catalog_order, catalog_resource) " +
            "values(#{parentId},#{catalogCourse},#{catalogName},#{catalogOrder},#{catalogResource})")
    @Options(useGeneratedKeys = true, keyProperty = "catalogId", keyColumn = "catalog_id")
    public boolean addCatalog(Catalog catalog);

    @Select("select * from catalog_list where catalog_course = #{arg0} order by catalog_order")
    @Results({
            @Result(property = "catalogId", column = "catalog_id"),
            @Result(property = "parentId", column = "parent_id"),
            @Result(property = "catalogCourse", column = "catalog_course"),
            @Result(property = "catalogOrder", column = "catalog_order"),
            @Result(property = "catalogType", column = "catalog_type"),
            @Result(property = "catalogName", column = "catalog_name"),
            @Result(property = "catalogResource", column = "catalog_resource"),
            @Result(property = "catalogDate", column = "catalog_date")
    })
    public ArrayList<Catalog> queryCatalogListByCourseId(int id);

    @Delete("delete from catalog_list where catalog_course = #{arg0}")
    public boolean deleteCatalogByCourseId(int id);
}
