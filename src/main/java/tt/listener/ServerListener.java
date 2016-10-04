package tt.listener;


import java.util.Date;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import tt.model.TSystemConfig;
import tt.pageModel.SessionInfo;
import tt.service.OnlineServiceI;
import tt.service.SystemConfigServiceI;
import tt.timingTask.OnlineJob;
import tt.util.ConfigUtil;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


public class ServerListener implements ServletContextListener, HttpSessionListener, HttpSessionAttributeListener
{
    private static final Logger logger = Logger.getLogger(ServerListener.class);

    private static ApplicationContext ctx = null;

    // 存放项目真实路径
    private static String path = ServerListener.class.getClassLoader().getResource("/").getPath().substring(0, (ServerListener.class.getClassLoader().getResource("/").getPath().length() - 16));

    // 全局缓存系统参数
    public static ConcurrentHashMap<String, TSystemConfig> sysConfigMap = new ConcurrentHashMap<String, TSystemConfig>();

    // 全局缓存业务参数
//    public static ConcurrentHashMap<String, TBusinessConfig> businessConfigMap = new ConcurrentHashMap<String, TBusinessConfig>();

    @Override
    public void contextDestroyed(ServletContextEvent event)
    {
        logger.info("服务器关闭");
    }

    @Override
    public void contextInitialized(ServletContextEvent event)
    {
        logger.info("服务器启动");
        // 获得服务器的真实路径
        setPath(event.getServletContext().getRealPath("/"));
        ctx = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
//        BusinessConfigServiceI businessConfigService = (BusinessConfigServiceI)ctx.getBean("businessConfigService");
//        try
//        {
//            loadBusinessConfig(businessConfigService);
//            logger.info("初始化业务参数列表-成功");
//        }
//        catch (Exception e1)
//        {
//            logger.info("初始化业务参数列表-失败");
//            e1.printStackTrace();
//        }
        logger.info("------------------------------------------------------------------------------------");
        SystemConfigServiceI systemconfigService = (SystemConfigServiceI)ctx.getBean("systemConfigService");
        try
        {
            loadSysConfig(systemconfigService);
            logger.info("初始化系统参数列表-成功");
        }
        catch (Exception e1)
        {
            logger.info("初始化系统参数列表-失败");
            e1.printStackTrace();
        }
        // 清空在线用户表
        OnlineServiceI onlineService = ((OnlineServiceI)ctx.getBean("onlineService"));
        try
        {
            onlineService.deleteOnline();
        }
        catch (Exception e)
        {
            logger.info("清空在线用户表失败");
        }
    }

//    public static void loadBusinessConfig(BusinessConfigServiceI businessConfigService)
//        throws Exception
//    {
//        businessConfigMap.clear();
//        List<TBusinessConfig> listBusinessConfig = businessConfigService.listBusinessConfig();
//        if (listBusinessConfig != null && listBusinessConfig.size() > 0)
//        {
//            for (int i = 0; i < listBusinessConfig.size(); i++ )
//            {
//                TBusinessConfig t = listBusinessConfig.get(i);
//                businessConfigMap.put(t.getConfId(), t);
//                logger.info("业务参数:" + t.getConfId() + "->" + t.getConfName() + "->"
//                            + t.getConfContext());
//            }
//        }
//        else
//        {
//            logger.info("业务参数列表为空");
//        }
//    }

    public static void loadSysConfig(SystemConfigServiceI systemConfigService)
        throws Exception
    {
        sysConfigMap.clear();
        List<TSystemConfig> listconfig = systemConfigService.listSystemConfig();
        if (listconfig != null && listconfig.size() > 0)
        {
            for (int i = 0; i < listconfig.size(); i++ )
            {
                TSystemConfig t = listconfig.get(i);
                sysConfigMap.put(t.getConfId(), t);
                logger.info("系统参数:" + t.getConfId() + "->" + t.getConfName() + "->"
                            + t.getConfContext());
            }
        }
        else
        {
            logger.info("系统参数列表为空");
        }
    }

    @Override
    public void sessionCreated(HttpSessionEvent event)
    {}

    /**
     * add by zhangxiaohui 2014-11-26 16:09:27 删除在线用户信息
     */
    @Override
    public void sessionDestroyed(HttpSessionEvent event)
    {
        HttpSession session = event.getSession();
        if (session != null)
        {
            SessionInfo sessionInfo = (SessionInfo)session.getAttribute(ConfigUtil.getSessionInfoName());
            if (sessionInfo != null)
            {
                session.invalidate();
                try
                {
                    OnlineServiceI onlineService = (OnlineServiceI)ctx.getBean("onlineService");
                    onlineService.deleteTonlineByLoginName(sessionInfo.getName());
                }
                catch (Exception e)
                {
                    logger.info("删除在线用户失败");
                }
            }
        }
    }

    /**
     * add by zhangxiaohui 2014-11-26 15:30:25 添加在线用户信息
     */
    @Override
    public void attributeAdded(HttpSessionBindingEvent event)
    {
        String name = event.getName();
        if (ConfigUtil.getSessionInfoName().equals(name))
        {
            HttpSession session = event.getSession();
            SessionInfo sessionInfo = (SessionInfo)session.getAttribute(name);
            OnlineServiceI onlineService = (OnlineServiceI)ctx.getBean("onlineService");
            try
            {
                onlineService.saveOrUpdateTonlineByLoginNameAndIp(sessionInfo.getName(),
                    sessionInfo.getIp());
            }
            catch (Exception e)
            {
                logger.info("添加在线用户失败");
            }
            // 记录登录时间
            OnlineJob.getOperateMap().put(sessionInfo.getName(), new Date());
        }
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event)
    {}

    @Override
    public void attributeReplaced(HttpSessionBindingEvent arg0)
    {}

    public static String getPath()
    {
        return path;
    }

    public static void setPath(String path)
    {
        ServerListener.path = path;
    }
}
