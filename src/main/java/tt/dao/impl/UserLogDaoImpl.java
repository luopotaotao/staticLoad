package tt.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tt.dao.UserLogDaoI;
import tt.model.Tuserlog;
import tt.pageModel.Userlog;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Repository;


@Repository
public class UserLogDaoImpl extends BaseDaoImpl<Tuserlog> implements UserLogDaoI
{

    @Override
    public List<Tuserlog> datagrid(Userlog userlog, String name)
        throws Exception
    {
        String Hql = " from Tuserlog t";
        Map<String, Object> params = new HashMap<String, Object>();
        Hql += addwhere(userlog, params, name);
        Hql += this.orderHql(userlog);
        List<Tuserlog> ltuserlog = this.find(Hql, params, userlog.getPage(), userlog.getRows());
        return ltuserlog;
    }

    @Override
    public Long getUserlogCount(Userlog userlog, String name)
        throws Exception
    {
        String hql = "select count(*) from Tuserlog t ";
        Map<String, Object> params = new HashMap<String, Object>();
        hql += addwhere(userlog, params, name);
        return this.count(hql, params);
    }

    private String addwhere(Userlog userlog, Map<String, Object> params, String adminName)
    {
        String hql = " where 1=1 ";

        if (userlog != null)
        {
            if (userlog.getAdminName() != null && !"".equals(userlog.getAdminName()))
            {
                if (!"全部".equals(userlog.getAdminName()))
                {
                    hql += " and t.adminName = :adminName";
                    params.put("adminName", userlog.getAdminName());
                }

            }
            else
            {
                hql += " and t.adminName <> :adminName";
                params.put("adminName", adminName);
            }

            if (userlog.getCreateTimeStart() != null)
            {
                hql += " and t.createTime >= :createTimeStart";
                params.put("createTimeStart", userlog.getCreateTimeStart());

            }
            if (userlog.getCreateTimeEnd() != null)
            {
                hql += "  and t.createTime <= :createTimeEnd";
                params.put("createTimeEnd", userlog.getCreateTimeEnd());

            }
        }
        return hql;
    }

    @Override
    public Tuserlog getUserLog(String id)
        throws Exception
    {
        Tuserlog t = this.get(Tuserlog.class, id);
        return t;
    }

    @Override
    public List<Tuserlog> combobox(Userlog userlog)
        throws Exception
    {
        String hql = "select distinct new Tuserlog(adminName) from Tuserlog t";
        List<Tuserlog> l = this.find(hql);
        return l;
    }

    @Override
    public void addUserlog(Userlog userlog)
        throws Exception
    {
        Tuserlog tuserlog = new Tuserlog();
        BeanUtils.copyProperties(userlog, tuserlog);
        tuserlog.setFormContent(userlog.getFormContentStr());
        this.save(tuserlog);
    }

}
