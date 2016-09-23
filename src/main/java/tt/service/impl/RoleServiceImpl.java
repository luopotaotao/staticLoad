package tt.service.impl;


import java.util.ArrayList;
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

import tt.dao.ResourceDaoI;
import tt.dao.RoleDaoI;
import tt.dao.UserDaoI;
import tt.model.TUser;
import tt.model.Tresource;
import tt.model.Trole;
import tt.pageModel.Json;
import tt.pageModel.Role;
import tt.pageModel.SessionInfo;
import tt.pageModel.Tree;
import tt.service.RoleServiceI;
import tt.util.Constant;


@Service
public class RoleServiceImpl implements RoleServiceI
{
    private static final Logger logger = Logger.getLogger(RoleServiceImpl.class);

    @Autowired
    private RoleDaoI roleDao;

    @Autowired
    private UserDaoI userDao;

    @Autowired
    private ResourceDaoI resourceDao;

    @Override
    public Json add(Role role, SessionInfo sessionInfo)
        throws Exception
    {
        Json j = new Json();
        String hql = "from Trole where name = :name";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("name", role.getName());
        Trole r = roleDao.get(hql, params);
        if (r != null)
        {
            j.setSuccess(false);
            j.setMsg("添加失败，该系统角色名称已存在！");
            return j;
        }

        Trole t = new Trole();
        BeanUtils.copyProperties(role, t);
        if (role.getPid() != null && !role.getPid().equalsIgnoreCase(""))
        {
            t.setTrole(roleDao.get(Trole.class, role.getPid()));
        }
        roleDao.save(t);

        // 刚刚添加的角色，赋予给当前的用户
        TUser user = userDao.get(TUser.class, sessionInfo.getId());
        user.getTroles().add(t);
        // 刚刚添加的角色，赋予给系统管理员tecom
        // Tuser user1 = userDao.get(Tuser.class, "0");
        // user1.getTroles().add(t);
        j.setSuccess(true);
        j.setMsg(Constant.ADD_SUCCESS);
        return j;
    }

    @Override
    public Role get(String id)
        throws Exception
    {
        Role r = new Role();
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id", id);
        Trole t = roleDao.get(
            "select distinct t from Trole t left join fetch t.tresources resource where t.id = :id",
            params);
        if (t != null)
        {
            BeanUtils.copyProperties(t, r);
            if (t.getTrole() != null)
            {
                r.setPid(t.getTrole().getId());
                r.setPname(t.getTrole().getName());
            }
            Set<Tresource> s = t.getTresources();
            if (s != null && !s.isEmpty())
            {
                boolean b = false;
                String ids = "";
                String names = "";
                for (Tresource tr : s)
                {
                    if (b)
                    {
                        ids += ",";
                        names += ",";
                    }
                    else
                    {
                        b = true;
                    }
                    ids += tr.getId();
                    names += tr.getName();
                }
                r.setResourceIds(ids);
                r.setResourceNames(names);
            }
        }
        else
        {
            return null;
        }
        return r;
    }

    @Override
    public Json edit(Role role)
        throws Exception
    {
        Json j = new Json();
        Trole t = roleDao.get(Trole.class, role.getId());
        if (t != null)
        {
            String hql = "from Trole where name = :name and name != :oldname";
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("name", role.getName());
            params.put("oldname", t.getName());
            Trole r = roleDao.get(hql, params);
            if (r != null)
            {
                j.setMsg("修改失败，该系统角色名称已存在！");
                j.setSuccess(false);
                return j;
            }

            BeanUtils.copyProperties(role, t);
            if (role.getPid() != null && !role.getPid().equalsIgnoreCase(""))
            {
                t.setTrole(roleDao.get(Trole.class, role.getPid()));
            }
            if (role.getPid() != null && !role.getPid().equalsIgnoreCase(""))
            {// 说明前台选中了上级资源
                Trole pt = roleDao.get(Trole.class, role.getPid());
                isChildren(t, pt);// 说明要将当前资源修改到当前资源的子/孙子资源下
                t.setTrole(pt);
            }
            else
            {
                t.setTrole(null);// 前台没有选中上级资源，所以就置空
            }
        }
        j.setSuccess(true);
        j.setMsg("修改成功！");
        logger.info("修改角色" + role.getName() + "成功！");
        return j;
    }

    /**
     * 判断是否是将当前节点修改到当前节点的子节点
     * 
     * @param t
     *            当前节点
     * @param pt
     *            要修改到的节点
     * @return
     */
    private boolean isChildren(Trole t, Trole pt)
        throws Exception
    {
        if (pt != null && pt.getTrole() != null)
        {
            if (pt.getTrole().getId().equalsIgnoreCase(t.getId()))
            {
                pt.setTrole(null);
                return true;
            }
            else
            {
                return isChildren(t, pt.getTrole());
            }
        }
        return false;
    }

    @Override
    public List<Role> treeGrid(SessionInfo sessionInfo)
        throws Exception
    {
        List<Role> rl = new ArrayList<Role>();
        List<Trole> tl = null;
        Map<String, Object> params = new HashMap<String, Object>();
        tl = roleDao.find("select distinct t from Trole t left join fetch t.tresources resource  ",
            params);
        if (tl != null && tl.size() > 0)
        {
            for (Trole t : tl)
            {
                Role r = new Role();
                BeanUtils.copyProperties(t, r);
                r.setIconCls("status_online");
                if (t.getTrole() != null)
                {
                    r.setPid(t.getTrole().getId());
                    r.setPname(t.getTrole().getName());
                }
                Set<Tresource> s = t.getTresources();
                if (s != null && !s.isEmpty())
                {
                    boolean b = false;
                    String ids = "";
                    String names = "";
                    for (Tresource tr : s)
                    {
                        if (b)
                        {
                            ids += ",";
                            names += ",";
                        }
                        else
                        {
                            b = true;
                        }
                        ids += tr.getId();
                        names += tr.getName();
                    }
                    r.setResourceIds(ids);
                    r.setResourceNames(names);
                }
                rl.add(r);
            }
        }
        return rl;
    }

    /**
     * 去掉List内重复的信息
     * 
     * @param tl
     * @return
     */
    public List<Trole> removal(List<Trole> tl)
    {
        List<Trole> result = new ArrayList<Trole>();
        for (Trole t : tl)
        {
            if (!result.contains(t))
            {
                result.add(t);
            }
        }
        return result;
    }

    /**
     * 查询出所有的子角色
     * 
     * @param tl
     * @return
     */
    public List<Trole> findChildRole(List<Trole> tl)
    {
        List<Trole> result = new ArrayList<Trole>();
        if (tl != null && tl.size() != 0)
        {
            for (Trole t : tl)
            {
                if (!result.contains(t))
                {
                    result.add(t);
                }
                Set<Trole> troles = t.getTroles();
                List<Trole> l = new ArrayList<Trole>();
                if (troles != null && troles.size() != 0)
                {
                    Iterator<Trole> iterator = troles.iterator();
                    while (iterator.hasNext())
                    {
                        Trole temp = iterator.next();
                        l.add(temp);
                    }
                }

                result.addAll(findChildRole(l));
            }
        }
        return result;
    }

    @Override
    public void delete(String id)
        throws Exception
    {
        Trole t = roleDao.get(Trole.class, id);
        if (t != null)
        {
            del(t);
        }
        {
            logger.info("该角色信息不存在或已经删除");
        }

    }

    private void del(Trole t)
        throws Exception
    {
        if (t.getTroles() != null && t.getTroles().size() > 0)
        {
            for (Trole r : t.getTroles())
            {
                del(r);
            }
        }
        roleDao.delete(t);
    }

    @Override
    public List<Tree> tree(SessionInfo sessionInfo)
        throws Exception
    {
        List<Trole> l = null;
        List<Tree> lt = new ArrayList<Tree>();

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("roleType", Constant.MANAGER);
        if (sessionInfo != null)
        {
            params.put("userId", sessionInfo.getId());// 查自己有权限的角色
            l = roleDao.find(
                "select distinct t from Trole t join fetch t.tusers user where t.roleType = :roleType and user.id = :userId  order by t.seq",
                params);
        }
        else
        {
            l = roleDao.find("from Trole t where t.roleType = :roleType order by t.seq", params);
        }
        l = findChildRole(l);
        l = removal(l);
        if (l != null && l.size() > 0)
        {
            for (Trole t : l)
            {
                Tree tree = new Tree();
                BeanUtils.copyProperties(t, tree);
                tree.setText(t.getName());
                tree.setIconCls("status_online");
                if (t.getTrole() != null)
                {
                    tree.setPid(t.getTrole().getId());
                }
                lt.add(tree);
            }
        }
        return lt;
    }

    @Override
    public List<Tree> grantRoleTree()
        throws Exception
    {
        List<Trole> l = null;
        List<Tree> lt = new ArrayList<Tree>();
        Map<String, Object> params = new HashMap<String, Object>();
        l = roleDao.find("from Trole t where t.id<> '0' order by t.seq", params);
        l = findChildRole(l);
        l = removal(l);
        if (l != null && l.size() > 0)
        {
            for (Trole t : l)
            {
                Tree tree = new Tree();
                BeanUtils.copyProperties(t, tree);
                tree.setText(t.getName());
                tree.setIconCls("status_online");
                if (t.getTrole() != null)
                {
                    tree.setPid(t.getTrole().getId());
                }
                lt.add(tree);
            }
        }
        return lt;
    }

    @Override
    public List<Tree> allTree()
        throws Exception
    {
        return this.tree(null);
    }

    @Override
    public void grant(Role role)
        throws Exception
    {
        Trole t = roleDao.get(Trole.class, role.getId());
        if (role.getResourceIds() != null && !role.getResourceIds().equalsIgnoreCase(""))
        {
            String ids = "";
            boolean b = false;
            for (String id : role.getResourceIds().split(","))
            {
                if (b)
                {
                    ids += ",";
                }
                else
                {
                    b = true;
                }
                ids += "'" + id + "'";
            }
            t.setTresources(new HashSet<Tresource>(resourceDao.find(
                "select distinct t from Tresource t where t.id in (" + ids + ")")));
        }
        else
        {
            t.setTresources(null);
        }
    }

}
