package tt.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tt.pageModel.Json;
import tt.pageModel.Resource;
import tt.pageModel.SessionInfo;
import tt.pageModel.Tree;
import tt.service.ResourceServiceI;
import tt.service.ResourceTypeServiceI;
import tt.util.ConfigUtil;
import tt.util.annotation.ValidatorAnnotationBean;


/**
 * 资源控制器
 * 
 * @author
 */
@Controller
@RequestMapping("/resourceController")
public class ResourceController extends BaseController
{
    private static final Logger logger = Logger.getLogger(ResourceController.class);

    @Autowired
    private ResourceServiceI resourceService;

    @Autowired
    private ResourceTypeServiceI resourceTypeService;

    /**
     * 获得资源树(资源类型为菜单类型) 通过用户ID判断，他能看到的资源
     * 
     * @param session
     * @return
     */
    @RequestMapping("/tree")
    @ResponseBody
    public List<Tree> tree(HttpSession session)
        throws Exception
    {
        SessionInfo sessionInfo = (SessionInfo)session.getAttribute(
            ConfigUtil.getSessionInfoName());
        return resourceService.tree(sessionInfo);
    }

    /**
     * 获得资源树(包括所有资源类型) 通过用户ID判断，他能看到的资源
     * 
     * @param session
     * @return
     */
    @RequestMapping("/allTree")
    @ResponseBody
    public List<Tree> allTree(HttpSession session)
        throws Exception
    {
        // SessionInfo sessionInfo = (SessionInfo)
        // session.getAttribute(ConfigUtil
        // .getSessionInfoName());
        return resourceService.allTree(null);
    }

    /**
     * 跳转到资源管理页面
     * 
     * @return
     */
    @RequestMapping("/manager")
    public String manager()
    {
        this.getSessionInfo().getResourceList().add("/resourceController/treeGrid.action");
        this.getSessionInfo().getResourceMap().put("/resourceController/treeGrid.action", "资源表格");
        return "/admin/resource/resource";
    }

    /**
     * 跳转到资源添加页面
     * 
     * @return
     */
    @RequestMapping("/addPage")
    public String addPage(HttpServletRequest request)
        throws Exception
    {
        request.setAttribute("resourceTypeList", resourceTypeService.getResourceTypeList());
        Resource r = new Resource();
        r.setId(UUID.randomUUID().toString());
        this.getSessionInfo().getResourceList().add("/resourceController/add.action");
        this.getSessionInfo().getResourceMap().put("/resourceController/add.action", "资源添加功能");
        request.setAttribute("resource", r);
        return "/admin/resource/resourceAdd";
    }

    /**
     * 添加资源
     * 
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Json add(Resource resource, HttpSession session)
        throws Exception
    {
        SessionInfo sessionInfo = (SessionInfo)session.getAttribute(
            ConfigUtil.getSessionInfoName());
        Json j = new Json();
        List<String> validateList = new ArrayList<String>();
        validateList.add("id");
        validateList.add("typeId");
        validateList.add("pid");
        validateList.add("name");
        validateList.add("remark");
        validateList.add("seq");
        validateList.add("url");
        validateList.add("iconCls");
        if (ValidatorAnnotationBean.validatorBeanParams(resource, validateList))
        {
            resourceService.add(resource, sessionInfo);
            j.setSuccess(true);
            j.setMsg("添加成功！");
            logger.info("添加资源【" + resource.getName() + "】成功！");
        }
        else
        {
            j.setSuccess(false);
            j.setMsg("添加失败(属性校验失败)！");
            logger.info("添加资源失败:属性校验失败!");
        }
        return j;
    }

    /**
     * 跳转到资源修改页面
     * 
     * @return
     */
    @RequestMapping(value = "/editPage", method = RequestMethod.POST)
    public String editPage(HttpServletRequest request, String id)
        throws Exception
    {
        request.setAttribute("resourceTypeList", resourceTypeService.getResourceTypeList());
        Resource r = resourceService.get(id);
        if (r == null)
        {
            return "/error/noInfo";
        }
        this.getSessionInfo().getResourceList().add("/resourceController/edit.action");
        this.getSessionInfo().getResourceMap().put("/resourceController/edit.action", "资源修改功能");
        request.setAttribute("resource", r);
        return "/admin/resource/resourceEdit";
    }

    /**
     * 修改资源
     * 
     * @param resource
     * @return
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Json edit(Resource resource)
        throws Exception
    {
        Json j = new Json();
        List<String> validateList = new ArrayList<String>();
        validateList.add("id");
        validateList.add("typeId");
        validateList.add("pid");
        validateList.add("name");
        validateList.add("remark");
        validateList.add("seq");
        validateList.add("url");
        validateList.add("iconCls");
        if (ValidatorAnnotationBean.validatorBeanParams(resource, validateList))
        {
            Resource r = resourceService.get(resource.getId());
            if (r == null)
            {
                j.setSuccess(false);
                j.setMsg("修改失败，该资源信息不存在！");
                logger.info("修改失败，改资源信息【" + resource.getName() + "】不存在！");
            }
            else
            {
                resourceService.edit(resource);
                j.setSuccess(true);
                j.setMsg("修改成功！");
                logger.info("修改资源【" + resource.getName() + "】成功！");
            }
        }
        else
        {
            j.setSuccess(false);
            j.setMsg("修改失败(属性校验失败)！");
            logger.error("修改资源:" + resource.getName() + "【" + resource.getId() + "】失败(属性校验失败)！");
        }

        return j;
    }

    /**
     * 获得资源列表 通过用户ID判断，他能看到的资源
     * 
     * @return
     */
    @RequestMapping("/treeGrid")
    @ResponseBody
    public List<Resource> treeGrid(HttpSession session)
        throws Exception
    {
        SessionInfo sessionInfo = (SessionInfo)session.getAttribute(
            ConfigUtil.getSessionInfoName());
        return resourceService.treeGrid(sessionInfo);
    }

    /**
     * 删除资源
     * 
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Json delete(String id)
        throws Exception
    {
        Json j = new Json();
        resourceService.delete(id);
        j.setMsg("删除成功！");
        j.setSuccess(true);
        return j;
    }

}
