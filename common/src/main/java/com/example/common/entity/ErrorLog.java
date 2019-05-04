package com.example.common.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class ErrorLog implements Serializable{
    private Integer errorId;
    private String errorContent;
    private String errorService;
    private String errorFunction;
    private String errorDate;
}
