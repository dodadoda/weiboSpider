package com.sn.main;

import com.sn.utils.DbUtils;
import com.sn.weibospider.WeiboSpider;

import java.sql.Connection;

public class Main {
    public static void main(String[] args) throws Exception {

        // 初始化数据库连接
        Connection conn = DbUtils.getConn();
        // 配置chromeDriver
        WeiboSpider.getInstance().start(conn);
    }




}
