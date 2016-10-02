package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.InspectSchemeDaoI;
import tt.model.business.InspectScheme;
import tt.service.bussiness.InspectSchemeServiceI;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
@Service("inspectSchemeService")
public class InspectSchemeServiceImpl implements InspectSchemeServiceI {
    @Autowired
    private InspectSchemeDaoI inspectSchemeDao;

    @Override
    public InspectScheme get(int id) {
        return inspectSchemeDao.get(InspectScheme.class, id);
    }

    @Override
    public List<InspectScheme> list(String name, int page, int PageSize) {
        StringBuilder hql = new StringBuilder("from InspectScheme WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        List<InspectScheme> ret = inspectSchemeDao.find(hql.toString(), params, page, PageSize);
        return ret;
    }

    @Override
    public long count(String name) {
        StringBuilder hql = new StringBuilder("select count(*) from InspectScheme WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        long ret = inspectSchemeDao.count(hql.toString(), params);
        return ret;
    }

    @Override
    public int add(InspectScheme inspectScheme) {
        inspectSchemeDao.save(inspectScheme);
        return 1;
    }

    @Override
    public int del(List<Integer> ids) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("ids", ids);
        return inspectSchemeDao.executeHql("delete from InspectScheme where id in (:ids)", params);
    }

    @Override
    public int update(InspectScheme inspectScheme) {
        inspectSchemeDao.update(inspectScheme);
        return 1;
    }
}
