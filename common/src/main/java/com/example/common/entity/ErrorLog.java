package com.example.common.entity;

import lombok.Data;

@Data
public class ErrorLog {
    private Integer errorId;
    private String errorContent;
    private String errorService;
    private String errorDate;

}
