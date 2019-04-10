package com.example.courseservice.test.daotest;

import com.example.common.entity.Catalog;
import com.example.courseservice.dao.CatalogMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CatalogMapperTest {
    @Resource
    CatalogMapper catalogMapper;

    @Test
    public void addCatalogTest(){
        Catalog catalog = new Catalog();
        catalog.setCatalogName("nice");
        catalog.setCatalogCourse(108);
        catalog.setCatalogName("nice");
        catalog.setCatalogOrder(2);
        catalog.setParentId(5);
        System.out.println(catalogMapper.addCatalog(catalog));
        System.out.println(catalog.getCatalogId());
    }


    @Test
    public void queryCatalogListByCourseIdTest(){

        System.out.println(catalogMapper.queryCatalogListByCourseId(174));
    }
}
