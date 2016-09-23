package tt.util;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Map;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.log4j.Logger;


/**
 * HTTP 工具类 http get/post请求 https get/post请求O
 * 
 * @author zhangziqi
 */
public class HttpUtil
{

    private static Logger logger = Logger.getLogger(HttpUtil.class);

    private static HttpUtil httputil = new HttpUtil();

    public HttpUtil()
    {

    }

    // 默认字符编码
    static String default_charset = "UTF-8";

    // 默认连接超时时间
    static int default_connecttimeout = 10000;

    // 默认读取超时时间
    static int default_readtimeout = 10000;

    /**
     * 返回对象
     * 
     * @param charset
     *            编码集合， 可空。 目前支持UTF-8|UTF-16|ASCII|GB2312|GBK|ISO-8859-1|UNICODE 可空 默认UTF-8
     * @param connecttimeout
     *            连接超时时间,不可小于10秒,最长不大于60秒, 单位为毫秒
     * @param readtimeout
     *            读超时时间 ,不可小于10秒,最长不大于60秒, 单位为毫秒
     * @return
     */
    public static HttpUtil getInstance(String charset, int connecttimeout, int readtimeout)
    {
        if (connecttimeout >= default_connecttimeout)
        {
            if (connecttimeout > 60000)
            {
                default_connecttimeout = 60000;
            }
            else
            {
                default_connecttimeout = connecttimeout;
            }
        }
        if (readtimeout >= default_readtimeout)
        {
            if (readtimeout > 60000)
            {
                default_readtimeout = 60000;
            }
            else
            {
                default_readtimeout = readtimeout;
            }
        }
        if (charset != null && !"".equals(charset))
        {
            charset = charset.toUpperCase();
            String[] temp = {"UTF-8", "UTF-16", "ASCII", "GB2312", "GBK", "ISO-8859-1", "UNICODE"};
            for (int i = 0; i < temp.length; i++ )
            {
                if (charset.equals(temp[i]))
                {
                    default_charset = charset;
                    break;
                }
            }
        }
        logger.info("编码集[" + default_charset + "],连接超时时间[" + default_connecttimeout + "]毫秒,读写超时时间["
                    + default_readtimeout + "]毫秒");
        return httputil;
    }

    /**
     * 把Map 转换为 key=value&key1=value1的格式
     * 
     * @param map
     * @return
     */
    private static String changeMap2String(Map<String, String> map)
    {
        // 判断Key Value参数Map集合是否有数据，如果有处理成key=value&key2=value2格式
        if (map != null && map.size() != 0)
        {
            StringBuffer sb = new StringBuffer();
            String str = "";
            for (Map.Entry<String, String> entry : map.entrySet())
            {
                sb.append(entry.getKey() + "=" + entry.getValue() + "&");
            }
            if (!"".equals(sb.toString()))
            {
                str = "?" + sb.substring(0, sb.length() - 1);
            }
            return str;
        }
        else
        {
            return "";
        }
    }

    /**
     * 发送 POST方法的 HTTP请求
     * 
     * @param url
     *            URL地址
     * @param map
     *            参数集合 key value格式。 可空
     * @return
     */
    public String sendHttpPost(String url, Map<String, String> map, String str)
    {
        HttpURLConnection connection = null;
        // 输出流
        OutputStream out = null;
        // 读取响应流
        BufferedReader in = null;
        // 响应结果
        String result = "";
        // 判断URL是否为空
        if (url == null || url.equals(""))
        {
            logger.info("URL不能为空");
            return null;
        }
        // 增加参数
        url += changeMap2String(map);
        try
        {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            connection = (HttpURLConnection)realUrl.openConnection();
            // 设置头信息
            connection.setRequestProperty("Connection", "Keep-Alive");
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("Content-Type", "text/html; charset=" + default_charset);
            // 设置不缓存
            connection.setUseCaches(false);
            // 发送POST请求必须设置如下两行
            connection.setDoOutput(true);
            connection.setDoInput(true);
            // 设置连接超时时间
            connection.setConnectTimeout(default_connecttimeout);
            // 设置读取超时时间
            connection.setReadTimeout(default_readtimeout);
            out = connection.getOutputStream();
            // 判断要发送的数据是否为空
            if (str != null && !"".equals(str))
            {
                // 要发送的数据 *目前只支持字符串传输暂不支持文件等
                try
                {
                    // 按字符集编码转流
                    byte[] data = str.getBytes(default_charset);
                    out.write(data);
                }
                catch (UnsupportedEncodingException e)
                {
                    e.printStackTrace();
                }
            }
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null)
            {
                result += line;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            logger.info("http Post请求发生异常：" + e.getMessage());
            return e.getMessage();
        }
        finally
        {
            try
            {
                if (out != null)
                {
                    out.close();
                }
                if (in != null)
                {
                    in.close();
                }
                if (connection != null)
                {
                    connection.disconnect();
                }
            }
            catch (IOException ex)
            {
                ex.printStackTrace();
                return "";
            }
        }
        return result;
    }

    /**
     * 发送 GET方法的 HTTP请求
     * 
     * @param url
     *            URL地址
     * @param map
     *            参数集合 key value格式。 可空
     * @return
     */
    public String sendHttpGet(String url, Map<String, String> map)
    {
        HttpURLConnection connection = null;
        // 输出流
        OutputStream out = null;
        // 读取响应流
        BufferedReader in = null;
        // 响应结果
        String result = "";
        // 判断URL是否为空
        if (url == null || url.equals(""))
        {
            logger.info("URL不能为空");
            return null;
        }
        // 增加参数
        url += changeMap2String(map);
        try
        {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            connection = (HttpURLConnection)realUrl.openConnection();
            // 设置头信息
            connection.setRequestProperty("Connection", "Keep-Alive");
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("Content-Type", "text/html; charset=" + default_charset);
            // 设置不缓存
            connection.setUseCaches(false);
            // 设置连接超时时间
            connection.setConnectTimeout(default_connecttimeout);
            // 设置读取超时时间
            connection.setReadTimeout(default_readtimeout);
            // 建立实际的连接
            connection.connect();
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null)
            {
                result += line;
            }
        }
        catch (Exception e)
        {
            logger.info("http Get请求发生异常：" + e.getMessage());
            return null;
        }
        finally
        {
            try
            {
                if (out != null)
                {
                    out.close();
                }
                if (in != null)
                {
                    in.close();
                }
                if (connection != null)
                {
                    connection.disconnect();
                }
            }
            catch (IOException ex)
            {
                ex.printStackTrace();
                return null;
            }
        }
        return result;
    }

    private static class DefaultTrustManager implements X509TrustManager
    {

        @Override
        public void checkClientTrusted(X509Certificate[] arg0, String arg1)
            throws CertificateException
        {}

        @Override
        public void checkServerTrusted(X509Certificate[] arg0, String arg1)
            throws CertificateException
        {}

        @Override
        public X509Certificate[] getAcceptedIssuers()
        {
            return null;
        }
    }

    /**
     * 发送 POST方法的 HTTPS请求
     * 
     * @param url
     *            URL地址
     * @param map
     *            参数集合 key value格式。 可空
     * @return
     */
    public String sendHttpsPost(String url, Map<String, String> map, String str)
    {
        HttpsURLConnection connection = null;
        // 输出流
        OutputStream out = null;
        // 读取响应流
        BufferedReader in = null;
        // 响应结果
        String result = "";
        try
        {
            try
            {
                SSLContext ctx = SSLContext.getInstance("TLS");
                ctx.init(new KeyManager[0], new TrustManager[] {new DefaultTrustManager()},
                    new SecureRandom());
                SSLContext.setDefault(ctx);
                // 判断URL是否为空
                if (url == null || url.equals(""))
                {
                    logger.info("URL不能为空");
                    return null;
                }
                // 增加参数
                url += changeMap2String(map);
                URL realUrl = new URL(url);
                // 打开和URL之间的连接
                connection = (HttpsURLConnection)realUrl.openConnection();
                connection.setHostnameVerifier(new HostnameVerifier()
                {
                    @Override
                    public boolean verify(String hostname, SSLSession session)
                    {
                        return true;
                    }
                });
                // 设置不缓存
                connection.setUseCaches(false);
                // 发送POST请求必须设置如下两行
                connection.setDoInput(true);
                connection.setDoOutput(true);
                // 设置头信息
                connection.setRequestProperty("Connection", "Keep-Alive");
                connection.setRequestProperty("accept", "*/*");
                connection.setRequestProperty("Content-Type",
                    "text/html; charset=" + default_charset);
                connection.setConnectTimeout(default_connecttimeout);
                connection.setReadTimeout(default_readtimeout);
                out = connection.getOutputStream();
                // 判断要发送的数据是否为空
                if (str != null && !"".equals(str))
                {
                    // 要发送的数据 *目前只支持字符串传输暂不支持文件等
                    try
                    {
                        // 按字符集编码转流
                        byte[] data = str.getBytes(default_charset);
                        out.write(data);
                    }
                    catch (UnsupportedEncodingException e)
                    {
                        e.printStackTrace();
                    }
                }
                out.flush();
                // 定义 BufferedReader输入流来读取URL的响应
                in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String line;
                while ((line = in.readLine()) != null)
                {
                    result += line;
                }
            }
            catch (Exception e)
            {
                logger.info("https post请求发生异常：" + e.getMessage());
                return null;
            }
        }
        finally
        {
            try
            {
                if (out != null)
                {
                    out.close();
                }
                if (connection != null)
                {
                    connection.disconnect();
                }
                if (in != null)
                {
                    in.close();
                }
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }

        return result;
    }

    /**
     * 发送 GET方法的 HTTPS请求
     * 
     * @param url
     *            URL地址
     * @param map
     *            参数集合 key value格式。 可空
     * @return
     */
    public String sendHttpsGet(String url, Map<String, String> map)
    {
        HttpsURLConnection connection = null;
        // 输出流
        OutputStream out = null;
        // 读取响应流
        BufferedReader in = null;
        // 响应结果
        String result = "";
        try
        {
            try
            {
                SSLContext ctx = SSLContext.getInstance("TLS");
                ctx.init(new KeyManager[0], new TrustManager[] {new DefaultTrustManager()},
                    new SecureRandom());
                SSLContext.setDefault(ctx);
                // 判断URL是否为空
                if (url == null || url.equals(""))
                {
                    logger.info("URL不能为空");
                    return null;
                }
                // 增加参数
                url += changeMap2String(map);
                URL realUrl = new URL(url);
                // 打开和URL之间的连接
                connection = (HttpsURLConnection)realUrl.openConnection();
                connection.setHostnameVerifier(new HostnameVerifier()
                {
                    @Override
                    public boolean verify(String hostname, SSLSession session)
                    {
                        return true;
                    }
                });
                // 设置不缓存
                connection.setUseCaches(false);
                // 发送POST请求必须设置如下两行
                connection.setDoInput(true);
                connection.setDoOutput(true);
                // 设置头信息
                connection.setRequestProperty("Connection", "Keep-Alive");
                connection.setRequestProperty("accept", "*/*");
                connection.setRequestProperty("Content-Type",
                    "text/html; charset=" + default_charset);
                connection.setConnectTimeout(default_connecttimeout);
                connection.setReadTimeout(default_readtimeout);
                // 建立实际的连接
                connection.connect();
                // 定义 BufferedReader输入流来读取URL的响应
                in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String line;
                while ((line = in.readLine()) != null)
                {
                    result += line;
                }
            }
            catch (Exception e)
            {
                logger.info("https post请求发生异常：" + e.getMessage());
                return null;
            }
        }
        finally
        {
            try
            {
                if (out != null)
                {
                    out.close();
                }
                if (connection != null)
                {
                    connection.disconnect();
                }
                if (in != null)
                {
                    in.close();
                }
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }

        return result;
    }

}