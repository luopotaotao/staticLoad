package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.InspectProjectDaoI;
import tt.model.business.InspectProject;
import tt.service.bussiness.InspectProjectServiceI;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
@Service("inspectProjectService")
public class InspectProjectServiceImpl implements InspectProjectServiceI {
    @Autowired
    private InspectProjectDaoI inspectProjectDao;

    @Override
    public InspectProject get(int id) {
        return inspectProjectDao.get(InspectProject.class, id);
    }

    @Override
    public List<InspectProject> list(String name, int page, int PageSize) {
        StringBuilder hql = new StringBuilder("from InspectProject WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        List<InspectProject> ret = inspectProjectDao.find(hql.toString(), params, page, PageSize);
        return ret;
    }

    @Override
    public long count(String name) {
        StringBuilder hql = new StringBuilder("select count(*) from InspectProject WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        long ret = inspectProjectDao.count(hql.toString(), params);
        return ret;
    }

    @Override
    public int add(InspectProject inspectProject) {
        inspectProjectDao.save(inspectProject);
        return 1;
    }

    @Override
    public int del(List<Integer> ids) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("ids", ids);
        return inspectProjectDao.executeHql("delete from InspectProject where id in (:ids)", params);
    }

    @Override
    public int update(InspectProject inspectProject) {
        inspectProjectDao.update(inspectProject);
        return 1;
    }
}
