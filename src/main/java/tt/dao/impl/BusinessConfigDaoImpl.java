package tt.dao.impl;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tt.dao.BusinessConfigDaoI;
import tt.model.TBusinessConfig;
import tt.pageModel.BusinessConfig;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Repository;


@Repository
public class BusinessConfigDaoImpl extends BaseDaoImpl<TBusinessConfig> implements BusinessConfigDaoI
{
    @Override
    public List<TBusinessConfig> datagrid(BusinessConfig b)
        throws Exception
    {
        String hql = "from TBusinessConfig t ";
        Map<String, Object> params = new HashMap<String, Object>();
        hql += addWhere(b, params);
        hql += this.orderHql(b);
        List<TBusinessConfig> l = this.find(hql, params, b.getPage(), b.getRows());
        return l;
    }

    @Override
    public long getBusinessConfigCount(BusinessConfig b)
        throws Exception
    {
        String hql = " select count(*) from TBusinessConfig t";
        Map<String, Object> params = new HashMap<String, Object>();
        hql += addWhere(b, params);
        return this.count(hql, params);
    }

    private String addWhere(BusinessConfig c, Map<String, Object> params)
    {
        String hql = " where 1 = 1";
        if (c.getConfName() != null && !c.getConfName().trim().equals(""))
        {
            hql += " and t.confName like :confName";
            params.put("confName", "%" + ConvertParam(c.getConfName()) + "%");
        }
        return hql;
    }

    @Override
    public void add(BusinessConfig b)
        throws Exception
    {
        TBusinessConfig t = new TBusinessConfig();
        BeanUtils.copyProperties(b, t);
        Date date = new Date();
        t.setUpdateTime(date);
        t.setDataVerFalg((short)1);
        this.save(t);
    }

    @Override
    public void edit(BusinessConfig b)
        throws Exception
    {
        TBusinessConfig t = this.get(TBusinessConfig.class, b.getConfId());
        if (t != null)
        {
            t.setConfContext(b.getConfContext());
            t.setAdminName(b.getAdminName());
            t.setDataVerFalg((short)(b.getDataVerFalg() + 1));
        }
    }

    @Override
    public void delete(String id)
        throws Exception
    {
        TBusinessConfig t = this.get(TBusinessConfig.class, id);
        if (t != null)
        {
            this.delete(t);
        }
    }

    @Override
    public TBusinessConfig getBusinessConfig(String id)
        throws Exception
    {
        TBusinessConfig t = this.get(TBusinessConfig.class, id);
        return t;
    }

    @Override
    public List<TBusinessConfig> listBusinessConfig()
        throws Exception
    {
        String hql = "from TBusinessConfig t ";
        List<TBusinessConfig> l = this.find(hql);
        return l;
    }
}
