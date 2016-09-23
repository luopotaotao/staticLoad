package tt.timingTask;


import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import tt.listener.ServerListener;
import tt.pageModel.Userlog;
import tt.service.OnlineServiceI;
import tt.service.UserlogServiceI;
import tt.util.DateUtil;


/**
 * @author zhangxh
 */
@Component
public class OnlineJob
{
    private static Map<String, Date> map = new HashMap<String, Date>();

    private static Map<String, Date> operateMap = new HashMap<String, Date>();

    @Autowired
    private UserlogServiceI userlogService;

    private Logger logger = Logger.getLogger(OnlineJob.class);

    @Autowired
    private OnlineServiceI onlineService;

    /**
     * 用户关闭浏览器后，从在线用户表中删除该用户 用户长时间不操作，自动退出，从在线用户表中删除该用户。
     */
    public void onlineofuser()
    {
        // 判断用户是否关闭浏览器
        Iterator<Map.Entry<String, Date>> it = map.entrySet().iterator();
        while (it.hasNext())
        {
            Map.Entry<String, Date> m = it.next();
            // 1min
            if (new Date().getTime() - m.getValue().getTime() > 1000 * 20)
            {
                String name = m.getKey();
                it.remove();
                operateMap.remove(name);
                try
                {
                    onlineService.deleteTonlineByLoginName(name);
                }
                catch (Exception e)
                {
                    logger.info("删除在线用户失败");
                }
                Userlog u = new Userlog();
                u.setUserLogId(UUID.randomUUID().toString());
                u.setAdminName(name);
                u.setUrl("Not a normal exit");
                u.setText("用户可能是关闭浏览器等方式非正常退出");
                u.setCreateTime(new Date());
                try
                {
                    userlogService.add(u);
                }
                catch (Exception e)
                {
                    logger.info("日志记录失败");
                }
                logger.info(name + "用户可能是关闭浏览器等方式非正常退出");
            }

        }
        Iterator<Map.Entry<String, Date>> itOperate = operateMap.entrySet().iterator();
        while (itOperate.hasNext())
        {
            Map.Entry<String, Date> operateM = itOperate.next();
            String name = operateM.getKey();
            // 默认超时时间5分钟
            int operateTimeout = 10;
            if (ServerListener.sysConfigMap.containsKey("OPERATE_TIMEOUT"))
            {
                operateTimeout = Short.parseShort(ServerListener.sysConfigMap.get(
                    "OPERATE_TIMEOUT").getConfContext());
            }
            // 用户长时间不操作，自动退出
            if (new Date().getTime() - operateM.getValue().getTime() > 1000 * 60 * Integer.valueOf(operateTimeout))
            {
                logger.info("当前时间：" + DateUtil.format(new Date(), "HH:mm:ss SSS") + ",用户最后一次操作时间"
                            + DateUtil.format(operateMap.get(name), "HH:mm:ss SSS"));
                itOperate.remove();
                map.remove(name);

                try
                {
                    onlineService.deleteTonlineByLoginName(name);
                }
                catch (Exception e)
                {
                    logger.info("删除在线用户失败");
                }
                Userlog u1 = new Userlog();
                u1.setUserLogId(UUID.randomUUID().toString());
                u1.setText("用户可能是长时间没操作，自动退出");
                u1.setUrl("Not a normal exit");
                u1.setAdminName(name);
                u1.setCreateTime(new Date());
                try
                {
                    userlogService.add(u1);
                }
                catch (Exception e)
                {
                    logger.info("日志记录失败");

                }
                logger.info(name + "用户长时间没操作，自动退出");
            }
        }

    }

    public static Map<String, Date> getMap()
    {
        return map;
    }

    public static void setMap(Map<String, Date> map)
    {
        OnlineJob.map = map;
    }

    public static Map<String, Date> getOperateMap()
    {
        return operateMap;
    }

    public static void setOperateMap(Map<String, Date> operateMap)
    {
        OnlineJob.operateMap = operateMap;
    }

}
