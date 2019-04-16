package com.example.userservice.dao;

import com.example.common.entity.User;
import org.apache.ibatis.jdbc.SQL;
import org.springframework.stereotype.Repository;

import java.util.Set;

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
                if (user.getUserAutograph() != null) {
                    if(flag){
                        property += ",";
                        value += ",";
                    }
                    flag = true;
                    property += "user_autograph";
                    value += "#{userAutograph }";
                }
                if (user.getUserSex() != null) {
                    if(flag){
                        property += ",";
                        value += ",";
                    }
                    flag = true;
                    property += "user_sex";
                    value += "#{userSex}";
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

    public String updateUserProvider(User user){
        return new SQL(){
            {
                UPDATE("user_info");
                if(user.getUserName() != null)
                    SET("user_name = #{userName}");
                if(user.getUserPhone() != null)
                    SET("user_phone = #{userPhone}");
                if(user.getUserIcon() != null)
                    SET("user_icon = #{userIcon}");
                if(user.getUserAddress() != null)
                    SET("user_address = #{userAddress}");
                if(user.getUserPwd() != null)
                    SET("user_pwd = #{userPwd}");
                if (user.getUserOn() != null)
                    SET("user_on = #{userOn}");
                if (user.getUserType() != null)
                    SET("user_type = #{userType}");
                if (user.getUserAutograph() != null)
                    SET("user_autograph = #{userAutograph}");
                if (user.getUserDescription() != null)
                    SET("user_description = #{userDescription}");
                WHERE("user_id = #{studentId}");
            }
        }.toString();
    }

}
