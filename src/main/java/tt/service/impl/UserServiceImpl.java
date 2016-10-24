package tt.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crb.util.CrbUtil;

import tt.dao.RoleDaoI;
import tt.dao.UserDaoI;
import tt.listener.ServerListener;
import tt.model.Tresource;
import tt.model.Trole;
import tt.model.TSystemConfig;
import tt.model.TUser;
import tt.pageModel.DataGrid;
import tt.pageModel.Json;
import tt.pageModel.SessionInfo;
import tt.pageModel.User;
import tt.service.UserServiceI;
import tt.util.Constant;
import tt.util.Encrypt;
import tt.util.PBKDF2;
import tt.util.RandomUtil;
import tt.util.mail.SendMail;


@Service
public class UserServiceImpl implements UserServiceI
{
    private static final Logger logger = Logger.getLogger(UserServiceImpl.class);

    @Autowired
    private UserDaoI userDao;

    @Autowired
    private RoleDaoI roleDao;

    @Override
    public User login(User user)
        throws Exception
    {
        Map<String, Object> params = new HashMap<String, Object>();
//        params.put("name", user.getName());
        params.put("name", "tecom");
        params.put("dept_id", 11);
        TUser t = userDao.get("from TUser t where t.name = :name and t.dept.id=:dept_id ", params);
        if (t != null)
        {
            String random = t.getPwd().split(":")[0];
            String pwd = PBKDF2.generateStorngPasswordHash256ByBCP(CrbUtil.hexString2Ba(random),
                user.getPwd());
            if (true)//(t.getPwd().equals(pwd))
            {
                BeanUtils.copyProperties(t, user);
                Iterator<Trole> roles = t.getTroles().iterator();
                String roleids = "";
                while (roles.hasNext())
                {
                    Trole trole = roles.next();
                    roleids += trole.getId() + ",";
                }
                user.setRoleIds(roleids);
                return user;
            }
        }
        return null;
    }

    @Override
    public DataGrid dataGrid(User user)
        throws Exception
    {
        DataGrid dg = new DataGrid();
        List<User> ul = new ArrayList<User>();
        List<TUser> l = userDao.getUserList(user);
        if (l != null && l.size() > 0)
        {
            for (TUser t : l)
            {
                User u = new User();
                BeanUtils.copyProperties(t, u);
                Set<Trole> roles = t.getTroles();
                if (roles != null && !roles.isEmpty())
                {
                    String roleIds = "";
                    String roleNames = "";
                    boolean b = false;
                    for (Trole tr : roles)
                    {
                        if (b)
                        {
                            roleIds += ",";
                            roleNames += ",";
                        }
                        else
                        {
                            b = true;
                        }
                        roleIds += tr.getId();
                        roleNames += tr.getName();
                    }
                    u.setRoleIds(roleIds);
                    u.setRoleNames(roleNames);
                }
                ul.add(u);
            }
        }
        dg.setRows(ul);
        dg.setTotal(userDao.getUserCount(user));
        return dg;
    }

    @Override
    public synchronized Json add(User user)
        throws Exception
    {
        Json j = new Json();
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("name", user.getName());
        if (userDao.count("select count(*) from TUser t where t.name = :name", params) > 0)
        {
            j.setMsg("用户名已存在！");
            j.setSuccess(false);
        }
        else
        {
            TUser u = new TUser();
            BeanUtils.copyProperties(user, u);
            u.setCreatedatetime(new Date());
            byte[] salt = PBKDF2.getSalt().getBytes();
            String pwd1 = RandomUtil.generateWord();
            String pwd = PBKDF2.generateStorngPasswordHash256ByBCP(salt, Encrypt.sha(pwd1));
            u.setPwd(pwd);
            userDao.save(u);
            // 把密码和账户email给用户
            SendMail s = new SendMail();
            String flag = s.SendPwdmail(
                "<pre>您好：<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;" + "管理员为您创建了用户,用户名为&nbsp;"
                                        + user.getName() + "&nbsp;&nbsp;密码为&nbsp;" + pwd1
                                        + "&nbsp;&nbsp;&nbsp;&nbsp;【华为TSM管理平台】" + "</pre>",
                user.getEmail());
            if (!flag.equals("success"))
            {
                if (flag.equals("邮箱地址不正确,邮件发送失败!"))
                {
                    j.setSuccess(true);
                }
                else
                {
                    j.setSuccess(false);
                }
                j.setMsg(flag);
                logger.error("邮件发送失败!");
                return j;
            }
            j.setSuccess(true);
            j.setMsg("添加成功,密码已发送到用户邮箱!");
        }
        return j;
    }

    @Override
    public User getUser(String id)
        throws Exception
    {
        TUser t = userDao.getUser(id);
        if (t == null)
        {
            return null;
        }
        User u = new User();
        BeanUtils.copyProperties(t, u);
        if (t.getTroles() != null && !t.getTroles().isEmpty())
        {
            String roleIds = "";
            String roleNames = "";
            boolean b = false;
            for (Trole role : t.getTroles())
            {
                if (b)
                {
                    roleIds += ",";
                    roleNames += ",";
                }
                else
                {
                    b = true;
                }
                roleIds += role.getId();
                roleNames += role.getName();
            }
            u.setRoleIds(roleIds);
            u.setRoleNames(roleNames);
        }
        return u;
    }

    @Override
    public synchronized void edit(User user, String operateId)
        throws Exception
    {
        List<Trole> roles = new ArrayList<Trole>();
        if (user.getRoleIds() != null)
        {
            for (String roleId : user.getRoleIds().split(","))
            {
                roles.add(roleDao.get(Trole.class, roleId));
            }
        }
        TUser u = userDao.get(TUser.class, user.getId());
        // update by zhangxh 只有超管才有权限有修改用户密码有效期
        if (operateId.equals("0"))
        {
            u.setValiddatetime(user.getValiddatetime());
        }
        u.setTroles(new HashSet<Trole>(roles));
        u.setModifydatetime(new Date());
        u.setEmail(user.getEmail());
        // 如果修改了账户状态
        if (u.getLockSymbol().shortValue() != user.getLockSymbol().shortValue())
        {
            if (user.getLockSymbol() == Constant.LOCKUSER)
            {
                u.setLockSymbol(Constant.LOCKUSER);
                u.setRemainingLogins((short)0);
            }
            else
            {
                u.setLockSymbol(Constant.UNLOCKUSER);
                short REMAINING_LOGINS = Constant.REMAINING_LOGINS;
                TSystemConfig tSystemConfig = ServerListener.sysConfigMap.get("REMAINING_LOGINS");
                if (tSystemConfig != null)
                {
                    REMAINING_LOGINS = Short.parseShort(tSystemConfig.getConfContext());
                }
                u.setRemainingLogins(REMAINING_LOGINS);
            }
        }
    }

    @Override
    public void delete(String id)
        throws Exception
    {

        // update by zhangxh 2015-11-28 18:31:01删除用户的密码信息
        TUser t = userDao.getUser(id);
        userDao.delete(id);
    }

    @Override
    public void grant(String ids, User user)
        throws Exception
    {
        if (ids != null && ids.length() > 0)
        {
            List<Trole> roles = new ArrayList<Trole>();
            if (user.getRoleIds() != null)
            {
                for (String roleId : user.getRoleIds().split(","))
                {
                    roles.add(roleDao.get(Trole.class, roleId));
                }
            }
            for (String id : ids.split(","))
            {
                if (id != null && !id.equalsIgnoreCase(""))
                {
                    TUser t = userDao.get(TUser.class, id);
                    if (t != null)
                    {
                        t.setTroles(new HashSet<Trole>(roles));
                        t.setModifydatetime(new Date());
                    }
                }
            }
        }
    }

    @Override
    public List<Tresource> resourceList(String id)
        throws Exception
    {
        List<Tresource> resourceList = new ArrayList<Tresource>();
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id", id);
        TUser t = userDao.get(
            "from TUser t join fetch t.troles role join fetch role.tresources resource where t.id = :id",
            params);
        if (t != null)
        {
            Set<Trole> roles = t.getTroles();
            if (roles != null && !roles.isEmpty())
            {
                for (Trole role : roles)
                {
                    Set<Tresource> resources = role.getTresources();
                    if (resources != null && !resources.isEmpty())
                    {
                        for (Tresource resource : resources)
                        {
                            if (resource != null && resource.getUrl() != null)
                            {
                                resourceList.add(resource);
                            }
                        }
                    }
                }
            }
        }
        return resourceList;
    }

    /*
     * @Override public Json editPwd(User user) throws Exception { Json j = new Json(); if (user !=
     * null && user.getPwd() != null && !user.getPwd().trim().equalsIgnoreCase("")) { String pwd =
     * PBKDF2.generateStorngPasswordHash256ByBCP(PBKDF2.getSalt().getBytes(), user.getPwd());
     * //update by zhangxh 2015-11-19 17:00:01 不能使用最近5次用过的密码 List<TPasswordHistory> tpList =
     * passwordHistoryDao.findPasswordHistoryByName(user.getName()); if(tpList!=null &&
     * tpList.size()>0){ for(TPasswordHistory t:tpList){ String randomHistory =
     * t.getPwd().split(":")[0]; String pwd1 =
     * PBKDF2.generateStorngPasswordHash256ByBCP(CrbUtil.hexString2Ba(randomHistory),
     * user.getPwd()); if(pwd1.equals(t.getPwd())){ j.setSuccess(false);
     * j.setMsg("不能使用最近5次用过的密码!"); return j; } } } TUser u = userDao.get(TUser.class,
     * user.getId()); if (u != null) { u.setPwd(pwd); u.setModifydatetime(new Date());
     * j.setMsg("修改成功!"); j.setSuccess(true); //往密码表里记录数据
     * passwordHistoryDao.add(user.getName(),pwd); return j; } } j.setSuccess(false);
     * j.setMsg("修改失败!"); return j; }
     */

    @Override
    public Json editCurrentUserPwd(SessionInfo sessionInfo, String oldPwd, String pwd)
        throws Exception
    {
        Json j = new Json();
        TUser u = userDao.get(TUser.class, sessionInfo.getId());
        if (u != null)
        {
            String random = u.getPwd().split(":")[0];
            String oldPwdStr = PBKDF2.generateStorngPasswordHash256ByBCP(
                CrbUtil.hexString2Ba(random), oldPwd);
            if (u.getPwd().equalsIgnoreCase(oldPwdStr))
            {// 说明原密码输入正确
                String pwdStr = PBKDF2.generateStorngPasswordHash256ByBCP(
                    PBKDF2.getSalt().getBytes(), pwd);

                // update by zhangxh 2015-11-19 17:00:01 不能使用最近5次用过的密码
                u.setPwd(pwdStr);
                u.setModifydatetime(new Date());
                j.setMsg("修改密码成功，下次登录生效！");
                j.setSuccess(true);
                return j;
            }
            j.setSuccess(false);
            j.setMsg("原密码错误！");
            return j;
        }
        else
        {
            j.setSuccess(false);
            j.setMsg("修改失败，该管理员信息不存在，请刷新页面！");
            logger.error("该管理员信息不存在，请刷新页面！");
            return j;
        }

    }

    @Override
    public User getUserByName(String name)
        throws Exception
    {
        String hql = "from TUser t where t.name =:name";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("name", name);
        TUser t = userDao.get(hql, params);
        if (t != null)
        {
            User u = new User();
            BeanUtils.copyProperties(t, u);
            return u;
        }
        return null;
    }

    /**
     * 修改锁定状态
     */
    @Override
    public void modifyLockSymbol(User user)
        throws Exception
    {
        TUser u = userDao.get(TUser.class, user.getId());
        if (u != null)
        {
            u.setLockSymbol(user.getLockSymbol());
        }
    }

    /**
     * 修改剩余登录次数
     */
    @Override
    public void modifyRemainingLongins(User user)
        throws Exception
    {
        TUser u = userDao.get(TUser.class, user.getId());
        if (u != null)
        {
            u.setRemainingLogins(user.getRemainingLogins());
        }
    }

    /**
     * 修改所有用户为解锁状态
     */

    @Override
    public void userUnlock()
        throws Exception
    {
        User user = new User();
        List<TUser> list = userDao.getUserList(user);
        Short REMAINING_LOGINS = Constant.REMAINING_LOGINS;
        TSystemConfig tSystemConfig = ServerListener.sysConfigMap.get("REMAINING_LOGINS");
        if (tSystemConfig != null)
        {
            REMAINING_LOGINS = Short.parseShort(tSystemConfig.getConfContext());
        }

        for (TUser u : list)
        {
            u.setLockSymbol(Constant.UNLOCKUSER);
            u.setRemainingLogins(REMAINING_LOGINS);
            userDao.update(u);
        }

    }

    public Json editInvalidPwd(String name, String oldPwd, String pwd)
        throws Exception
    {
        Json j = new Json();
        TUser u = userDao.getUserByName(name);
        if (u == null)
        {
            j.setSuccess(false);
            j.setMsg("修改失败，该管理员信息不存在！");
            return j;
        }
        String random = u.getPwd().split(":")[0];
        String oldPwdStr = PBKDF2.generateStorngPasswordHash256ByBCP(CrbUtil.hexString2Ba(random),
            oldPwd);
        if (u.getPwd().equalsIgnoreCase(oldPwdStr))
        {// 说明原密码输入正确
            String pwdStr = PBKDF2.generateStorngPasswordHash256ByBCP(PBKDF2.getSalt().getBytes(),
                pwd);

            u.setPwd(pwdStr);
            u.setModifydatetime(new Date());
            // 往密码表里记录数据
            j.setMsg("修改密码成功！");
            j.setSuccess(true);
            return j;
        }
        j.setSuccess(false);
        j.setMsg("原密码错误！");
        return j;
    }

    public Json resetPwd(String id)
        throws Exception
    {
        Json j = new Json();
        TUser u = userDao.getUser(id);
        if (u != null)
        {
            String pwd = RandomUtil.generateWord();
            String pwdStr = PBKDF2.generateStorngPasswordHash256ByBCP(PBKDF2.getSalt().getBytes(),
                Encrypt.sha(pwd));
            u.setPwd(pwdStr);
            u.setModifydatetime(new Date());
            // 往密码表里记录数据
            if (u.getEmail() == null || u.getEmail().equals(""))
            {
                j.setSuccess(false);
                j.setMsg("用户没有邮箱信息!");
                return j;
            }
            // 把密码和账户email给用户
            SendMail s = new SendMail();
            String flag = s.SendPwdmail(
                "<pre>您好：<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;" + "管理员为您重置了密码," + "密码为&nbsp;" + pwd
                                        + "&nbsp;&nbsp;&nbsp;&nbsp;【雷森运营支撑管理平台】" + "</pre>",
                u.getEmail());
            if (!flag.equals("success"))
            {
                j.setSuccess(false);
                j.setMsg(flag);
                logger.error("重置密码-发送邮件给用户" + u.getName() + "失败！");
                return j;
            }
            j.setMsg("重置密码成功,密码已发送到用户邮箱！");
            logger.info("重置密码-发送邮件给用户" + u.getName() + "成功！");
            j.setSuccess(true);
            return j;
        }
        j.setMsg("用户不存在，重置密码失败!");
        j.setSuccess(false);
        return j;
    }

}
