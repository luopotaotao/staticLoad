package tt.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import tt.pageModel.BusinessConfig;
import tt.pageModel.DataGrid;
import tt.pageModel.Json;
import tt.service.BusinessConfigServiceI;
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
 * @see BusinessConfigController
 * @since
 */
@Controller
@RequestMapping(value = "/businessConfigController")
public class BusinessConfigController extends BaseController
{
    private static final Logger logger = Logger.getLogger(BusinessConfigController.class);

    @Autowired
    private BusinessConfigServiceI businessConfigService;

    /**
     * 业务参数信息配置管理页面
     * 
     * @return
     */
    @RequestMapping(value = "/manager")
    public String manager()
    {
        getSessionInfo().getResourceList().add("/businessConfigController/datagrid.action");
        getSessionInfo().getResourceMap().put("/businessConfigController/datagrid.action",
            "业务参数信息列表");
        return "/business/businessConfig/businessConfig";
    }

    /**
     * 业务参数信息配置列表
     * 
     * @param b
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/datagrid", method = RequestMethod.POST)
    @ResponseBody
    public DataGrid datagrid(BusinessConfig b)
        throws Exception
    {
        DataGrid dg = new DataGrid();
        List<String> validatorList = new ArrayList<String>();
        validatorList.add("page");
        validatorList.add("rows");
        validatorList.add("order");
        if (ValidatorAnnotationBean.validatorBeanParams(b, validatorList))
        {
            dg = businessConfigService.datagrid(b);
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
        getSessionInfo().getResourceList().add("/businessConfigController/add.action");
        getSessionInfo().getResourceMap().put("/businessConfigController/add.action", "业务参数信息添加功能");
        return "business/businessConfig/businessConfigAdd";
    }

    /**
     * 业务参数信息配置添加功能
     * 
     * @param b
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Json add(BusinessConfig b)
        throws Exception
    {
        Json j = new Json();
        b.setAdminName(this.getSessionInfo().getName());
        List<String> validatorList = new ArrayList<String>();
        validatorList.add("confId");
        validatorList.add("confName");
        validatorList.add("confContext");
        validatorList.add("confDesc");
        if (ValidatorAnnotationBean.validatorBeanParams(b, validatorList))
        {
            j = businessConfigService.add(b);
        }
        else
        {
            j.setSuccess(false);
            j.setMsg(Constant.ADD_FAIL_CHECK);
            logger.info("添加业务参数失败(属性校验失败)！");
        }
//        if (j.isSuccess())
//        {
//            NoticeAPKP.configUpdateToApkp(Constant.BUSINESSCONFIGUPDATE);
//            NoticeUSDS.confiUpdateToUsds(Constant.CONFIGUPDATEUSDS_7);
//        }

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
        BusinessConfig b = businessConfigService.getBusinessConfig(id);
        if (b == null)
        {
            return "/error/noInfo";
        }
        getSessionInfo().getResourceList().add("/businessConfigController/edit.action");
        getSessionInfo().getResourceMap().put("/businessConfigController/edit.action",
            "业务参数信息修改功能");
        request.setAttribute("b", b);
        return "business/businessConfig/businessConfigEdit";
    }

    /**
     * 业务参数信息配置修改功能
     * 
     * @param b
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Json edit(BusinessConfig b)
        throws Exception
    {
        Json j = new Json();
        b.setAdminName(this.getSessionInfo().getName());
        List<String> validatorList = new ArrayList<String>();
        validatorList.add("confId");
        validatorList.add("confContext");
        validatorList.add("dataVerFalg");
        if (ValidatorAnnotationBean.validatorBeanParams(b, validatorList))
        {
            BusinessConfig businessConfig = businessConfigService.getBusinessConfig(b.getConfId());
            if (businessConfig == null)
            {
                j.setMsg(Constant.NO_MESSAGE);
                j.setSuccess(false);
                logger.info("业务参数信息不存在!");
                return j;
            }
            if (b.getDataVerFalg() != businessConfig.getDataVerFalg())
            {
                j.setMsg(Constant.IS_MODIFIED);
                j.setSuccess(false);
                logger.info("业务参数【" + b.getConfId() + "】已被他人修改，请刷新页面重新修改!");
                return j;
            }
            j = businessConfigService.edit(b);
        }
        else
        {
            j.setSuccess(false);
            j.setMsg(Constant.EDIT_FAIL_CHECK);
            logger.info("修改业务参数失败(属性校验失败)！");
        }
//        if (j.isSuccess())
//        {
//            NoticeAPKP.configUpdateToApkp(Constant.BUSINESSCONFIGUPDATE);
//            NoticeUSDS.confiUpdateToUsds(Constant.CONFIGUPDATEUSDS_7);
//        }
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
        j = businessConfigService.delete(ids);
//        if (j.isSuccess())
//        {
//            NoticeAPKP.configUpdateToApkp(Constant.BUSINESSCONFIGUPDATE);
//            NoticeUSDS.confiUpdateToUsds(Constant.CONFIGUPDATEUSDS_7);
//        }
        return j;
    }
}
