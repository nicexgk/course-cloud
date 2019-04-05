package com.example.common.entity;

import lombok.Data;

import java.io.Serializable;

//create table course_chat(
//        course_chat_id int(11) not null auto_increment,
//        send_user int (11),
//        receive_course_id int(11),
//        content varchar(3000),
//        course_chat_date timestamp not null default current_timestamp,
//        primary key (course_chat_id),
//        constraint course_chat_ibfk_1 foreign key (send_user) references user_info(user_id),
//        constraint course_chat_ibfk_2 foreign key (receive_user) references user_info(user_id)
//        )
@Data
public class CourseChat implements Serializable{
    // 聊天id
    private Integer courseChatId;
    // 发送信息的用户
    private User sendUser;
    // 聊天的课程
    private Integer receiveCourseId;
    // 聊天的内容
    private String content;
    //  聊天的日期
    private String courseChatDate;

}
