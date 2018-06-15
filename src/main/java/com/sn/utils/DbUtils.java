package com.sn.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

/**
 * 数据库工具类
 */
public class DbUtils {

    private static String url = "jdbc:mysql://10.205.3.122:3306/weibo_db";
    private static String username = "root";
    private static String password = "123456";

    public static Connection getConn() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, username, password);
        return conn;
    }

    public static void closeConn(Connection conn) throws Exception{
        if(conn!=null){
            conn.close();
            conn=null;
        }
    }
    public static void closeRs(ResultSet rs) throws Exception{
        if(rs!=null){
            rs.close();
            rs=null;
        }
    }
    public static void main(String[] args){
        //DbUtil dbUtil=new DbUtil();
        try {
            getConn();
            System.out.println("数据库连接成功");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("数据库连接失败!");
        }
    }
}
