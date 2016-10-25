package tt.service.impl;


import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;

import tt.dao.ResourceDaoI;
import tt.dao.ResourceTypeDaoI;
import tt.dao.RoleDaoI;
import tt.dao.UserDaoI;
import tt.model.Tresource;
import tt.model.Tresourcetype;
import tt.model.Trole;
import tt.model.TUser;
import tt.service.InitServiceI;
import tt.util.Encrypt;
import tt.util.PBKDF2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class InitServiceImpl implements InitServiceI
{

    @Autowired
    private UserDaoI userDao;

    @Autowired
    private RoleDaoI roleDao;

    @Autowired
    private ResourceDaoI resourceDao;

    @Autowired
    private ResourceTypeDaoI resourceTypeDao;

    @Override
    public synchronized void init()
    {

        initResourceType();// 初始化资源类型

        initResource();// 初始化资源

        initRole();// 初始化角色

        try
        {
            initUser();
        }
        catch (NoSuchAlgorithmException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } // 初始化用户

    }

    private void initResource()
    {
        Tresourcetype menuType = resourceTypeDao.get(Tresourcetype.class, "0");// 菜单类型
        Tresourcetype funType = resourceTypeDao.get(Tresourcetype.class, "1");// 功能类型

        Tresource xtgl = new Tresource();
        xtgl.setId("xtgl");
        xtgl.setName("系统管理");
        xtgl.setTresourcetype(menuType);
        xtgl.setSeq((short)0);
        xtgl.setIcon("plugin");
        resourceDao.saveOrUpdate(xtgl);

        Tresource zygl = new Tresource();
        zygl.setId("zygl");
        zygl.setName("资源管理");
        zygl.setTresourcetype(menuType);
        zygl.setTresource(xtgl);
        zygl.setSeq((short)1);
        zygl.setUrl("/resourceController/manager");
        zygl.setIcon("database_gear");
        zygl.setRemark("管理系统中所有的菜单或功能");
        resourceDao.saveOrUpdate(zygl);

        Tresource zyglMenu = new Tresource();
        zyglMenu.setId("zyglMenu");
        zyglMenu.setName("功能菜单");
        zyglMenu.setTresourcetype(funType);
        zyglMenu.setTresource(zygl);
        zyglMenu.setSeq((short)2);
        zyglMenu.setUrl("/resourceController/tree");
        zyglMenu.setIcon("wrench");
        resourceDao.saveOrUpdate(zyglMenu);

        Tresource zyglAdd = new Tresource();
        zyglAdd.setId("zyglAdd");
        zyglAdd.setName("添加资源");
        zyglAdd.setTresourcetype(funType);
        zyglAdd.setTresource(zygl);
        zyglAdd.setSeq((short)4);
        zyglAdd.setUrl("/resourceController/add");
        zyglAdd.setIcon("wrench");
        resourceDao.saveOrUpdate(zyglAdd);

        Tresource zyglEdit = new Tresource();
        zyglEdit.setId("zyglEdit");
        zyglEdit.setName("编辑资源");
        zyglEdit.setTresourcetype(funType);
        zyglEdit.setTresource(zygl);
        zyglEdit.setSeq((short)6);
        zyglEdit.setUrl("/resourceController/edit");
        zyglEdit.setIcon("wrench");
        resourceDao.saveOrUpdate(zyglEdit);

        Tresource zyglDelete = new Tresource();
        zyglDelete.setId("zyglDelete");
        zyglDelete.setName("删除资源");
        zyglDelete.setTresourcetype(funType);
        zyglDelete.setTresource(zygl);
        zyglDelete.setSeq((short)7);
        zyglDelete.setUrl("/resourceController/delete");
        zyglDelete.setIcon("wrench");
        resourceDao.saveOrUpdate(zyglDelete);

        Tresource jsgl = new Tresource();
        jsgl.setId("jsgl");
        jsgl.setName("角色管理");
        jsgl.setTresourcetype(menuType);
        jsgl.setTresource(xtgl);
        jsgl.setSeq((short)2);
        jsgl.setUrl("/roleController/manager");
        jsgl.setIcon("tux");
        resourceDao.saveOrUpdate(jsgl);

        Tresource jsglAdd = new Tresource();
        jsglAdd.setId("jsglAdd");
        jsglAdd.setName("添加角色");
        jsglAdd.setTresourcetype(funType);
        jsglAdd.setTresource(jsgl);
        jsglAdd.setSeq((short)3);
        jsglAdd.setUrl("/roleController/add");
        jsglAdd.setIcon("wrench");
        resourceDao.saveOrUpdate(jsglAdd);

        Tresource jsglEdit = new Tresource();
        jsglEdit.setId("jsglEdit");
        jsglEdit.setName("编辑角色");
        jsglEdit.setTresourcetype(funType);
        jsglEdit.setTresource(jsgl);
        jsglEdit.setSeq((short)5);
        jsglEdit.setUrl("/roleController/edit");
        jsglEdit.setIcon("wrench");
        resourceDao.saveOrUpdate(jsglEdit);

        Tresource jsglDelete = new Tresource();
        jsglDelete.setId("jsglDelete");
        jsglDelete.setName("删除角色");
        jsglDelete.setTresourcetype(funType);
        jsglDelete.setTresource(jsgl);
        jsglDelete.setSeq((short)6);
        jsglDelete.setUrl("/roleController/delete");
        jsglDelete.setIcon("wrench");
        resourceDao.saveOrUpdate(jsglDelete);

        Tresource jsglGrant = new Tresource();
        jsglGrant.setId("jsglGrant");
        jsglGrant.setName("角色授权");
        jsglGrant.setTresourcetype(funType);
        jsglGrant.setTresource(jsgl);
        jsglGrant.setSeq((short)8);
        jsglGrant.setUrl("/roleController/grant");
        jsglGrant.setIcon("wrench");
        resourceDao.saveOrUpdate(jsglGrant);

        Tresource yhgl = new Tresource();
        yhgl.setId("yhgl");
        yhgl.setName("用户管理");
        yhgl.setTresourcetype(menuType);
        yhgl.setTresource(xtgl);
        yhgl.setSeq((short)3);
        yhgl.setUrl("/userController/manager");
        yhgl.setIcon("status_online");
        resourceDao.saveOrUpdate(yhgl);

        Tresource yhglAdd = new Tresource();
        yhglAdd.setId("yhglAdd");
        yhglAdd.setName("添加用户");
        yhglAdd.setTresourcetype(funType);
        yhglAdd.setTresource(yhgl);
        yhglAdd.setSeq((short)3);
        yhglAdd.setUrl("/userController/add");
        yhglAdd.setIcon("wrench");
        resourceDao.saveOrUpdate(yhglAdd);

        Tresource yhglEdit = new Tresource();
        yhglEdit.setId("yhglEdit");
        yhglEdit.setName("编辑用户");
        yhglEdit.setTresourcetype(funType);
        yhglEdit.setTresource(yhgl);
        yhglEdit.setSeq((short)5);
        yhglEdit.setUrl("/userController/edit");
        yhglEdit.setIcon("wrench");
        resourceDao.saveOrUpdate(yhglEdit);

        Tresource yhglDelete = new Tresource();
        yhglDelete.setId("yhglDelete");
        yhglDelete.setName("删除用户");
        yhglDelete.setTresourcetype(funType);
        yhglDelete.setTresource(yhgl);
        yhglDelete.setSeq((short)6);
        yhglDelete.setUrl("/userController/delete");
        yhglDelete.setIcon("wrench");
        resourceDao.saveOrUpdate(yhglDelete);

        Tresource yhglBatchDelete = new Tresource();
        yhglBatchDelete.setId("yhglBatchDelete");
        yhglBatchDelete.setName("批量删除用户");
        yhglBatchDelete.setTresourcetype(funType);
        yhglBatchDelete.setTresource(yhgl);
        yhglBatchDelete.setSeq((short)7);
        yhglBatchDelete.setUrl("/userController/batchDelete");
        yhglBatchDelete.setIcon("wrench");
        resourceDao.saveOrUpdate(yhglBatchDelete);

        Tresource yhglGrant = new Tresource();
        yhglGrant.setId("yhglGrant");
        yhglGrant.setName("用户授权");
        yhglGrant.setTresourcetype(funType);
        yhglGrant.setTresource(yhgl);
        yhglGrant.setSeq((short)9);
        yhglGrant.setUrl("/userController/grant");
        yhglGrant.setIcon("wrench");
        resourceDao.saveOrUpdate(yhglGrant);

        Tresource yhglEditPwd = new Tresource();
        yhglEditPwd.setId("yhglEditPwd");
        yhglEditPwd.setName("用户修改密码");
        yhglEditPwd.setTresourcetype(funType);
        yhglEditPwd.setTresource(yhgl);
        yhglEditPwd.setSeq((short)11);
        yhglEditPwd.setUrl("/userController/editPwd");
        yhglEditPwd.setIcon("wrench");
        resourceDao.saveOrUpdate(yhglEditPwd);

        Tresource sjygl = new Tresource();
        sjygl.setId("sjygl");
        sjygl.setName("数据源管理");
        sjygl.setTresourcetype(menuType);
        sjygl.setTresource(xtgl);
        sjygl.setSeq((short)5);
        sjygl.setUrl("/druidController/druid");
        sjygl.setIcon("server_database");
        resourceDao.saveOrUpdate(sjygl);

    }

    private void initResourceType()
    {
        Tresourcetype t = new Tresourcetype();
        t.setId("0");
        t.setName("菜单");
        resourceTypeDao.saveOrUpdate(t);

        Tresourcetype t2 = new Tresourcetype();
        t2.setId("1");
        t2.setName("功能");
        resourceTypeDao.saveOrUpdate(t2);
    }

    private void initRole()
    {
        Trole superAdmin = new Trole();
        superAdmin.setId("0");
        superAdmin.setName("超管");
        superAdmin.getTresources().addAll(resourceDao.find("from Tresource t"));// 让超管可以访问所有资源
        superAdmin.setSeq((short)0);
        superAdmin.setRemark("超级管理员角色，拥有系统中所有的资源访问权限");
        roleDao.saveOrUpdate(superAdmin);

        Trole guest = new Trole();
        guest.setId("guest");
        guest.setName("Guest");
        guest.getTresources().addAll(resourceDao.find(
            "from Tresource t where t.id in ('xtgl','zygl','zyglTreeGrid','jsgl','jsglTreeGrid','yhgl','yhglDateGrid','jeasyuiApi')"));
        guest.setSeq((short)1);
        guest.setRemark("只拥有只看的权限");
        roleDao.saveOrUpdate(guest);
    }

    private void initUser()
        throws NoSuchAlgorithmException
    {
        List<TUser> l = userDao.find("from TUser t ");
        if (l != null && l.size() > 0)
        {
            for (TUser user : l)
            {
                userDao.delete(user);
            }
        }

        byte[] salt = PBKDF2.getSalt().getBytes();
        String pwd = PBKDF2.generateStorngPasswordHash256ByBCP(salt, Encrypt.sha("123456"));

        TUser admin = new TUser();
        admin.setId("0");
        admin.setName("admin");
        admin.setPwd(pwd);
        admin.setCreatedatetime(new Date());
        admin.setEmail("zhangzq@bjleisen.com");
        admin.setLockSymbol((short)0);
        admin.setRemainingLogins((short)3);
        admin.getTroles().addAll(roleDao.find("from Trole t"));// 给用户赋予所有角色
        userDao.saveOrUpdate(admin);

        TUser admin1 = new TUser();
        admin1.setId("1");
        admin1.setName("admin");
        admin1.setPwd(pwd);
        admin1.setCreatedatetime(new Date());
        admin1.setEmail("zhangzq@bjleisen.com");
        admin1.setLockSymbol((short)0);
        admin1.setRemainingLogins((short)3);
        admin1.getTroles().addAll(roleDao.find("from Trole t"));// 给用户赋予资源管理员角色
        userDao.saveOrUpdate(admin1);

        TUser guest = new TUser();
        guest.setId("guest");
        guest.setName("guest");
        guest.setPwd(pwd);
        guest.setCreatedatetime(new Date());
        guest.setEmail("zhangzq@bjleisen.com");
        guest.setLockSymbol((short)0);
        guest.setRemainingLogins((short)3);
        guest.getTroles().addAll(roleDao.find("from Trole t where t.id = 'guest'"));// 给用户赋予Guest角色
        userDao.saveOrUpdate(guest);
    }
}
