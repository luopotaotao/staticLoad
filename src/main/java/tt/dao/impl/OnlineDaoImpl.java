package tt.dao.impl;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Repository;

import tt.dao.OnlineDaoI;
import tt.model.Tonline;


@Repository("onlineDao")
public class OnlineDaoImpl extends BaseDaoImpl<Tonline> implements OnlineDaoI
{
    /**
     * 增加或修改在线用户信息
     * 
     * @param loginname
     *            用户名
     * @param ip
     *            用户登录ip
     */
    @Override
    public void saveOrUpdateTonlineByLoginNameAndIp(String loginname, String ip)
        throws Exception
    {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("ip", ip);
        params.put("loginname", loginname);
        Tonline o = this.get("from Tonline where ip =:ip and loginname =:loginname", params);
        if (o != null)
        {
            o.setLogindatetime(new Date());
        }
        else
        {
            Tonline t = new Tonline();
            t.setId(UUID.randomUUID().toString());
            t.setIp(ip);
            t.setLoginname(loginname);
            t.setLogindatetime(new Date());
            this.save(t);
        }
    }

    /**
     * 通过用户名删除在线用户
     * 
     * @param loginname
     *            用户名
     */

    @Override
    public void deleteTonlineByLoginName(String loginname)
        throws Exception
    {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("loginname", loginname);
        Tonline t = this.get("from Tonline where loginname =:loginname", params);
        if (t != null)
        {
            this.delete(t);
        }

    }

    /**
     * 清空在线用户表
     */
    @Override
    public void deleteOnline()
        throws Exception
    {
        this.executeHql("delete Tonline t");
    }

    /**
     * 查询用户是否在线
     * 
     * @param username
     *            用户名
     * @return t <Tonline>
     */

    @Override
    public Tonline searchOnlineUser(String username)
        throws Exception
    {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("loginName", username);
        Tonline t = this.get("from Tonline t where t.loginname = :loginName", params);
        return t;
    }

}
