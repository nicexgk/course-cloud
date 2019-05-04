package com.example.courseservice.service;

import com.example.common.entity.CourseType;
import com.example.courseservice.Config.SpringContext;
import com.example.courseservice.dao.CourseTypeMapper;
import com.example.courseservice.util.ZookeeperClient;
import org.apache.curator.framework.recipes.locks.InterProcessMutex;
import org.apache.curator.framework.recipes.locks.InterProcessReadWriteLock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
@PropertySources({
        @PropertySource("classpath:zookeeper.properties"),
        @PropertySource("classpath:application.properties")
})
public class CourseTypeServiceImpl implements CourseTypeService {
    @Resource
    private CourseTypeMapper courseTypeMapper;
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;
    @Value("${redis.cache.course-type-key}")
    private String typeKey;
    @Value("${zookeeper.cache.course-type-lock-path}")
    private String typeLockPath;

    @Override
    public ArrayList<CourseType> courseTypeNavigation() {
        ArrayList<CourseType> arrayList = (ArrayList<CourseType>) redisTemplate.opsForValue().get(typeKey);
        if (arrayList == null || arrayList.isEmpty()) {
            ZookeeperClient zkClient = SpringContext.applicationContext.getBean(ZookeeperClient.class);
            InterProcessReadWriteLock readWriteLock = zkClient.getReadWriteLock(typeLockPath);
            InterProcessMutex interProcessMutex = readWriteLock.writeLock();
            try{
                arrayList = (ArrayList<CourseType>) redisTemplate.opsForValue().get(typeKey);
                if(arrayList == null || arrayList.isEmpty()){
                    arrayList = getCourseTypeCatalog();
                    redisTemplate.opsForValue().set(typeKey, arrayList);
                    return arrayList;
                }
            } catch (Exception e){
                e.printStackTrace();
            } finally {
                try {
                    interProcessMutex.release();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                zkClient.close();
            }
        }
        return arrayList;
    }

    public ArrayList<CourseType> getCourseTypeCatalog() {
        ArrayList<CourseType> parentTypeList = courseTypeMapper.queryOriginType();
        ArrayList<CourseType> secondTypeList = courseTypeMapper.queryTypeByIdListOnChildList(parentTypeList);
        ArrayList<CourseType> chileTypeList = courseTypeMapper.queryTypeByIdListOnChildList(secondTypeList);
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
        ArrayList<CourseType> courseTypeChile = courseTypeMapper.queryTypeByIdListOnChildList(parentTypeList);
        return courseTypeChile;
    }

    @Override
    public ArrayList<CourseType> getCourseTypeByParentIdForChildList(int parentId) {
        return courseTypeMapper.queryTypeByParentIdForChildList(parentId);
    }
}
