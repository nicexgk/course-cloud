package com.example.courseservice.test.servicetest;

import com.example.courseservice.service.CatalogService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CatalogServiceTest {

    @Autowired
    CatalogService catalogService;
    @Test
    public void getCatalog(){

        System.out.println(catalogService.getCatalogList(179).size());
    }

}
