package com.example.common.entity;

import lombok.Data;

@Data
public class Status {
    // 状码
    private int status;
    // 状态描述
    private String description;
    // 资源路径
    private String resource;
}
