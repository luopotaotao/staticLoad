package tt.interceptors;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tt.util.LoadConfigFile;

import org.apache.log4j.Logger;


/** CSRF 跨站点请求伪造 过滤器 */
public class CSRFFilter implements Filter
{

    private static final Logger logger = Logger.getLogger(CSRFFilter.class);

    /** 初始化方法 */
    public void init(FilterConfig filterConfig)
        throws ServletException
    {

    }

    /** 过滤处理方法 */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
        throws IOException, ServletException
    {

        // 跨帧脚本编制防御
        ((HttpServletResponse)response).addHeader("x-frame-options", "SAMEORIGIN");
        // cookies中增加Secure 属性
        ((HttpServletResponse)response).addHeader("Set-Cookie", "Secure");
        // HTTP头设置 Referer过滤
        HttpServletRequest req = (HttpServletRequest)request;
        String referer = req.getHeader("referer"); // REFRESH
        String host = req.getHeader("host"); // HOST
        LoadConfigFile loadconfigfile = LoadConfigFile.getInstance();
        boolean b = false;
        boolean bb = false;
        String[] hosts = loadconfigfile.getValue("referer").split(";");
        for (int i = 0; i < hosts.length; i++ )
        {
            b = (host != null && host.indexOf(hosts[i]) >= 0);
            if (b)
            {
                break;
            }
        }
        for (int i = 0; i < hosts.length; i++ )
        {
            bb = referer != null && referer.indexOf(hosts[i]) >= 0;
            if (bb)
            {
                break;
            }
        }
        if (host != null && !b)
        {
            logger.info("host为" + host);
            req.getRequestDispatcher("/WEB-INF/error/csrferror.jsp").forward(request, response);
            return;
        }
        if (referer != null && !bb)
        {
            logger.info("受到来自[" + referer + "]的CSRF攻击");
            req.getRequestDispatcher("/WEB-INF/error/csrferror.jsp").forward(request, response);
            return;
        }
        // token验证
        // ((HttpServletRequest)request).getSession().setAttribute("token",
        // UUID.randomUUID().toString());
        // 将处理权转交给下一个处理器
        chain.doFilter(request, response);
    }

    /** 销毁方法 */
    public void destroy()
    {}

}