package tt.interceptors;


import java.lang.reflect.Method;
import java.util.*;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.log4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import tt.pageModel.SessionInfo;
import tt.pageModel.Userlog;
import tt.service.UserlogServiceI;
import tt.timingTask.OnlineJob;
import tt.util.ConfigUtil;
import tt.util.LoadConfigFile;


/**
 * 权限拦截器
 *
 * @author
 */
public class SecurityInterceptor implements HandlerInterceptor {

    private static final Logger logger = Logger.getLogger(SecurityInterceptor.class);

    private List<String> securityexcludeUrls;// 不需要拦截的资源

    private List<String> sessionexcludeUrls;// 不需要拦截的资源

    @Autowired
    private UserlogServiceI userlogService; // 记录日志

    public List<String> getSecurityexcludeUrls() {
        return securityexcludeUrls;
    }

    public void setSecurityexcludeUrls(List<String> securityexcludeUrls) {
        this.securityexcludeUrls = securityexcludeUrls;
    }

    public List<String> getSessionexcludeUrls() {
        return sessionexcludeUrls;
    }

    public void setSessionexcludeUrls(List<String> sessionexcludeUrls) {
        this.sessionexcludeUrls = sessionexcludeUrls;
    }

    /**
     * 完成页面的render后调用
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
                                Object object, Exception exception)
            throws Exception {

    }

    /**
     * 在调用controller具体方法后拦截
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object object, ModelAndView modelAndView)
            throws Exception {
        String requestUri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String url = requestUri.substring(contextPath.length());
        if (!url.startsWith("/monitorController/monitoronline")
                && !url.startsWith("/userController/logout")) {
            SessionInfo sessionInfo = null;
            try {
                sessionInfo = (SessionInfo) request.getSession().getAttribute(
                        ConfigUtil.getSessionInfoName());
            } catch (IllegalStateException e) {
                // 此处会报【Cannot create a session after the response has been committed】异常，并不影响，不做处理
                return;
            }

            if (sessionInfo != null && sessionInfo.getName() != null
                    && !sessionInfo.getName().equals("")) {
                if (url.indexOf("/baseController/") > -1 || securityexcludeUrls.contains(url)) {// 如果要访问的资源是不需要验证的
                } else {
                    logger.info("结束[" + sessionInfo.getResourceMap().get(url) + "]功能");
                    logger.info("耗时：" + (new Date().getTime() - sessionInfo.getAction_time())
                            + "毫秒");
                }
            }
        }
        MDC.remove("username");
    }

    /**
     * 在调用controller具体方法前拦截
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object object)
            throws Exception {

        // HTTP头设置 Referer过滤
        String referer = request.getHeader("referer"); // REFRESH
        // 跨帧脚本编制防御
        response.addHeader("x-frame-options", "SAMEORIGIN");
        String host = request.getHeader("host"); // HOST
        LoadConfigFile loadconfigfile = LoadConfigFile.getInstance();
        boolean b = false;
        boolean bb = false;
        String[] hosts = loadconfigfile.getValue("referer").split(";");
        for (int i = 0; i < hosts.length; i++) {
            b = host != null && host.indexOf(hosts[i]) >= 0;
            if (b) {
                break;
            }
        }
        for (int i = 0; i < hosts.length; i++) {
            bb = referer != null && referer.indexOf(hosts[i]) >= 0;
            if (bb) {
                break;
            }
        }
        if (host != null && !b) {
            logger.info("host为" + host);
            request.getRequestDispatcher("/WEB-INF/error/csrferror.jsp").forward(request, response);
            return false;
        }
        if (referer != null && !bb) {
            logger.info("受到来自[" + referer + "]的CSRF攻击");
            request.getRequestDispatcher("/WEB-INF/error/csrferror.jsp").forward(request, response);
            return false;
        }

        String requestUri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String url = requestUri.substring(contextPath.length());

        if (sessionexcludeUrls.contains(url)) {
            return true;
        } else {
            SessionInfo sessionInfo = (SessionInfo) request.getSession().getAttribute(
                    ConfigUtil.getSessionInfoName());
            if (sessionInfo != null && sessionInfo.getName() != null
                    && !sessionInfo.getName().equals("")) {
                MDC.put("username", sessionInfo.getName());
                if (url.indexOf("/baseController/") > -1 || securityexcludeUrls.contains(url)) {// 如果要访问的资源是不需要验证的
                    return true;
                }

//                for(Pattern regex:sessionInfo.getResourceSet()){
//                    if(regex.matcher(url).matches()){
//                        break;
//                    }
//                }
                Object[] stream = sessionInfo.getResourceSet().stream().filter(regex -> regex.matcher(url).matches()).toArray();

                if (false)//(stream==null||stream.length<1)
                {// 如果当前用户没有访问此资源的权限
                    request.setAttribute("msg", "您没有访问此资源的权限！<br/>请联系超管赋予您<br/>[" + url
                            + "]<br/>的资源访问权限！");
                    request.getRequestDispatcher("/WEB-INF/error/noSecurity.jsp").forward(request,
                            response);
                    return false;
                }
                try {
                    String resource = ((Pattern) stream[0]).pattern();
                    logger.info("开始[" + sessionInfo.getResourceMap().get(resource) + "]功能");
                    sessionInfo.setAction_time(new Date().getTime());

                    // add by zhangxiaohui 2014-11-26 09:35:55记录用户操作时间
                    String name = sessionInfo.getName();
                    OnlineJob.getOperateMap().put(name, new Date());

                    Map<String, String[]> map = request.getParameterMap();
                    StringBuffer sb = new StringBuffer();
                    int formlength = request.getContentLength();
                    sb.append("长度:" + (formlength == -1 ? "0" : formlength) + " ");
                    for (Map.Entry<String, String[]> entry : map.entrySet()) {
                        String[] temps = entry.getValue();
                        String temp = "";
                        for (int i = 0; i < temps.length; i++) {
                            temp += temps[i];
                        }
                        sb.append(entry.getKey() + ":" + temp + ",");
                    }
                    // add by kiky 2014-11-21 14:04:06 记录登录日志

                    Userlog userlog = new Userlog();
                    userlog.setUserLogId(UUID.randomUUID().toString());
                    userlog.setUserIp(sessionInfo.getIp());
                    userlog.setAdminName(sessionInfo.getName());
                    userlog.setText(sessionInfo.getResourceMap().get(resource));
                    userlog.setUrl(url);
                    userlog.setCreateTime(new Date());
                    userlog.setFormContentStr(sb.toString());

                    userlogService.add(userlog);
                } catch (Exception e) {

                }


            } else {
                RequestMapping requestMappingobject = object.getClass().getAnnotation(
                        RequestMapping.class);
                String objectUrl = requestMappingobject.value()[0];
                boolean is404 = false;
                for (Method m : object.getClass().getMethods()) {

                    RequestMapping requestmappingmethod = m.getAnnotation(RequestMapping.class);
                    if (requestmappingmethod != null) {
                        if (url.equals(objectUrl + requestmappingmethod.value()[0])) {
                            is404 = true;
                            break;
                        } else {
                            url.startsWith("/baseController/layout/");
                            is404 = true;
                            break;
                        }
                    }
                }
                if (!is404) {
                    response.sendError(404);
                    return false;
                }
                request.setAttribute("msg", "您还没有登录或登录已超时，请重新登录，然后再刷新本功能！");
                request.getRequestDispatcher("/WEB-INF/error/noSession.jsp").forward(request,
                        response);
                return false;
            }
        }
        return true;
    }

}
