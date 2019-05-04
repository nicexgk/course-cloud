package com.example.courseservice.test;

import com.example.courseservice.util.ZookeeperClient;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.recipes.locks.InterProcessMutex;
import org.apache.curator.framework.recipes.locks.InterProcessReadWriteLock;
import org.apache.zookeeper.CreateMode;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Component;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.concurrent.TimeUnit;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ZookeeperClientTest {
    @Autowired
    private ZookeeperClient zookeeperClient;

    @Test
    public void test() throws Exception {
        CuratorFramework curatorFramework = zookeeperClient.getCuratorFramework();
//        curatorFramework.create().creatingParentContainersIfNeeded().withMode(CreateMode.PERSISTENT).forPath("/nicenice/nice/nice");
        InterProcessReadWriteLock readWriteLock = new InterProcessReadWriteLock(curatorFramework, "/course/redis/cache/lock/purchase");
        InterProcessMutex interProcessMutex = readWriteLock.writeLock();
//        interProcessMutex.acquire(100, TimeUnit.SECONDS);
        interProcessMutex.acquire(1000*30, TimeUnit.MILLISECONDS);
        Thread.sleep(1000*60);
        interProcessMutex.release();
    }
}
