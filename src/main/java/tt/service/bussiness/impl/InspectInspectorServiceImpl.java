package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.InspectInspectorDaoI;
import tt.model.business.Inspector;
import tt.service.bussiness.InspectInspectorServiceI;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
@Service("inspectInspectorService")
public class InspectInspectorServiceImpl implements InspectInspectorServiceI {
    @Autowired
    private InspectInspectorDaoI inspectorDao;

    @Override
    public Inspector get(int id) {
        return inspectorDao.get(Inspector.class, id);
    }

    @Override
    public List<Inspector> list(String name, int page, int PageSize) {
        StringBuilder hql = new StringBuilder("from Inspector WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        List<Inspector> ret = inspectorDao.find(hql.toString(), params, page, PageSize);
        return ret;
    }

    @Override
    public long count(String name) {
        StringBuilder hql = new StringBuilder("select count(*) from Inspector WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        long ret = inspectorDao.count(hql.toString(), params);
        return ret;
    }

    @Override
    public int add(Inspector inspector) {
        inspectorDao.save(inspector);
        return 1;
    }

    @Override
    public int del(List<Integer> ids) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("ids", ids);
        return inspectorDao.executeHql("delete from Inspector where id in (:ids)", params);
    }

    @Override
    public int update(Inspector inspector) {
        inspectorDao.update(inspector);
        return 1;
    }
}
