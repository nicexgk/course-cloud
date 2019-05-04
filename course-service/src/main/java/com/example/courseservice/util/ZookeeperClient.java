package com.example.courseservice.util;

import lombok.Data;
import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.recipes.locks.InterProcessReadWriteLock;
import org.apache.curator.retry.ExponentialBackoffRetry;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

//zookeeper.server=127.0.0.1:2181
//zookeeper.session-timeout-ms=1000
//zookeeper.connection-timeout-ms=6000
//zookeeper.max-retries=3
//zookeeper.retries.sleep-ms=1000
//zookeeper.cache.lock-path=/redis/cache/lock/
@Component
@Scope("prototype")
@PropertySource("classpath:application.properties")
@Data
public class ZookeeperClient {
    @Value("${zookeeper.server}")
    private String zkService;
    @Value("${zookeeper.max-retries}")
    private int zkMaxRetries;
    @Value("${zookeeper.retries.sleep-ms}")
    private int zkRetriesSleep;
    @Value("${zookeeper.connection-timeout-ms}")
    private int zkConnectionTimeout;
    @Value("${zookeeper.session-timeout-ms}")
    private int zkSessionTimeout;
    private CuratorFramework curatorFramework;

    // 初始化方法
    @PostConstruct
    public void init() {
        System.out.println(zkService);
        System.out.println(zkMaxRetries);
        System.out.println(zkRetriesSleep);
        System.out.println(zkConnectionTimeout);
        System.out.println(zkSessionTimeout);
        curatorFramework = CuratorFrameworkFactory.builder()
                .connectString(zkService)
                .retryPolicy(new ExponentialBackoffRetry(zkMaxRetries, zkRetriesSleep))
                .connectionTimeoutMs(zkConnectionTimeout)
                .sessionTimeoutMs(zkSessionTimeout)
                .build();
        curatorFramework.start();
    }

    public InterProcessReadWriteLock getReadWriteLock(String lockPath) {
        InterProcessReadWriteLock readWriteLock = new InterProcessReadWriteLock(curatorFramework, lockPath, lockPath.getBytes());
        return readWriteLock;
    }

    public void close() {
        try {
            curatorFramework.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
