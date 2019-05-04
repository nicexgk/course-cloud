package com.example.course.config;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

@Configuration
public class RedisConfig {

    @Bean
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory factory){
        // 创建redis 模板对象
        RedisTemplate<String, Object> redisTemplate = new RedisTemplate<String, Object>();
        // 设置redis的连接工厂
        redisTemplate.setConnectionFactory(factory);
        // 创建Jack的映射器对象
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        objectMapper.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
        // 创建JackRedis序列化对象
        Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(Object.class);
        // 设置jackRedis的映射器
        jackson2JsonRedisSerializer.setObjectMapper(objectMapper);
        // 创建String形式的Redis序列化对象
        StringRedisSerializer stringRedisSerializer = new StringRedisSerializer();
        // 设置redisTemplate的key序列化方式
        redisTemplate.setKeySerializer(stringRedisSerializer);
        // 设置redisTemplate的hashKey的序列化方式
        redisTemplate.setHashKeySerializer(stringRedisSerializer);
        // 设置redisTemplate的value的序列化方式
        redisTemplate.setValueSerializer(jackson2JsonRedisSerializer);
        // 设置redisTemplate的hashValue的序列化方式
        redisTemplate.setHashValueSerializer(jackson2JsonRedisSerializer);
        return redisTemplate;
    }

}
