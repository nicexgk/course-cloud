package com.example.courseservice.test.daotest;

import com.example.courseservice.dao.CollectMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CollectMapperTest {

    @Resource
    private CollectMapper collectMapper;

    @Test
    public void addCollectTest(){
        System.out.println(collectMapper.insertCollect(9, 170));
        System.out.println(collectMapper.insertCollect(9, 181));
        System.out.println(collectMapper.insertCollect(9, 182));
        System.out.println(collectMapper.insertCollect(9, 183));
        System.out.println(collectMapper.insertCollect(9, 184));
        System.out.println(collectMapper.insertCollect(9, 185));
        System.out.println(collectMapper.insertCollect(9, 186));
    }


    @Test
    public void deleteCollectTest(){
        System.out.println(collectMapper.deleteCollect(9, 170));
    }

    @Test
    public void selectCollectList(){
        System.out.println(collectMapper.queryCollectListBySidForStartSize(9, 0, 10));
    }

    @Test
    public void queryCollectBySidCidTest(){
        System.out.println(collectMapper.queryCollectBySidCid(9, 181));
    }


}
