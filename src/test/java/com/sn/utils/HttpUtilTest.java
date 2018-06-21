package com.sn.utils;

import com.alibaba.fastjson.JSONObject;
import com.sn.model.InitUser;
import com.sn.model.UserInfo;
import com.sn.weibospider.GetUserInfo;
import com.sn.weibospider.GetUserList;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Cookie;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.IOException;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import static java.lang.Thread.sleep;
import static org.junit.Assert.*;

/**
 * @author sn
 * @date 2018/6/15
 * @description TODO
 */
public class HttpUtilTest {

    @Test
    public void getHtml() throws IOException {

        InitUser user = new InitUser("15608068781", "hh123456", "3677513777");
        HttpUtil client = new HttpUtil();
        client.getHtml("https://weibo.com/login.php");
    }
}