package com.sn.utils;

import com.sn.model.UserInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * @author sn
 * @date 2018/6/15
 * @description TODO
 */
public class DbDao {

    public static void insertUserInfo(Connection conn, UserInfo userInfo) throws Exception{
        String sql = "INSERT INTO userinfo"
                + "(userid,username,realname,address,gender,relation_ship,birthday,blood,profile,register_time,email,qq,tag) "
                + "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";

        if(userInfo != null && userInfo.getUserId() != null) {
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, userInfo.getUserId());
            psmt.setString(2, userInfo.getUsername());
            psmt.setString(3, userInfo.getRealName());
            psmt.setString(4, userInfo.getAddress());
            psmt.setString(5, userInfo.getGender());
            psmt.setString(6, userInfo.getRelationship());
            psmt.setString(7, userInfo.getBirthday());
            psmt.setString(8,userInfo.getBlood());
            psmt.setString(9,userInfo.getProfile());
            psmt.setString(10,userInfo.getRegistertime() );
            psmt.setString(11,userInfo.getEmail());
            psmt.setString(12,userInfo.getQq());
            psmt.setString(13, userInfo.getTag());

            psmt.executeUpdate();
            psmt.close();
        }

        System.out.println("插入"+userInfo.getUsername()+"个人信息成功！");
    }
}
