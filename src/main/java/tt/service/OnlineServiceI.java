package tt.service;

public interface OnlineServiceI
{
    /**
     * 增加或修改在线用户信息
     * 
     * @param loginName
     * @param ip
     * @throws Exception
     */
    public void saveOrUpdateTonlineByLoginNameAndIp(String loginName, String ip)
        throws Exception;

    /**
     * 通过用户名删除在线用户
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
     * 判断用户是否已经登录
     * 
     * @param username
     *            用户名
     * @return true没有登录/false已经登录
     */
    public boolean searchOnlineUser(String username)
        throws Exception;

}
