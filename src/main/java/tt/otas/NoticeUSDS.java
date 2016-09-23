//package laser.otas;
//
//
//import java.util.UUID;
//
//import tt.pageModel.BusinessConfig;
//import tt.util.HttpUtil;
//import tt.util.LoadConfigFile;
//
//import org.apache.log4j.Logger;
//
//import com.alibaba.fastjson.JSON;
//import com.crb.tsm.otam.request.OtamParameterReloadReq;
//import com.crb.tsm.otam.response.OtamParameterReloadResp;
//
//
//public class NoticeUSDS
//{
//
//    private static final Logger logger = Logger.getLogger(NoticeUSDS.class);
//
//    /**
//     * 通知USDS更新系统参数信息
//     *
//     * @param clientPlugId
//     * @throws Exception
//     */
//    public static void configUpdateToUSDS()
//        throws Exception
//    {
//        BusinessConfig c = new BusinessConfig();
//        c.setConfContext("a");
//        String str = JSON.toJSONString(c);
//        // Map params = new HashMap();
//        // params.put("operType", "1");
//        updateToUSDS(str);
//    }
//
//    private static void updateToUSDS(String str)
//    {
//        LoadConfigFile loadconfigfile = LoadConfigFile.getInstance();
//        String[] url = loadconfigfile.getValue("usdsUrl").split(";");
//        String requestType = loadconfigfile.getValue("requestType");
//        String result = "";
//        for (int i = 0; i < url.length; i++ )
//        {
//            HttpUtil httputil = HttpUtil.getInstance("UTF-8", 60000, 60000);
//
//            if ("http".equals(requestType))
//            {
//                result = httputil.sendHttpPost(url[i], null, str);
//
//            }
//            else if ("https".equals(requestType))
//            {
//                result = httputil.sendHttpsPost(url[i], null, str);
//
//            }
//            if (!"".equals(result))
//            {
//                logger.info(result);
//
//            }
//            else
//            {
//                logger.info(url[i] + "通知失败!");
//            }
//        }
//    }
//
//    public static void confiUpdateToUsds(String opertype)
//        throws Exception
//    {
//        LoadConfigFile l = LoadConfigFile.getInstance();
//        String ips = l.getValue("usdsIp");
//        if (ips != null && !ips.equals(""))
//        {
//            if (ips.contains(";"))
//            {
//                for (int i = 0; i < ips.split(";").length; i++ )
//                {
//                    String ip = ips.split(";")[i];
//                    sendToUsds(opertype, ip, l);
//                }
//            }
//            else
//            {
//                String ip = ips;
//                sendToUsds(opertype, ip, l);
//            }
//        }
//        else
//        {
//            logger.info("通知USDS-[没有配置USDS信息！");
//        }
//    }
//
//    public static void sendToUsds(String opertype, String ip, LoadConfigFile l)
//        throws Exception
//    {
//        int port = Integer.parseInt(l.getValue("usdsPort"));
//        int idleTime = Integer.parseInt(l.getValue("usdsIdleTime"));
//        long connectTimeout = Long.parseLong(l.getValue("usdsConnectTimeout"));
//        TcpClient tcpclient = TcpClient.getInstance(ip, port, idleTime, connectTimeout);
//        OtamParameterReloadReq req = new OtamParameterReloadReq();
//        String taskId = UUID.randomUUID().toString();
//        req.setOperType(Integer.parseInt(opertype));
//        req.setTaskId(taskId);
//        Object obj = tcpclient.sendDataSyn(req);
//        OtamParameterReloadResp res = (OtamParameterReloadResp)obj;
//        String str = "";
//        if (opertype.equals("1"))
//        {
//            str = "应用基础信息变更";
//        }
//        else if (opertype.equals("2"))
//        {
//            str = "应用版本信息变更";
//        }
//        else if (opertype.equals("3"))
//        {
//            str = "包信息变更";
//        }
//        else if (opertype.equals("4"))
//        {
//            str = "辅助安全域信息变更";
//        }
//        else if (opertype.equals("5"))
//        {
//            str = "主安全域信息变更";
//        }
//        else if (opertype.equals("6"))
//        {
//            str = "合作伙伴平台信息变更";
//        }
//        else if (opertype.equals("7"))
//        {
//            str = "业务参数配置信息变更";
//        }
//        if (res != null)
//        {
//            logger.info("通知USDS-[USDSIP：" + ip + ",流水号：'" + taskId + "',操作类型：'" + str + "',通知USDS"
//                        + res.getResultDesc() + "]");
//        }
//        else
//        {
//            logger.info(
//                "通知USDS-[USDSIP：" + ip + ",流水号：'" + taskId + ",操作类型：'" + str + "',通知USDS失败！");
//        }
//        tcpclient.close();
//    }
//}
