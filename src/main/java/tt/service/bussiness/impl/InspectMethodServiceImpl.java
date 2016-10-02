package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.InspectMethodDaoI;
import tt.model.business.InspectMethod;
import tt.service.bussiness.InspectMethodServiceI;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
@Service("inspectMethodService")
public class InspectMethodServiceImpl implements InspectMethodServiceI {
    @Autowired
    private InspectMethodDaoI inspectMethodDao;

    @Override
    public InspectMethod get(int id) {
        return inspectMethodDao.get(InspectMethod.class, id);
    }

    @Override
    public List<InspectMethod> list(String name, int page, int PageSize) {
        StringBuilder hql = new StringBuilder("from InspectMethod WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        List<InspectMethod> ret = inspectMethodDao.find(hql.toString(), params, page, PageSize);
        return ret;
    }

    @Override
    public long count(String name) {
        StringBuilder hql = new StringBuilder("select count(*) from InspectMethod WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        long ret = inspectMethodDao.count(hql.toString(), params);
        return ret;
    }

    @Override
    public int add(InspectMethod inspectMethod) {
        inspectMethodDao.save(inspectMethod);
        return 1;
    }

    @Override
    public int del(List<Integer> ids) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("ids", ids);
        return inspectMethodDao.executeHql("delete from InspectMethod where id in (:ids)", params);
    }

    @Override
    public int update(InspectMethod inspectMethod) {
        inspectMethodDao.update(inspectMethod);
        return 1;
    }
}
