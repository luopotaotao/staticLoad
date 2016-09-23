package tt.otas;


import java.util.HashMap;
import java.util.Map;
import org.apache.log4j.Logger;
import tt.pageModel.Json;
import tt.util.HttpUtil;
import tt.util.LoadConfigFile;
import com.alibaba.fastjson.JSON;


public class NoticeAPKP
{
    private static final Logger logger = Logger.getLogger(NoticeAPKP.class);

    public static void appVersionUpdateToApkp(String aid)
        throws Exception
    {
        LoadConfigFile loadconfigfile = LoadConfigFile.getInstance();
        String[] url = loadconfigfile.getValue("ctsmUrl").split(";");
        String requestType = loadconfigfile.getValue("requestType");
        String result = "";
        for (int i = 0; i < url.length; i++ )
        {
            HttpUtil httputil = HttpUtil.getInstance("utf-8", 10000, 10000);
            Map<String, String> params = new HashMap<String, String>();
            params.put("Aid", aid);
            if ("http".equals(requestType))
            {
                result = httputil.sendHttpPost(url[i], params, null);

            }
            else if ("https".equals(requestType))
            {
                result = httputil.sendHttpsPost(url[i], params, null);

            }
            if (!"".equals(result))
            {
                Json j = new Json();
                j = JSON.parseObject(result, Json.class);
                if (j != null && j.isSuccess())
                {
                    logger.info(url[i] + "通知成功!");
                }
            }
            else
            {
                logger.info(url[i] + "通知失败!");
            }
        }
    }

    public static void configUpdateToApkp(String opertype)
        throws Exception
    {
        LoadConfigFile l = LoadConfigFile.getInstance();
        String url = l.getValue("configUpdateToApkpUrl");
        if (url != null && !url.equals(""))
        {
            String[] urls = l.getValue("configUpdateToApkpUrl").split(";");
            Map<String, String> params = new HashMap<String, String>();
            params.put("opertype", opertype);
            String result = "";
            for (int i = 0; i < urls.length; i++ )
            {
                try
                {
                    if (urls[i].startsWith("http"))
                    {
                        HttpUtil httputil = HttpUtil.getInstance("UTF-8", 60000, 60000);
                        result = httputil.sendHttpPost(urls[i], params, null);
                        if (result != null && !"".equals(result))
                        {
                            Json j = JSON.parseObject(result, Json.class);
                            if (j.isSuccess())
                            {
                                logger.info("参数更新通知Apkp[" + urls[i] + "]成功!");
                            }
                            else
                            {
                                logger.info("参数更新通知Apkp[" + urls[i] + "]失败!");
                            }
                        }
                        else
                        {
                            logger.info("apkp[" + urls[i] + "]后台返回结果为空，通知apkp失败!");
                        }
                    }
                    else
                    {
                        HttpUtil httputil = HttpUtil.getInstance("UTF-8", 60000, 60000);
                        result = httputil.sendHttpsPost(urls[i], params, null);
                        if (result != null && !"".equals(result))
                        {
                            Json j = JSON.parseObject(result, Json.class);
                            if (j.isSuccess())
                            {
                                logger.info("参数更新通知Apkp[" + urls[i] + "]成功!");
                            }
                            else
                            {
                                logger.info("参数更新通知Apkp[" + urls[i] + "]失败!");
                            }
                        }
                        else
                        {
                            logger.info("apkp[" + urls[i] + "]后台返回结果为空，通知apkp失败!");
                        }
                    }
                }
                catch (Exception e)
                {
                    logger.info("参数更新通知Apkp[" + urls[i] + "]失败!");
                }

            }
        }
        else
        {
            logger.info("通知apkp的URL为空，通知失败");
        }
    }

}
