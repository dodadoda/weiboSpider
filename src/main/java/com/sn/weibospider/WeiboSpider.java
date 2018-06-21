package com.sn.weibospider;

import com.alibaba.fastjson.JSONObject;
import com.sn.model.InitUser;
import com.sn.model.UserInfo;
import com.sn.utils.DbDao;
import com.sn.utils.HttpUtil;
import org.openqa.selenium.By;
import org.openqa.selenium.Cookie;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.sql.Connection;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import static java.lang.Thread.sleep;

// 微博爬虫
public class WeiboSpider {

    private static WeiboSpider instance;


    public static WeiboSpider getInstance () {
        if(instance == null)
            instance = new WeiboSpider();
        return instance;
    }

    private WeiboSpider() {
    }


    // 开始
    public void start(Connection conn) throws Exception{

        InitUser user = new InitUser("15608068781", "hh123456", "3677513777");
        WebDriver webDriver = login(user);
        Set<String> attachList = GetUserList.getFollowList(user.getUserId(), webDriver);
        Iterator<String> it = attachList.iterator();
        while (it.hasNext()) {
            String userid = it.next();
            try {
                UserInfo userInfo = GetUserInfo.getUserInfo(userid, webDriver);
                System.out.println(JSONObject.toJSONString(userInfo));
                DbDao.insertUserInfo(conn, userInfo);
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // 登陆操作
    private WebDriver login(InitUser user) {
        //配置ChromeDiver
        System.getProperties().setProperty("webdriver.chrome.driver", "I://chromedriver.exe");
        //开启新WebDriver进程
        WebDriver webDriver = new ChromeDriver();
        //全局隐式等待
        webDriver.manage().timeouts().implicitlyWait(10,TimeUnit.SECONDS);
        //设定网址
        webDriver.get("https://weibo.com/");
        //显示等待控制对象
        WebDriverWait webDriverWait=new WebDriverWait(webDriver,10);
        //等待输入框可用后输入账号密码
        webDriverWait.until(ExpectedConditions.elementToBeClickable(By.id("loginname"))).sendKeys(user.getUsername());
        webDriverWait.until(ExpectedConditions.elementToBeClickable(By.name("password"))).sendKeys(user.getPassword());
        //点击登录
        WebElement login = webDriver.findElement(By.xpath("//a[@tabindex='6']"));
        login.click();
        //等待2秒用于页面加载，保证Cookie响应全部获取。
        try {
            sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        //获取Cookie并打印
        Set<Cookie> cookies=webDriver.manage().getCookies();
        Iterator iterator=cookies.iterator();
        while (iterator.hasNext()){
            System.out.println(iterator.next().toString());
        }

        return webDriver;
    }
}
