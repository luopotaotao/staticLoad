package tt.dao.impl;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tt.dao.SystemConfigDaoI;
import tt.model.TSystemConfig;
import tt.pageModel.SystemConfig;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Repository;


@Repository
public class SystemConfigDaoImpl extends BaseDaoImpl<TSystemConfig> implements SystemConfigDaoI
{
    @Override
    public List<TSystemConfig> datagrid(SystemConfig s)
        throws Exception
    {
        String hql = "from TSystemConfig t ";
        Map<String, Object> params = new HashMap<String, Object>();
        hql += addWhere(s, params);
        hql += this.orderHql(s);
        List<TSystemConfig> l = this.find(hql, params, s.getPage(), s.getRows());
        return l;
    }

    @Override
    public long getSystemConfigCount(SystemConfig b)
        throws Exception
    {
        String hql = " select count(*) from TSystemConfig t";
        Map<String, Object> params = new HashMap<String, Object>();
        hql += addWhere(b, params);
        return this.count(hql, params);
    }

    private String addWhere(SystemConfig s, Map<String, Object> params)
    {
        String hql = " where 1 = 1";
        if (s.getConfName() != null && !s.getConfName().trim().equals(""))
        {
            hql += " and t.confName like :confName";
            params.put("confName", "%" + ConvertParam(s.getConfName()) + "%");
        }
        return hql;
    }

    @Override
    public void add(SystemConfig s)
        throws Exception
    {
        TSystemConfig t = new TSystemConfig();
        BeanUtils.copyProperties(s, t);
        Date date = new Date();
        t.setUpdateTime(date);
        t.setDataVerFalg((short)(1));
        this.save(t);
    }

    @Override
    public void edit(SystemConfig s)
        throws Exception
    {
        TSystemConfig t = this.get(TSystemConfig.class, s.getConfId());
        if (t != null)
        {
            t.setConfContext(s.getConfContext());
            t.setAdminName(s.getAdminName());
            t.setDataVerFalg((short)(s.getDataVerFalg() + 1));
        }
    }

    @Override
    public void delete(String id)
        throws Exception
    {
        TSystemConfig t = this.get(TSystemConfig.class, id);
        if (t != null)
        {
            this.delete(t);
        }
    }

    @Override
    public TSystemConfig getSystemConfig(String id)
        throws Exception
    {
        TSystemConfig t = this.get(TSystemConfig.class, id);
        return t;
    }

    @Override
    public List<TSystemConfig> listSystemConfig()
        throws Exception
    {
        String hql = "from TSystemConfig t ";
        List<TSystemConfig> l = this.find(hql);
        return l;
    }
}
