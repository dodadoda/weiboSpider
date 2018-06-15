package com.sn.weibospider;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.*;

/**
 * @author sn
 * @date 2018/6/15
 * @description 获取微博关注人数
 */
public class GetUserList {

    /**
     * 获取目标关注的人数
     * @param userId 目标id，此id为微博的id
     * @return 关注人数
     */
    public static Set<String> getFollowList(String userId, WebDriver webDriver) {
        Set<String> list = new HashSet<String>();
        // 关注列表
        String url = "https://weibo.com/p/100505"+userId+"/myfollow?Pl_Official_RelationMyfollow__92_page=";
        int pageIndex = 1;
        webDriver.get(url + pageIndex);
        Document doc = Jsoup.parse(webDriver.getPageSource());

        // 获取一共有多少页
        Element pageNode = doc.getElementsByAttributeValue("class", "page S_txt1").last();

        int pageNum = Integer.parseInt(pageNode.text());
        System.out.println("关注列表页数： " + pageNum);
        list.addAll(getFollowListPerPage(webDriver, doc));

        for (pageIndex = 2; pageIndex < pageNum + 1; pageIndex++) {
            webDriver.get(url + pageIndex);
            WebDriverWait webDriverWait=new WebDriverWait(webDriver,10);
            webDriverWait.until(new ExpectedCondition<WebElement>() {
                public WebElement apply(WebDriver webDriver) {
                    return webDriver.findElement(By.cssSelector(".member_li.S_bg1"));
                }
            });
            Document docTemp = Jsoup.parse(webDriver.getPageSource());
            list.addAll(getFollowListPerPage(webDriver, docTemp));
        }
        System.out.println("result: " + list.size());
        return list;
    }

    /**
     * 获取每一页的关注列表
     * @return
     */
    public static Set<String> getFollowListPerPage(WebDriver webDriver, Document doc) {
        Set<String> list = new HashSet<String>();

        System.out.println("开始拉取目标关注列表......");
        System.out.println("关注人数: " + doc.getElementsByAttributeValue("class", "attach S_txt1").text());
        // System.out.println("关注人数: " + webDriver.findElement(By.cssSelector(".attach.S_txt1")).getText());
        Elements listNode = doc.getElementsByAttributeValue("class", "member_li S_bg1");
        // 迭代元素列表
        Iterator<Element> it = listNode.iterator();
        while (it.hasNext()) {
            Element item = it.next();
            String value = item.attr("action-data");
            if(value != null) {
                String[] temp = value.split("&");
                for (String s : temp) {
                    String[] tempj = s.split("=");
                    if(tempj[0].equals("uid") && tempj[1] != null && tempj[1].length() < 11) {
                        list.add(tempj[1]);
                    }
                }
            }
        }
        for (String s : list) {
            System.out.println("id:" + s);
        }
        return list;
    }
}
