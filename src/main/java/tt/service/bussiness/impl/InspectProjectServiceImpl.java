package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.InspectProjectDaoI;
import tt.model.business.InspectProject;
import tt.service.bussiness.InspectProjectServiceI;

import java.io.Serializable;
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
    public InspectProject get(Serializable id, Integer dept_id) {
        return inspectProjectDao.getById(id,dept_id);
    }

    @Override
    public List<InspectProject> list(Map<String,Object> params, Integer page, Integer PageSize, Integer dept_id) {
        StringBuilder hql = new StringBuilder("from InspectProject WHERE and dept_id=:dept_id");
        params.put("dept_id",dept_id);
        String name = (String) params.get("name");
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }

        List<InspectProject> ret = inspectProjectDao.find(hql.toString(), params, page, PageSize);
        return ret;
    }

    @Override
    public long count( Map<String,Object> params, Integer dept_id) {
        StringBuilder hql = new StringBuilder("select count(*) from InspectProject WHERE and dept_id=:dept_id");
        params.put("dept_id",dept_id);
        String name = (String) params.get("name");
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        long ret = inspectProjectDao.count(hql.toString(), params);
        return ret;
    }

    @Override
    public InspectProject add(InspectProject inspectProject, Integer dept_id) {
        inspectProject.setDept_id(dept_id);
        inspectProjectDao.save(inspectProject);
        return inspectProject;
    }

    @Override
    public int del(List<Integer> ids, Integer dept_id) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("ids", ids);
        params.put("dept_id",dept_id);
        return inspectProjectDao.executeHql("delete from InspectProject where id in (:ids) and dept_id=:dept_id", params);
    }

    @Override
    public InspectProject update(InspectProject inspectProject, Integer dept_id) {
        inspectProject.setDept_id(dept_id);
        inspectProjectDao.update(inspectProject);
        return inspectProject;
    }
}
