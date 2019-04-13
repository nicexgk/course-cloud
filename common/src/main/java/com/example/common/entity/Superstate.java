package com.example.common.entity;

import lombok.Data;

import java.util.ArrayList;

@Data
public class Superstate {
    private int status;
    private int size;
    private int page;
    private int count;
    private int type;
    private String description;
    private Object resource;
}
