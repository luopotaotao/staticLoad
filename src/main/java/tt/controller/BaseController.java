package tt.controller;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import tt.pageModel.SessionInfo;
import tt.util.ConfigUtil;
import tt.util.StringDateToDateEditor;
import tt.util.StringEscapeEditor;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 〈一句话功能简述〉 〈功能详细描述〉
 * 
 * @author zhangziqi
 * @version 2015年12月25日
 * @see BaseController
 * @since
 */
@Controller
@RequestMapping("/baseController")
public class BaseController<T>
{
    private static final Logger logger = Logger.getLogger(BaseController.class);

    @InitBinder
    public void initBinder(ServletRequestDataBinder binder)
    {
        /**
         * 自动转换日期类型的字段格式
         */
        binder.registerCustomEditor(Date.class, new StringDateToDateEditor());
        /**
         * 防止XSS攻击
         */
        binder.registerCustomEditor(String.class, new StringEscapeEditor(true, false));
    }

    /**
     * 用户跳转JSP页面 此方法不考虑权限控制
     * 
     * @param folder
     *            路径
     * @param jspName
     *            JSP名称(不加后缀)
     * @return 指定JSP页面
     */
    @RequestMapping("/{folder}/{jspName}")
    public String redirectJsp(@PathVariable String folder, @PathVariable String jspName)
    {
        return "/" + folder + "/" + jspName;
    }

    @ExceptionHandler
    /**
     * 统一的异常处理
     * 
     * @param request
     * @param ex
     * @return
     */
    public String exp(HttpServletRequest request, Exception ex)
    {
        // 遍历所有异常信息
        String requestUri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String url = requestUri.substring(contextPath.length());
        StringBuffer sb = new StringBuffer();
        for (int k = 0; k < ex.toString().length() + 10; k++ )
        {
            sb.append("*");
        }
        logger.error(sb.toString());
        logger.error("*");
        logger.error("*     执行[" + url + "]请求发生异常");
        logger.error("*     异常信息：" + ex.toString());
        logger.error("*     相关位置:");
        for (int i = 0; i < ex.getStackTrace().length; i++ )
        {
            StackTraceElement stackTraceElement = ex.getStackTrace()[i];// 得到异常棧的元素
            // 查看类文件，如果包名是laser开头的（laser可以自己定义）
            if (stackTraceElement.getClassName().startsWith("tt"))
            {

                logger.error("*             " + stackTraceElement.toString());
            }
        }
        logger.error("*");
        logger.error(sb.toString());
        logger.error("");
        request.setAttribute("ex", ex);
        return "/error/error";
    }

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpSession session;

    /**
     * 获取当前的sessionInfo信息 登录用户名 、ip等信息
     * 
     * @return
     */
    public SessionInfo getSessionInfo()
    {
        return (SessionInfo)session.getAttribute(ConfigUtil.getSessionInfoName());
    }

    /**
     * 获得当前项目的绝对路径
     * 
     * @return
     */
    public String getTruePath()
    {
        String requestUri = request.getSession().getServletContext().getRealPath("/");
        return requestUri;
    }

    /**
     * 获取项目的请求地址(只到项目名) 例：http://127.0.0.1:8080/laser_base_frame/
     * 
     * @return
     */
    public String getRequestPath()
    {
        String path = request.getContextPath();
        String requestpath = request.getScheme() + "://" + request.getServerName() + ":"
                             + request.getServerPort() + path + "/";
        return requestpath;
    }

    protected JSONObject jsonResponse(String key,Object val){
        JSONObject ret = new JSONObject();
        ret.put(key,val);
        return ret;
    }

    /**
     * Flag响应
     * @param flag
     * @return
     */
    protected JSONObject flagResponse(Object flag){
        return jsonResponse("flag",flag);
    }

    /**
     * 分页列表响应
     * @param count 数据总数
     * @param list 当前页数据
     * @return
     */
    protected JSONObject listResponse(long count, List<T> list){
        JSONObject ret = new JSONObject();
        ret.put("total",count);
        ret.put("rows",list);
        return ret;
    }
    /**
     * 列表响应
     * @param list 当前页数据
     * @return
     */
    protected JSONObject listResponse(List list){
        JSONObject ret = new JSONObject();
        ret.put("total",list.size());
        ret.put("rows",list);
        return ret;
    }

}
