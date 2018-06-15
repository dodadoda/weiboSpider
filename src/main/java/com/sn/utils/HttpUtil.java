package com.sn.utils;

import okhttp3.Call;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author sn
 * @date 2018/6/15
 * @description TODO
 */
public class HttpUtil {

    private static String userAgent = "Mozilla/5.0 " +
            "(iPhone; CPU iPhone OS 11_0 like Mac OS X) " +
            "AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1";

    public String getHtml(String url) throws IOException {
        OkHttpClient httpClient = new OkHttpClient();
        Request request = new Request.Builder()
                .url(url)
                .addHeader("User-Agent", userAgent)
                .build();

        Call call = httpClient.newCall(request);
        Response response = call.execute();


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
