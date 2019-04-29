package com.example.userservice.dao;

import com.example.common.entity.User;
import org.apache.ibatis.annotations.*;

@Mapper
public interface UserMapper {

    /**
     * @discription 根据用户的学号用户的邮箱，及密码进行查询用户信息
     * @param account 用户的学号或邮箱
     * @param pwd 用户的密码
     * @return 返回查询到的用户对象，查询不到返回null
     */
    @Select("select * from user_info where (user_on = #{arg0} or user_email = #{arg0}) and user_pwd = #{arg1}")
    @Results({
            @Result(property = "userId", column = "user_id"),
            @Result(property = "userType", column = "user_type"),
            @Result(property = "userOn", column = "user_on"),
            @Result(property = "userName", column = "user_name"),
//            @Result(property = "userPwd", column = "user_pwd"),
            @Result(property = "userEmail", column = "user_email"),
            @Result(property = "userPhone", column = "user_phone"),
            @Result(property = "userAddress", column = "user_address"),
            @Result(property = "userIcon", column = "user_icon"),
            @Result(property = "userDescription", column = "user_description"),
            @Result(property = "userAutograph", column = "user_autograph"),
            @Result(property = "userSex", column = "user_sex"),
            @Result(property = "userDate", column = "user_date"),
    })
    public User queryUser(String account, String pwd);

    @Select("select * from user_info where user_id = #{arg0}")
    @Results({
            @Result(property = "userId", column = "user_id"),
            @Result(property = "userType", column = "user_type"),
            @Result(property = "userOn", column = "user_on"),
            @Result(property = "userName", column = "user_name"),
//            @Result(property = "userPwd", column = "user_pwd"),
            @Result(property = "userEmail", column = "user_email"),
            @Result(property = "userPhone", column = "user_phone"),
            @Result(property = "userAddress", column = "user_address"),
            @Result(property = "userIcon", column = "user_icon"),
            @Result(property = "userDescription", column = "user_description"),
            @Result(property = "userAutograph", column = "user_autograph"),
            @Result(property = "userSex", column = "user_sex"),
            @Result(property = "userDate", column = "user_date"),
    })
    public User queryUserByUid(int uid);

    @InsertProvider(type = DynamicSqlProvider.class, method = "addUserProvider")
    public boolean insertUser(User user);

    @UpdateProvider(type = DynamicSqlProvider.class, method = "updateUserProvider")
    public boolean updateUser(User user);


}
