package com.sn.weibospider;

import com.sn.model.UserInfo;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.Iterator;

/**
 * @author sn
 * @date 2018/6/15
 * @description 获取人物信息
 */
public class GetUserInfo {


    public static UserInfo getUserInfo(String userId, WebDriver webDriver) {
        String url="http://weibo.com/p/100505"+userId+"/info?mod=pedit_more";
        System.out.println("start: " + url);
        webDriver.get(url);
        WebDriverWait wait = new WebDriverWait(webDriver, 10);
        wait.until(new ExpectedCondition<WebElement>() {
            public WebElement apply(WebDriver webDriver) {
                return webDriver.findElement(By.cssSelector(".li_1.clearfix"));
            }
        });

        Document doc = Jsoup.parse(webDriver.getPageSource());
        Elements infos = doc.getElementsByAttributeValue("class", "li_1 clearfix");

        UserInfo userInfo = null;
        if(infos!=null) {
            userInfo = new UserInfo();
            userInfo.setUserId(userId);
        }
        Iterator<Element> it = infos.iterator();
        while (it.hasNext()) {
            Element item = it.next();
            String profile = item.getElementsByAttributeValue("class","pt_detail").text().trim();
            switch (item.getElementsByAttributeValue("class", "pt_title S_txt2").text()) {
                case "昵称：":
                    userInfo.setUsername(profile);
                    break;
                case "真实姓名：":
                    userInfo.setRealName(profile);
                    break;
                case "所在地：":
                    userInfo.setAddress(profile);
                    break;
                case "性别：":
                    userInfo.setGender(profile);
                    break;
                case "感情状况：":
                    userInfo.setRelationship(profile.replace("t", "").replace("rn", ""));
                    break;
                case "生日：":
                    userInfo.setBirthday(profile);
                    break;
                case "血型：":
                    userInfo.setBlood(profile);
                    break;
                case "简介：":
                    userInfo.setProfile(profile);
                    break;
                case "注册时间：":
                    userInfo.setRegistertime(profile.replace("t", "").replace("rn", ""));
                    break;
                case "邮箱：":
                    userInfo.setEmail(profile);
                    break;
                case "QQ：":
                    userInfo.setQq(profile);
                    break;
                case "标签：":
                    userInfo.setTag(profile.replace("t", "").replace("rn", ""));
                    break;
            }
        }


        return userInfo;
    }
}
