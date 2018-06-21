package com.sn.utils;

import okhttp3.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author sn
 * @date 2018/6/15
 * @description TODO
 */
public class HttpUtil {

    private static String userAgent = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36";

    private final HashMap<String, List<Cookie>> cookieStore = new HashMap<>();

    public String getHtml(String url) throws IOException {
        OkHttpClient httpClient = new OkHttpClient.Builder()
                .cookieJar(new CookieJar() {
                    @Override
                    public void saveFromResponse(HttpUrl httpUrl, List<Cookie> list) {
                        cookieStore.put(httpUrl.host(), list);
                    }

                    @Override
                    public List<Cookie> loadForRequest(HttpUrl httpUrl) {
                        List<Cookie> cookies = cookieStore.get(httpUrl.host());
                        return cookies != null ? cookies : new ArrayList<Cookie>();
                    }
                }).build();
        /*OkHttpClient httpClient = new OkHttpClient().newBuilder()
                .cookieJar(new CookieJar() {
                    @Override
                    public void saveFromResponse(HttpUrl httpUrl, List<Cookie> list) {
                        System.out.println(list);
                    }

                    @Override
                    public List<Cookie> loadForRequest(HttpUrl httpUrl) {
                        return null;
                    }
                }).build();*/
        Request request = new Request.Builder()
                .url(url)
                .addHeader("User-Agent", userAgent)
                .build();

        Call call = httpClient.newCall(request);
        Response response = call.execute();

        System.out.println(response.body().string());
        String html = null;
        if(response.isSuccessful()){
            html = response.body().string().replace("\\", "");
            Document doc=Jsoup.parse(html);
            Elements scripts = doc.getElementsByTag("script"); //获取script标签
            //Element script=scripts.get(scripts.size()-1);  // 获取包含了网页内容的script标签

            //System.out.println(script.html());
            Pattern p=Pattern.compile("\"html\":\"");    //从该json数据格式中抽取出html内容
            String htmlstr="";
            for(Element script:scripts){
                Matcher m=p.matcher(html=script.html());
                if(m.find()){
                    String str=html.substring(m.end(),html.length()-3);
                    htmlstr+=str;
                }
            }

            html=Jsoup.parse(htmlstr).html();
            //System.out.println(html);


        }
        else{
            System.out.println("Network is error");
        }

        return html;
    }

}
