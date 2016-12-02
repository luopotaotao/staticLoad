package tt.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import tt.dao.UserDaoI;
import tt.model.TUser;
import tt.pageModel.User;


@Repository
public class UserDaoImpl extends BaseDaoImpl<TUser> implements UserDaoI
{

    @Override
    public TUser getUser(Integer id)
        throws Exception
    {
        String hql = "select distinct t from TUser t left join fetch t.troles role where t.id = :id";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id", id);
        TUser t = get(hql, params);
        return t;
    }

    @Override
    public void delete(Integer id)
        throws Exception
    {
        TUser t = get(TUser.class, id);
        delete(t);
    }

    @Override
    public List<TUser> getUserList(User user)
        throws Exception
    {
        String hql = " from TUser t ";
        Map<String, Object> params = new HashMap<String, Object>();
        hql += addwhere(user, params);
        hql += orderHql(user);
        List<TUser> ltuser = find(hql, params, user.getPage(), user.getRows());
        return ltuser;
    }

    @Override
    public Long getUserCount(User user)
        throws Exception
    {
        String hql = "select count(*) from TUser t ";
        Map<String, Object> params = new HashMap<String, Object>();
        hql += addwhere(user, params);
        Long userNum = count(hql, params);
        return userNum;
    }

    public TUser getUserByName(String name)
        throws Exception
    {
        String hql = " from TUser t where t.name =:name ";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("name", name);
        TUser t = this.get(hql, params);
        return t;

    }

    private String addwhere(User user, Map<String, Object> params)
    {
        String hql = "";
        if (user != null)
        {
            hql += " where 1=1  ";
            if (user.getName() != null)
            {
                hql += " and t.name like :name";
                params.put("name", "%%" + ConvertParam(user.getName()) + "%%");
            }
            if (user.getCreatedatetimeStart() != null)
            {
                hql += " and t.createdatetime >= :createdatetimeStart";
                params.put("createdatetimeStart", user.getCreatedatetimeStart());
            }
            if (user.getCreatedatetimeEnd() != null)
            {
                hql += " and t.createdatetime <= :createdatetimeEnd";
                params.put("createdatetimeEnd", user.getCreatedatetimeEnd());
            }
        }
        return hql;
    }
}
