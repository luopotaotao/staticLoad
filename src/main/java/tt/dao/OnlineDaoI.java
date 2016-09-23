package tt.dao;


import tt.model.Tonline;


/**
 * 在线监控数据库操作类
 * 
 * @author admin
 */
public interface OnlineDaoI
{
    /**
     * 根据登陆ip、登录名保存或修改用户登陆信息
     * 
     * @param loginname
     * @param ip
     * @throws Exception
     */
    public void saveOrUpdateTonlineByLoginNameAndIp(String loginname, String ip)
        throws Exception;

    /**
     * 删除登录名为loginname的在线用户信息
     * 
     * @param loginname
     * @throws Exception
     */
    public void deleteTonlineByLoginName(String loginname)
        throws Exception;

    /**
     * 清空在线用户表
     * 
     * @throws Exception
     */
    public void deleteOnline()
        throws Exception;

    /**
     * 根据用户名查询在线用户信息
     * 
     * @param username
     * @return
     * @throws Exception
     */
    public Tonline searchOnlineUser(String username)
        throws Exception;

}
