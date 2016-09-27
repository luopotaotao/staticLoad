package tt.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tt.pageModel.Json;
import tt.pageModel.Role;
import tt.pageModel.SessionInfo;
import tt.pageModel.Tree;
import tt.service.RoleServiceI;
import tt.util.ConfigUtil;
import tt.util.annotation.ValidatorAnnotationBean;


/**
 * 角色控制器
 *
 * @author
 */
@Controller
@RequestMapping("/roleController")
public class RoleController extends BaseController {
    private static final Logger logger = Logger.getLogger(RoleController.class);

    @Autowired
    private RoleServiceI roleService;

    /**
     * 跳转到角色管理页面
     *
     * @return
     */
    @RequestMapping("/manager")
    public String manager() {
        String url = "/roleController/treeGrid.action";
        Pattern regex = Pattern.compile(url);
        this.getSessionInfo().getResourceList().add(regex);
        this.getSessionInfo().getResourceMap().put(url, "角色表格");
        return "/admin/role/role";
    }

    /**
     * 跳转到角色添加页面
     *
     * @return
     */
    @RequestMapping("/addPage")
    public String addPage(HttpServletRequest request) {
        Role r = new Role();
        r.setId(UUID.randomUUID().toString());
        String url = "/roleController/add.action";
        Pattern regex = Pattern.compile(url);

        this.getSessionInfo().getResourceList().add(regex);
        this.getSessionInfo().getResourceMap().put(url, "角色添加功能");
        request.setAttribute("role", r);
        return "/admin/role/roleAdd";
    }

    /**
     * 添加角色
     *
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Json add(Role role, HttpSession session)
            throws Exception {
        SessionInfo sessionInfo = (SessionInfo) session.getAttribute(
                ConfigUtil.getSessionInfoName());
        Json j = new Json();
        List<String> validateList = new ArrayList<String>();
        validateList.add("id");
        validateList.add("name");
        validateList.add("remark");
        if (ValidatorAnnotationBean.validatorBeanParams(role, validateList)) {
            j = roleService.add(role, sessionInfo);
            logger.info("添加角色" + role.getName() + "成功！");
        } else {
            j.setSuccess(false);
            j.setMsg("添加失败(属性校验失败)！");
            logger.info("添加角色失败：(属性校验失败)！");
        }
        return j;
    }

    /**
     * 跳转到角色修改页面
     *
     * @return
     */
    @RequestMapping(value = "/editPage", method = RequestMethod.POST)
    public String editPage(HttpServletRequest request, String id)
            throws Exception {
        Role r = roleService.get(id);
        if (r == null) {
            logger.info("该角色信息不存在，请刷新页面！");
            return "/error/noInfo";
        } else {
            String url = "/roleController/edit.action";
            Pattern regex = Pattern.compile(url);

            this.getSessionInfo().getResourceList().add(regex);
            this.getSessionInfo().getResourceMap().put(url, "角色编辑功能");
            request.setAttribute("role", r);
            return "/admin/role/roleEdit";
        }

    }

    /**
     * 修改角色
     *
     * @param role
     * @return
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Json edit(Role role)
            throws Exception {
        Json j = new Json();
        List<String> validateList = new ArrayList<String>();
        validateList.add("name");
        validateList.add("remark");
        if (ValidatorAnnotationBean.validatorBeanParams(role, validateList)) {
            Role r = roleService.get(role.getId());
            if (r == null) {
                j.setSuccess(false);
                j.setMsg("修改失败，该角色信息不存在，请刷新页面！");
                logger.info("该角色信息【" + role.getName() + "】不存在，请刷新页面！");
            } else {
                j = roleService.edit(role);
            }
        } else {
            j.setSuccess(false);
            j.setMsg("修改失败(属性校验失败)！");
            logger.error("修改角色:" + role.getName() + "【" + role.getId() + "】失败(属性校验失败)！");
        }

        return j;
    }

    /**
     * 获得角色列表
     *
     * @return
     */
    @RequestMapping(value = "/treeGrid", method = RequestMethod.POST)
    @ResponseBody
    public List<Role> treeGrid(HttpSession session)
            throws Exception {
        SessionInfo sessionInfo = (SessionInfo) session.getAttribute(
                ConfigUtil.getSessionInfoName());
        return roleService.treeGrid(sessionInfo);
    }

    /**
     * 角色树(只能看到自己拥有的角色)
     *
     * @return
     */
    @RequestMapping(value = "/tree", method = RequestMethod.POST)
    @ResponseBody
    public List<Tree> tree(HttpSession session)
            throws Exception {
        SessionInfo sessionInfo = (SessionInfo) session.getAttribute(
                ConfigUtil.getSessionInfoName());
        return roleService.tree(sessionInfo);
    }

    /**
     * 角色树
     *
     * @return
     */
    @RequestMapping("/allTree")
    @ResponseBody
    public List<Tree> allTree()
            throws Exception {
        return roleService.allTree();
    }

    /**
     * 授权角色树(不包含超级管理员角色)
     *
     * @return
     */
    @RequestMapping("/grantRoleTree")
    @ResponseBody
    public List<Tree> grantTree()
            throws Exception {
        return roleService.grantRoleTree();
    }

    /**
     * 删除角色
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Json delete(String id)
            throws Exception {
        Json j = new Json();
        roleService.delete(id);
        j.setMsg("删除成功！");
        j.setSuccess(true);
        return j;
    }

    /**
     * 跳转到角色授权页面
     *
     * @return
     */
    @RequestMapping(value = "/grantPage", method = RequestMethod.POST)
    public String grantPage(HttpServletRequest request, String id)
            throws Exception {
        Role r = roleService.get(id);
        if (r == null) {
            logger.error("该角色信息不存在，请刷新页面！");
            return "/error/noInfo";
        } else {
            String allTreeUrl = "/resourceController/allTree.action";
            String grantUrl = "grant";
            Pattern allTreeRegex = Pattern.compile(allTreeUrl);
            Pattern grantRegex = Pattern.compile(grantUrl);

            this.getSessionInfo().getResourceList().add(allTreeRegex);
            this.getSessionInfo().getResourceMap().put(allTreeUrl, "角色授权-资源下拉列表");
            this.getSessionInfo().getResourceList().add(grantRegex);
            this.getSessionInfo().getResourceMap().put(grantUrl, "角色授权功能");
            request.setAttribute("role", r);
            return "/admin/role/roleGrant";
        }
    }

    /**
     * 授权
     *
     * @param role
     * @return
     */
    @RequestMapping(value = "/grant", method = RequestMethod.POST)
    @ResponseBody
    public Json grant(Role role)
            throws Exception {
        Json j = new Json();
        Role r = roleService.get(role.getId());
        if (r == null) {
            j.setMsg("授权失败，该角色信息不存在，请刷新页面！！");
            j.setSuccess(false);
            logger.error("该角色信息不存在，请刷新页面！");
        } else {
            roleService.grant(role);
            j.setMsg("授权成功！");
            j.setSuccess(true);
        }
        return j;
    }

}
