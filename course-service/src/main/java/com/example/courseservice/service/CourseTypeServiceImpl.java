package com.example.courseservice.service;

import com.example.common.entity.CourseType;
import com.example.courseservice.dao.CourseTypeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
public class CourseTypeServiceImpl implements CourseTypeService{
    @Resource
    CourseTypeMapper courseTypeMapper;

    @Override
    public ArrayList<CourseType> courseTypeNavigation() {
        return getCourseTypeCatalog();
    }

    public ArrayList<CourseType> getCourseTypeCatalog() {
        ArrayList<CourseType> parentTypeList = courseTypeMapper.queryOriginType();
        ArrayList<CourseType> secondTypeList = courseTypeMapper.queryTypeByIdOnChile(parentTypeList);
        ArrayList<CourseType> chileTypeList = courseTypeMapper.queryTypeByIdOnChile(secondTypeList);
        for (CourseType parentType : parentTypeList) {
            if (parentType.getChildList() == null) {
                parentType.setChildList(new ArrayList<CourseType>());
            }
            for (CourseType secondType : secondTypeList) {
                if (secondType.getChildList() == null) {
                    secondType.setChildList(new ArrayList<CourseType>());
                }
                if (secondType.getParentId() == parentType.getTypeId()) {
                    if (parentType.getChildList().indexOf(secondType) == -1) {
                        parentType.getChildList().add(secondType);
                    }
                }
                for (CourseType chileType : chileTypeList) {
                    if (chileType.getParentId() == secondType.getTypeId()) {
                        if (secondType.getChildList().indexOf(chileType) == -1) {
                            secondType.getChildList().add(chileType);
                        }
                    }
                }
            }
        }
        return parentTypeList;
    }

    @Override
    public ArrayList<CourseType> originCourseType() {
        return courseTypeMapper.queryOriginType();
    }

    @Override
    public ArrayList<CourseType> courseTypeOnChile(ArrayList<CourseType> parentTypeList) {
        ArrayList<CourseType> courseTypeChile = courseTypeMapper.queryTypeByIdOnChile(parentTypeList);
        return courseTypeChile;
    }

}
