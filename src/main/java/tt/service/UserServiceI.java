package tt.service;


import java.util.List;

import tt.model.Tresource;
import tt.pageModel.DataGrid;
import tt.pageModel.Json;
import tt.pageModel.SessionInfo;
import tt.pageModel.User;


/**
 * 用户Service
 * 
 * @author
 */
public interface UserServiceI
{

    /**
     * 用户登录
     * 
     * @param user
     *            里面包含登录名和密码，并且只查询 是管理平台的管理员即：manager_type = 1
     * @return 用户对象
     * @throws Exception
     */
    public User login(User user)
        throws Exception;

    /**
     * 获取用户数据表格
     * 
     * @param user
     * @return
     */
    public DataGrid dataGrid(User user)
        throws Exception;

    /**
     * 添加用户
     * 
     * @param user
     */
    public Json add(User user)
        throws Exception;

    /**
     * 获得用户对象
     * 
     * @param id
     * @return
     */
    public User getUser(String id)
        throws Exception;

    /**
     * 修改用户 update by zhangxh 2015-11-22 17:35:56加上操作管理员id:operateId
     * 
     * @param user
     */
    public void edit(User user, String operateId)
        throws Exception;

    /**
     * 删除用户
     * 
     * @param id
     */
    public void delete(String id)
        throws Exception;

    /**
     * 用户授权
     * 
     * @param ids
     * @param user
     *            需要user.roleIds的属性值
     */
    public void grant(String ids, User user)
        throws Exception;

    /**
     * 获得用户能访问的资源地址
     * 
     * @param id
     *            用户ID
     * @return
     */
    public List<Tresource> resourceList(String id)
        throws Exception;

    /**
     * 修改用户密码
     * 
     * @param user
     */
    // public Json editPwd(User user) throws Exception;

    /**
     * 修改用户自己的密码
     * 
     * @param sessionInfo
     * @param oldPwd
     * @param pwd
     * @return
     */
    public Json editCurrentUserPwd(SessionInfo sessionInfo, String oldPwd, String pwd)
        throws Exception;

    /**
     * 修改用户剩余登录次数
     * 
     * @param user
     * @throws Exception
     */

    public void modifyRemainingLongins(User user)
        throws Exception;

    /**
     * 通过用户名查询用户信息
     * 
     * @param name
     * @return
     * @throws Exception
     */

    public User getUserByName(String name)
        throws Exception;

    /**
     * 修改账户锁定状态 0:未锁定；1：锁定
     * 
     * @param user
     * @throws Exception
     */
    public void modifyLockSymbol(User user)
        throws Exception;

    /**
     * 修改所有用户为解锁状态
     * 
     * @throws Exception
     */
    public void userUnlock()
        throws Exception;

    /**
     * @Description: 密码超过180天时强制修改
     * @Check
     * @param name
     * @param oldPwd
     * @param pwd
     * @return
     * @throws Exception
     */
    public Json editInvalidPwd(String name, String oldPwd, String pwd)
        throws Exception;

    /**
     * @Description: 重置密码
     * @Check
     * @param id
     * @return
     * @throws Exception
     */
    public Json resetPwd(String id)
        throws Exception;

}
