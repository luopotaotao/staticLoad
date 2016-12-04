package tt.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import tt.listener.ServerListener;
import tt.model.TSystemConfig;
import tt.model.business.Dept;
import tt.pageModel.*;
import tt.service.OnlineServiceI;
import tt.service.ResourceServiceI;
import tt.service.UserServiceI;
import tt.service.UserlogServiceI;
import tt.service.bussiness.DeptServiceI;
import tt.timingTask.OnlineJob;
import tt.util.ConfigUtil;
import tt.util.Constant;
import tt.util.IpUtil;
import tt.util.annotation.ValidatorAnnotationBean;
import tt.util.mail.SendMail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;


/**
 * 用户控制器
 *
 * @author
 */
@Controller
@RequestMapping("/userController")
public class SysUserController extends BaseController {
    private static final Logger logger = Logger.getLogger(SysUserController.class);

    @Autowired
    private UserServiceI userService;

    @Autowired
    private ResourceServiceI resourceService;

    @Autowired
    private UserlogServiceI userlogService;

    @Autowired
    private OnlineServiceI onlineService;
    @Autowired
    private DeptServiceI deptService;

    // @Autowired
    // private SysConfigServiceI systemConfigService;
    // @Autowired
    // private PasswordHistoryServiceI passwordHistoryService;

    /**
     * 用户登录
     *
     * @param user    用户对象
     * @param session
     * @param request
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Json login(User user, HttpSession session, HttpServletRequest request,
                      HttpServletResponse response)
            throws Exception {
        Json j = new Json();
        response.setCharacterEncoding("UTF-8");
        // 判断验证码是否存在
        if(session.getAttribute("authCode") != null)
        {
            if (user.getVerifycode().equalsIgnoreCase((String)session.getAttribute("authCode")))
            {
                // 默认登录剩余次数
                short remaining_logins = Constant.REMAINING_LOGINS;
                TSystemConfig config = ServerListener.sysConfigMap.get("REMAINING_LOGINS");
                if (config != null && !config.getConfContext().isEmpty()) {
                    // 查询用户每天的剩余登录次数
                    remaining_logins = Short.parseShort(config.getConfContext());
                }
                User u = userService.login(user);
                if (u != null) {
                    // 判断用户有效期
                    if (null != u.getValiddatetime() && u.getValiddatetime().before(new Date())) {
                        j.setMsg("您的密码超过有效期，请联系管理员");
                        j.setSuccess(false);
                        logger.error("用户【" + user.getName() + "】的密码超过有效期！");
                        return j;
                    }
                    // 除了系统管理员外，检查普通管理员账户是否锁定
                    boolean isAdmin = u.getId().equals("0");
                    if (!isAdmin) {
                        Short lockSymbol = u.getLockSymbol();
                        if (lockSymbol == 1) {
                            j.setMsg("您的账户已锁定，请联系管理员或明天再登录");
                            j.setSuccess(false);
                            logger.error("用户名为【" + user.getName() + "】账户已锁定！");
                            return j;
                        } else {
                            if (remaining_logins != u.getRemainingLogins().shortValue()) {
                                u.setRemainingLogins(remaining_logins);
                                userService.modifyRemainingLongins(u);
                            }
                        }
                    }
                    // add by zhangxiaohui 判断用户是否已经登录
                    boolean flag = onlineService.searchOnlineUser(u.getName());
                    if (!flag) {
                        j.setMsg("该用户已经登录，请您稍后登录或使用其他用户登录");
                        j.setSuccess(false);
                        logger.error("用户名为【" + user.getName() + "】的用户已经登录！");
                        return j;
                    }
                    // ibm appscan 会话标识未更新---------
                    HttpSession session1 = request.getSession(false);
//                    if (session1 != null)
//                    { // 让cookie过期
//                        session1.invalidate();
//                        Cookie cookie = request.getCookies()[0];// 获取cookie
//                        cookie.setMaxAge(0);// 让cookie过期
//                        cookie.setSecure(true);
//                    }
                    session1 = request.getSession(true);// 生成新会话
                    // --------------------------------
                    j.setSuccess(true);
                    j.setMsg("登陆成功！");
                    logger.info("用户名为【" + user.getName() + "】的用户登录成功！");
                    SessionInfo sessionInfo = new SessionInfo();
                    BeanUtils.copyProperties(u, sessionInfo);
                    sessionInfo.setEmail(u.getEmail());
                    sessionInfo.setIp(IpUtil.getIpAddr(request));
                    // modify by kiky 2014-11-24 09:58:56
                    // 根据用户id查询用户资源的全部信息，用于记录日志
//                    List<Tresource> resourceList = userService.resourceList(u.getId());
//                    Set<String> l = new HashSet<String>();
//                    Map<String, String> m = new HashMap<String, String>();
//                    if (resourceList != null && resourceList.size() != 0) {
//                        resourceList.stream().forEach((item) -> {
//                            m.put(item.getUrl(), item.getName());
//                        });
//                    }
//                    sessionInfo.setResourceSet(l);
//                    sessionInfo.setResourceMap(m);
                    session1.setAttribute(ConfigUtil.getSessionInfoName(), sessionInfo);
                    // add by kiky 2014-11-21 14:04:06 记录登录日志
                    Userlog userlog = new Userlog();
                    userlog.setUserLogId(UUID.randomUUID().toString());
                    userlog.setUserIp(sessionInfo.getIp());
                    userlog.setAdminName(user.getName());
                    userlog.setText("用户登录");
                    String requestUri = request.getRequestURI();
                    String contextPath = request.getContextPath();
                    String url = requestUri.substring(contextPath.length());
                    userlog.setUrl(url);
                    userlog.setCreateTime(new Date());
                    userlogService.add(userlog);
                    j.setObj(sessionInfo);
                } else {
                    User user1 = userService.getUserByName(user.getName());
                    if (user1 == null) {
                        j.setMsg("您输入的用户名或密码不正确，请重新输入");
                        j.setSuccess(false);
                        logger.error("输入的用户名【" + user.getName() + "】或密码不正确！");
                        return j;
                    }
                    if (!user1.getId().toString().equals("0")) {
                        Short lockSysmbol = user1.getLockSymbol();
                        if (lockSysmbol == Constant.UNLOCKUSER) {
                            // 假如该用户没有被锁定，更新剩余登录次数-1
                            short remainingLogins = (short) (user1.getRemainingLogins() - 1);
                            user1.setRemainingLogins(remainingLogins);
                            userService.modifyRemainingLongins(user1);
                            // 剩余登录次数为0时，修改锁定标志字段为锁定
                            if (remainingLogins == 0) {
                                user1.setLockSymbol(Constant.LOCKUSER);
                                userService.modifyLockSymbol(user1);
                                j.setMsg("您输入的用户名或密码不正确。您的账户已锁定，请联系管理员或明天再登录");
                                logger.error("输入的用户名【" + user.getName() + "】或密码不正确，您的账户已锁定");
                                config = ServerListener.sysConfigMap.get("MAIL_NOTIFICATION");
                                // 如果邮件通知开启，邮件通知超管
                                if (config != null) {
                                    if (config.getConfContext().equals(
                                            String.valueOf(Constant.MAIL_NOTIFICATION_ON))) {
                                        SendMail sendmail = new SendMail();
                                        sendmail.SendUserLockMail(user1.getName());
                                    }
                                }
                                j.setSuccess(false);
                                return j;
                            } else {
                                j.setMsg("您输入的用户名或密码不正确。密码错误超过系统限制次数，账户将被锁定。今天你还有"
                                        + remainingLogins + "次机会。");
                                j.setSuccess(false);
                                logger.error("输入的用户名【" + user.getName()
                                        + "】或密码不正确，密码错误超过系统限制次数，账户将被锁定。今天你还有"
                                        + remainingLogins + "次机会。");
                                return j;
                            }
                        }
                    }
                    j.setMsg("您输入的用户名或密码不正确，请重新输入。");
                    logger.error("输入的用户名【" + user.getName() + "】或密码不正确。");
                    j.setSuccess(false);
                }
            } else {
                j.setMsg("您输入的验证码不正确，请重新输入。");
                j.setSuccess(false);
                logger.error("您输入的验证码不正确，请重新输入。");
            }
        } else {
            j.setMsg("验证码超时，请重新输入。");
            j.setSuccess(false);
            logger.error("验证码超时，请重新输入。");
        }
        return j;
    }

    @RequestMapping(value = "switchDept/{id}",method = RequestMethod.GET)
    @ResponseBody
    public JSON switchDept(@PathVariable(value = "id") Integer deptId,HttpSession session){
        Dept dept = deptService.get(deptId);
        SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
        if(sessionInfo!=null){
            if(sessionInfo.getOriginDept()==null){
                sessionInfo.setOriginDept(sessionInfo.getDept());
            }
            sessionInfo.setDept(dept);
        }
        JSONObject ret = jsonResponse("flag", true);
        ret.put("logo",dept.getLogo());
        return ret;
    }

    /**
     * 退出登录
     *
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public Json logout(HttpSession session, HttpServletRequest request)
            throws Exception {
        Json j = new Json();
        if (session != null) {
            if (session.getAttribute(ConfigUtil.getSessionInfoName()) != null) {
                // add by kiky 2014-11-21 14:04:06 记录退出日志
                Userlog userlog = new Userlog();
                userlog.setUserLogId(UUID.randomUUID().toString());
                userlog.setUserIp(getSessionInfo().getIp());
                userlog.setAdminName(getSessionInfo().getName());
                userlog.setText("用户正常退出");
                String requestUri = request.getRequestURI();
                String contextPath = request.getContextPath();
                String url = requestUri.substring(contextPath.length());
                userlog.setUrl(url);
                userlog.setCreateTime(new Date());
                userlogService.add(userlog);
                // 清空该用户的最后一次操作时间和最后一次页面访问时间
                OnlineJob.getMap().remove(getSessionInfo().getName());
                OnlineJob.getOperateMap().remove(getSessionInfo().getName());
                session.invalidate();
                logger.info("退出成功");
            }
        }
        j.setSuccess(true);
        j.setMsg("注销成功！");
        return j;
    }

    /**
     * 跳转到用户管理页面
     *
     * @return
     */
    @RequestMapping(value = "/manager")
    public String manager() {
        String url = "/userController/dataGrid";
        getSessionInfo().addToResourceSet(url, "用户表格");
        return "/admin/user/user";
    }

    /**
     * 获取用户数据表格
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/dataGrid")
    @ResponseBody
    public DataGrid dataGrid(User user)
            throws Exception {
        DataGrid dg = new DataGrid();
        List<String> validatorList = new ArrayList<String>();
        validatorList.add("page");
        validatorList.add("rows");
        validatorList.add("order");
        if (ValidatorAnnotationBean.validatorBeanParams(user, validatorList)) {
            dg = userService.dataGrid(user);
        }
        return dg;
    }

    /**
     * 跳转到添加用户页面
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/addPage", method = RequestMethod.POST)
    public String addPage(HttpServletRequest request) {
        String url = "/userController/add";
        getSessionInfo().addToResourceSet(url, "添加用户功能");
        User u = new User();
//        u.setId(UUID.randomUUID().toString());
        request.setAttribute("user", u);
        return "/admin/user/userAdd";
    }

    /**
     * 添加用户
     *
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Json add(User user)
            throws Exception {
        Json j = new Json();
        List<String> validateList = new ArrayList<String>();
        validateList.add("name");
        validateList.add("email");
        if (ValidatorAnnotationBean.validatorBeanParams(user, validateList)) {
            Short REMAINING_LOGINS = Constant.REMAINING_LOGINS;
            // 查询用户每天的剩余登录次数
            TSystemConfig config = ServerListener.sysConfigMap.get("REMAINING_LOGINS");
            if (config != null) {
                REMAINING_LOGINS = Short.parseShort(config.getConfContext());
            }
            user.setRemainingLogins(REMAINING_LOGINS);
            user.setLockSymbol(Constant.UNLOCKUSER);
            // 管理员类型
            j = userService.add(user);
            j.setObj(user);
        } else {
            j.setSuccess(false);
            j.setMsg("添加失败(属性校验失败)！");
            logger.info("添加用户信息失败:(属性校验失败)！");
        }
        return j;
    }

    /**
     * 删除用户
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Json delete(Integer id)
            throws Exception {
        SessionInfo sessionInfo = getSessionInfo();
        Json j = new Json();
        if (id != null && id!=sessionInfo.getId()) {// 不能删除自己
            userService.delete(id);
        }
        j.setMsg("删除成功！");
        j.setSuccess(true);
        return j;
    }

    /*
    *//**
     * 批量删除用户
     *
     * @param ids
     *            ('0','1','2')
     * @return
     */
    /*
     * @RequestMapping(value = "/batchDelete", method = RequestMethod.POST)
     * @ResponseBody public Json batchDelete(String ids) throws Exception { Json j = new Json(); if
     * (ids != null && ids.length() > 0) { for (String id : ids.split(",")) { if (id != null) {
     * this.delete(id); } } } j.setMsg("批量删除成功！"); j.setSuccess(true); return j; }
     *//**
     * 跳转到用户授权页面
     *
     * @return
     */
    /*
     * @RequestMapping(value = "/grantPage", method = RequestMethod.POST) public String
     * grantPage(String ids, HttpServletRequest request) throws Exception { String id = ""; for
     * (int i = 0; i < ids.split(",").length; i++) { User u =
     * userService.getUser(ids.split(",")[i]); if (u != null) { id = id + "," + ids.split(",")[i];
     * } } ids = id.replaceFirst(",", ""); if (ids == null || ids.equals("")) {
     * logger.error("选中的管理员信息不存在，请刷新页面！"); return "/error/noInfo"; } request.setAttribute("ids",
     * ids); if (ids != null && !ids.equalsIgnoreCase("") && ids.indexOf(",") == -1) { User u =
     * userService.getUser(ids); request.setAttribute("user", u); } return "/admin/user/userGrant";
     * }
     *//**
     * 用户授权
     *
     * @param ids
     * @return
     */
    /*
     * @RequestMapping(value = "/grant", method = RequestMethod.POST)
     * @ResponseBody public Json grant(String ids, User user) throws Exception { Json j = new
     * Json(); String id = ""; for (int i = 0; i < ids.split(",").length; i++) { User u =
     * userService.getUser(ids.split(",")[i]); if (u != null) { id = id + "," + ids.split(",")[i];
     * } } ids = id.replaceFirst(",", ""); if (ids != null && !ids.equals("")) {
     * userService.grant(ids, user); j.setSuccess(true); j.setMsg("授权成功！"); } else {
     * j.setSuccess(false); j.setMsg("授权失败，选中的管理员信息不存在，请刷新页面！");
     * logger.error("授权失败，选中的管理员信息不存在，请刷新页面！"); } return j; }
     */

    /**
     * 跳转到修改自己的密码页面
     *
     * @return
     */
    @RequestMapping(value = "/editCurrentUserPwdPage", method = RequestMethod.POST)
    public String editCurrentUserPwdPage() {
        return "/user/userEditPwd";
    }

    /**
     * 修改自己的密码
     *
     * @param session
     * @param pwd
     * @return
     */
    @RequestMapping(value = "/editCurrentUserPwd", method = RequestMethod.POST)
    @ResponseBody
    public Json editCurrentUserPwd(HttpSession session, String oldPwd, String pwd)
            throws Exception {
        Json j = new Json();
        if (session != null) {
            SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
            if (sessionInfo != null) {
                j = userService.editCurrentUserPwd(sessionInfo, oldPwd, pwd);
            } else {
                j.setMsg("登录超时，请重新登录！");
            }
        } else {
            j.setMsg("登录超时，请重新登录！");
        }
        return j;
    }

    /**
     * 跳转到显示用户权限页面
     *
     * @return
     */
    @RequestMapping(value = "/currentUserResourcePage", method = RequestMethod.POST)
    public String currentUserResourcePage(HttpServletRequest request, HttpSession session)
            throws Exception {
        SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
        request.setAttribute("userResources",
                JSON.toJSONString(resourceService.allTree(sessionInfo)));
        return "/user/userResource";
    }

    /**
     * 跳转到用户修改页面
     *
     * @return
     */
    @RequestMapping(value = "/editPage", method = RequestMethod.POST)
    public String editPage(HttpServletRequest request, Integer id)
            throws Exception {
        User u = userService.getUser(id);
        if (u == null) {
            logger.error("该管理员信息不存在，请刷新页面！");
            return "/error/noInfo";
        }
        String editUrl = "/userController/edit";
        String grantUrl = "/roleController/grantRoleTree";

        getSessionInfo().addToResourceSet(editUrl, "用户修改功能");
        getSessionInfo().addToResourceSet(grantUrl, "用户修改-角色下拉列表");
        request.setAttribute("user", u);
        return "/admin/user/userEdit";
    }

    /**
     * 修改用户
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Json edit(User user)
            throws Exception {
        Json j = new Json();
        List<String> validateList = new ArrayList<String>();
        validateList.add("id");
        validateList.add("email");
        validateList.add("lockSymbol");
        if (ValidatorAnnotationBean.validatorBeanParams(user, validateList)) {
            User u = userService.getUser(user.getId());
            if (u == null) {
                j.setSuccess(false);
                j.setMsg("修改失败，该管理员信息不存在，请刷新页面！！");
                j.setObj(user);
                logger.error("该管理员信息不存在，请刷新页面！");
            } else {
                Integer operateId = this.getSessionInfo().getId();
                userService.edit(user, operateId);
                j.setSuccess(true);
                j.setMsg("修改成功！");
                j.setObj(user);
            }
        } else {
            j.setSuccess(false);
            j.setMsg("修改失败(属性校验失败)！");
            logger.info("修改用户信息失败:(属性校验失败)！");
        }
        return j;
    }

    /**
     * add by zhangxh 2015-11-22 16:32:16
     *
     * @throws Exception
     * @Description: 重置用户密码
     * @Check
     */
    @RequestMapping(value = "/resetPwd", method = RequestMethod.POST)
    @ResponseBody
    public Json resetPwd(Integer id)
            throws Exception {
        Json j = userService.resetPwd(id);
        return j;
    }

    @RequestMapping(value = "userInfo",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> userInfo(){
        Map<String,Object> ret = new HashMap<>();
        SessionInfo info = getSessionInfo();
        ret.put("name",info.getName());
        ret.put("email",info.getEmail());
        return ret;
    }
    @RequestMapping(value = "platformInfo",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> platformInfo(){
        Map<String,Object> ret = new HashMap<>();
        ret.put("about_content",getDept().getNote());
        ret.put("about_name",getDept().getName());
        return ret;
    }

    @RequestMapping(value = "updatePwd",method = RequestMethod.POST)
    @ResponseBody
    public Json updatePwd(@RequestParam(name="password") String password,@RequestParam(name="new_password") String new_password) throws Exception {
        return userService.editCurrentUserPwd(getSessionInfo(),password,new_password);
    }
}
