package com.example.userservice.dao;

import com.example.common.entity.User;
import org.apache.ibatis.jdbc.SQL;
import org.springframework.stereotype.Repository;

@Repository
public class DynamicSqlProvider {
    public String addUserProvider(User user){
        return new SQL(){
            {
                INSERT_INTO("user_info");
                String property = "";
                String value = "";
                boolean flag = false;
                if (user.getUserType() != null) {
                    if(flag){
                        property += ",";
                        value += ",";
                    }
                    flag = true;
                    property += "user_type";
                    value += "#{userType}";
                }
                if (user.getUserOn() != null) {
                    if(flag){
                        property += ",";
                        value += ",";
                    }
                    flag = true;
                    property += "user_on";
                    value += "#{userOn}";
                }
                if (user.getUserEmail() != null) {
                    if(flag){
                        property += ",";
                        value += ",";
                    }
                    flag = true;
                    property += "user_email";
                    value += "#{userEmail}";
                }
                if (user.getUserPwd() != null) {
                    if(flag){
                        property += ",";
                        value += ",";
                    }
                    flag = true;
                    property += "user_pwd";
                    value += "#{userPwd}";
                }
                if (user.getUserAddress() != null) {
                    if(flag){
                        property += ",";
                        value += ",";
                    }
                    flag = true;
                    property += "user_address";
                    value += "#{userAddress}";
                }
                if (user.getUserIcon() != null) {
                    if(flag){
                        property += ",";
                        value += ",";
                    }
                    flag = true;
                    property += "user_icon";
                    value += "#{userIcon}";
                }
                if (user.getUserDescription() != null) {
                    if(flag){
                        property += ",";
                        value += ",";
                    }
                    flag = true;
                    property += "user_description";
                    value += "#{userDescription}";
                }
                if (user.getUserName() != null) {
                    if(flag){
                        property += ",";
                        value += ",";
                    }
                    flag = true;
                    property += "user_name";
                    value += "#{userName}";
                }
                if (user.getUserPhone() != null) {
                    if(flag){
                        property += ",";
                        value += ",";
                    }
                    flag = true;
                    property += "user_phone";
                    value += "#{userPhone}";
                }
                VALUES(property, value);
            }
        }.toString();
    }
}
