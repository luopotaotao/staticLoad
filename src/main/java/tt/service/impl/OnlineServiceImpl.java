package tt.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tt.dao.OnlineDaoI;
import tt.model.Tonline;
import tt.service.OnlineServiceI;


@Service("onlineService")
public class OnlineServiceImpl implements OnlineServiceI
{
    @Autowired
    private OnlineDaoI onlineDao;

    /**
     * 增加或修改在线用户信息
     * 
     * @param loginname
     *            用户名
     * @param ip
     *            用户ip
     */
    @Override
    public void saveOrUpdateTonlineByLoginNameAndIp(String loginname, String ip)
        throws Exception
    {
        onlineDao.saveOrUpdateTonlineByLoginNameAndIp(loginname, ip);

    }

    /**
     * 通过用户名删除在线用户
     * 
     * @param loginname用户名
     */
    @Override
    public void deleteTonlineByLoginName(String loginname)
        throws Exception
    {
        onlineDao.deleteTonlineByLoginName(loginname);
    }

    /**
     * 清空在线用户表
     */

    @Override
    public void deleteOnline()
        throws Exception
    {
        onlineDao.deleteOnline();
    }

    /**
     * 判断用户是否已经登录
     * 
     * @param username
     *            用户名
     * @return true没有登录/false已经登录
     */
    @Override
    public boolean searchOnlineUser(String username)
        throws Exception
    {
        Tonline t = onlineDao.searchOnlineUser(username);
        return (t == null);
    }

}
