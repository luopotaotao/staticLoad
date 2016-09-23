package tt.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import tt.listener.ServerListener;
import tt.pageModel.DataGrid;
import tt.pageModel.Json;
import tt.pageModel.SystemConfig;
import tt.service.SystemConfigServiceI;
import tt.util.Constant;
import tt.util.annotation.ValidatorAnnotationBean;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 业务参数信息配置管理
 * 
 * @author liyunxia
 * @version 2015-12-28
 * @see SystemConfigController
 * @since
 */
@Controller
@RequestMapping(value = "/systemConfigController")
public class SystemConfigController extends BaseController
{
    private static final Logger logger = Logger.getLogger(SystemConfigController.class);

    @Autowired
    private SystemConfigServiceI systemConfigService;

    /**
     * 业务参数信息配置管理页面
     * 
     * @return
     */
    @RequestMapping(value = "/manager")
    public String manager()
    {
        getSessionInfo().getResourceList().add("/systemConfigController/datagrid.action");
        getSessionInfo().getResourceMap().put("/systemConfigController/datagrid.action",
            "业务参数管理列表");
        return "/admin/systemConfig/systemConfig";
    }

    /**
     * 业务参数信息配置列表
     * 
     * @param s
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/datagrid", method = RequestMethod.POST)
    @ResponseBody
    public DataGrid datagrid(SystemConfig s)
        throws Exception
    {
        DataGrid dg = new DataGrid();
        List<String> validatorList = new ArrayList<String>();
        validatorList.add("page");
        validatorList.add("rows");
        validatorList.add("order");
        if (ValidatorAnnotationBean.validatorBeanParams(s, validatorList))
        {
            dg = systemConfigService.datagrid(s);
        }
        return dg;
    }

    /**
     * 业务参数信息配置添加页面
     * 
     * @return
     */
    @RequestMapping(value = "/addPage")
    public String addPage()
    {
        getSessionInfo().getResourceList().add("/systemConfigController/add.action");
        getSessionInfo().getResourceMap().put("/systemConfigController/add.action", "业务参数信息配置添加功能");
        return "admin/systemConfig/systemConfigAdd";
    }

    /**
     * 业务参数信息配置添加功能
     * 
     * @param s
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Json add(SystemConfig s)
        throws Exception
    {
        Json j = new Json();
        s.setAdminName(this.getSessionInfo().getName());
        List<String> validatorList = new ArrayList<String>();
        validatorList.add("confId");
        validatorList.add("confName");
        validatorList.add("confContext");
        validatorList.add("confDesc");
        if (ValidatorAnnotationBean.validatorBeanParams(s, validatorList))
        {
            j = systemConfigService.add(s);
        }
        else
        {
            j.setSuccess(false);
            j.setMsg(Constant.ADD_FAIL_CHECK);
            logger.info("添加业务参数失败(属性校验失败)！");
        }
        if (j.isSuccess())
        {
            // 更新缓存
            ServerListener.loadSysConfig(systemConfigService);
        }

        return j;
    }

    /**
     * 业务参数信息配置修改页面
     * 
     * @param id
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/editPage")
    public String editPage(String id, HttpServletRequest request)
        throws Exception
    {
        SystemConfig s = systemConfigService.getSystemConfig(id);
        if (s == null)
        {
            return "/error/noInfo";
        }
        getSessionInfo().getResourceList().add("/systemConfigController/edit.action");
        getSessionInfo().getResourceMap().put("/systemConfigController/edit.action",
            "业务参数信息配置修改功能");
        request.setAttribute("s", s);
        return "admin/systemConfig/systemConfigEdit";
    }

    /**
     * 业务参数信息配置修改功能
     * 
     * @param s
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Json edit(SystemConfig s)
        throws Exception
    {
        Json j = new Json();
        s.setAdminName(this.getSessionInfo().getName());
        List<String> validatorList = new ArrayList<String>();
        validatorList.add("confId");
        validatorList.add("confContext");
        validatorList.add("dataVerFalg");
        if (ValidatorAnnotationBean.validatorBeanParams(s, validatorList))
        {
            SystemConfig systemConfig = systemConfigService.getSystemConfig(s.getConfId());
            if (systemConfig == null)
            {
                j.setMsg(Constant.NO_MESSAGE);
                j.setSuccess(false);
                logger.info("业务参数信息不存在!");
                return j;
            }
            if (s.getDataVerFalg() != systemConfig.getDataVerFalg())
            {
                j.setMsg(Constant.IS_MODIFIED);
                j.setSuccess(false);
                logger.info("业务参数【" + s.getConfId() + "】已被他人修改，请刷新页面重新修改!");
                return j;
            }

            if (s.getConfId().equals("TO_ADDRESS"))
            {
                String str[] = s.getConfContext().split(",");
                for (String a : str)
                {
                    if (!Pattern.matches("^(?:\\w+\\.?)*\\w+@(?:\\w+\\.)*\\w+$", a))
                    {
                        j.setSuccess(false);
                        j.setMsg("修改失败，参数内容不正确!");
                        logger.info("修改系统参数【" + s.getConfId() + "】失败，邮箱格式不正确！");
                        return j;
                    }
                }
            }
            else if (s.getConfId().equals("MAIL_NOTIFICATION"))
            {
                if (s.getConfContext() != null && !s.getConfContext().equals("0")
                    && !s.getConfContext().equals("1"))
                {
                    j.setSuccess(false);
                    j.setMsg("修改失败，参数内容不正确!");
                    logger.info("修改系统参数【" + s.getConfId() + "】失败，参数内容期望值:0,1");
                    return j;
                }
            }
            else if (s.getConfId().equals("REMAINING_LOGINS"))
            {
                if (!Pattern.matches("^[0-9]*", s.getConfContext()))
                {
                    j.setSuccess(false);
                    j.setMsg("修改失败，参数内容不正确!");
                    logger.info("修改系统参数【" + s.getConfId() + "】失败，参数内容只能为数字(最大为5)！");
                    return j;
                }
                if (Integer.valueOf(s.getConfContext()) > 5)
                {
                    j.setSuccess(false);
                    j.setMsg("修改失败，参数内容不正确!");
                    logger.info("修改系统参数【" + s.getConfId() + "】失败，参数内容只能为数字(最大为5)！");
                    return j;
                }
            }
            else if (s.getConfId().equals("OPERATE_TIMEOUT"))
            {
                if (!Pattern.matches("^[0-9]*", s.getConfContext()))
                {
                    j.setSuccess(false);
                    j.setMsg("修改失败，参数内容不正确!");
                    logger.info("修改系统参数【" + s.getConfId() + "】失败，参数内容只能为数字(最大为180)！");
                    return j;
                }

                if (Integer.valueOf(s.getConfContext()) > 180)
                {
                    j.setSuccess(false);
                    j.setMsg("修改失败，参数内容不正确!");
                    logger.info("修改系统参数【" + s.getConfId() + "】失败，参数内容只能为数字(最大为180)！");
                    return j;
                }
            }

            j = systemConfigService.edit(s);
        }
        else
        {
            j.setSuccess(false);
            j.setMsg(Constant.EDIT_FAIL_CHECK);
            logger.info("修改业务参数失败(属性校验失败)！");
        }
        if (j.isSuccess())
        {
            // 更新缓存
            ServerListener.loadSysConfig(systemConfigService);
        }
        return j;
    }

    /**
     * 业务参数信息配置删除功能
     * 
     * @param ids
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Json delete(String ids)
        throws Exception
    {
        Json j = new Json();
        j = systemConfigService.delete(ids);
        if (j.isSuccess())
        {
            // 更新缓存
            ServerListener.loadSysConfig(systemConfigService);
        }
        return j;
    }
}
