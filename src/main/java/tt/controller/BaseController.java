package tt.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import tt.model.business.BaseModel;
import tt.model.business.Dept;
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
//    @RequestMapping("/{folder}/{jspName}")
//    public String redirectJsp(@PathVariable String folder, @PathVariable String jspName)
//    {
//        return "/" + folder + "/" + jspName;
//    }



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
     * 获取所属单位
     * @return
     */
    public Dept getDept(){
        return getSessionInfo().getDept();
    }

    public Integer getDeptId(){
        return getDept().getId();
    }

    public Dept getOriginDept(){
        return getSessionInfo().getOriginDept();
    }
    public void setDeptId(BaseModel instance){
        instance.setDept_id(getDeptId());
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
        ret.put("rows",list==null?new LinkedList<>():list);
        return ret;
    }
    /**
     * 列表响应
     * @param list 当前页数据
     * @return
     */
    protected JSONObject listResponse(List list){
        JSONObject ret = new JSONObject();
        ret.put("total",list!=null?list.size():0);
        ret.put("rows",list);
        return ret;
    }

    protected Map<String,Object> createHashMap(String name,Object val){
        Map<String,Object> ret = new HashMap<>();
        ret.put(name,val);
        return ret;
    }

    protected String decodeStr(String str){
        String ret = null;
        try {
            ret = URLDecoder.decode(str,"utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return ret;
    }
}
