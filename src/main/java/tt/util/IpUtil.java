package tt.util;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;


/**
 * IP工具类
 * 
 * @author
 */
public class IpUtil
{

    /**
     * 获取登录用户的IP地址
     * 
     * @param request
     * @return
     */
    public static String getIpAddr(HttpServletRequest request)
    {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
        {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
        {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
        {
            ip = request.getRemoteAddr();
        }
        if (ip.equals("0:0:0:0:0:0:0:1"))
        {
            ip = "127.0.0.1";
        }
        if (ip.split(",").length > 1)
        {
            ip = ip.split(",")[0];
        }
        return ip;
    }

    /**
     * 通过IP获取地址
     * 
     * @param ip
     * @return
     */
    // public static String getIpInfo(String ip) {
    // String info = "";
    // InputStream in = null;
    // BufferedReader bufferedReader = null;
    // try {
    // URL url = new URL("http://ip.taobao.com/service/getIpInfo.php?ip=" + ip);
    // HttpURLConnection htpcon = (HttpURLConnection) url.openConnection();
    // htpcon.setRequestMethod("GET");
    // htpcon.setDoOutput(true);
    // htpcon.setDoInput(true);
    // htpcon.setUseCaches(false);
    //
    // in = htpcon.getInputStream();
    // bufferedReader = new BufferedReader(new InputStreamReader(in));
    // StringBuffer temp = new StringBuffer();
    // String line = bufferedReader.readLine();
    // while (line != null) {
    // temp.append(line).append("\r\n");
    // line = bufferedReader.readLine();
    // }
    //
    // JSONObject obj = (JSONObject) JSON.parse(temp.toString());
    // if (obj.getIntValue("code") == 0) {
    // JSONObject data = obj.getJSONObject("data");
    // info += data.getString("country") + " ";
    // info += data.getString("region") + " ";
    // info += data.getString("city") + " ";
    // info += data.getString("isp");
    // }
    // } catch (MalformedURLException e) {
    // e.printStackTrace();
    // } catch (ProtocolException e) {
    // e.printStackTrace();
    // } catch (IOException e) {
    // e.printStackTrace();
    // }finally{
    // if(in != null){
    // inClose(in);
    // }
    // if(bufferedReader != null){
    // bufferedReaderClose(bufferedReader);
    // }
    // }
    // return info;
    // }

    public static void inClose(InputStream in)
    {
        if (in != null)
        {
            try
            {
                in.close();
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }
    }

    public static void bufferedReaderClose(BufferedReader bufferedReader)
    {
        if (bufferedReader != null)
        {
            try
            {
                bufferedReader.close();
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }
    }

}
