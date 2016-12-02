package tt.dao;


import java.util.List;

import tt.model.TUser;
import tt.pageModel.User;


/**
 * 用户数据库操作类
 * 
 * @author
 */
public interface UserDaoI extends BaseDaoI<TUser>
{

    /**
     * 获取全部用户List
     * 
     * @param user
     * @return
     */
    public List<TUser> getUserList(User user)
        throws Exception;

    /**
     * 用户数量
     * 
     * @param user
     * @return
     */
    public Long getUserCount(User user)
        throws Exception;

    /**
     * 获得用户对象
     * 
     * @param id
     * @return
     */
    public TUser getUser(Integer id)
        throws Exception;

    /**
     * 删除用户
     * 
     * @param id
     */
    public void delete(Integer id)
        throws Exception;

    /**
     * 通过用户名查询用户信息
     * 
     * @param name
     * @return
     * @throws Exception
     */
    public TUser getUserByName(String name)
        throws Exception;

}
