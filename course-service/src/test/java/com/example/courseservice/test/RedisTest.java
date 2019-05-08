package com.example.courseservice.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.Set;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RedisTest {
    @Resource
    RedisTemplate<String, Object>redisTemplate;
    @Value("${redis.cache.popular-key}")
    private String popularZSetKey;


    @Test
    public  void test(){
        redisTemplate.opsForZSet().add("ddd", "a", 1);
        redisTemplate.opsForZSet().add("ddd", "b", 1);
        redisTemplate.opsForZSet().add("ddd", "c", 1);
        redisTemplate.opsForZSet().add("ddd", "d", 1);
        redisTemplate.opsForZSet().add("ddd", "e", 1);
        redisTemplate.opsForZSet().add("ddd", "f", 1);
        redisTemplate.opsForZSet().incrementScore("ddd", "f", 1);
        redisTemplate.opsForZSet().incrementScore("ddd", "f", 1);
        Set set = redisTemplate.opsForZSet().range("ddd", 0, 5);

        System.out.println(set.getClass());
        for (Object obj : set){
            System.out.println(obj);
        }
    }
}
