package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.InspectItemDaoI;
import tt.dao.business.InspectSchemeDaoI;
import tt.dao.business.InstitutionDaoI;
import tt.dao.business.ProjectDaoI;
import tt.model.business.InspectScheme;
import tt.service.bussiness.InspectItemServiceI;
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
    @Autowired
    private ProjectDaoI projectDao;
    @Autowired
    private InspectItemDaoI inspectItemDao;
    @Autowired
    private InstitutionDaoI institutionDao;

    @Override
    public InspectScheme get(Integer id,Integer dept_id) {
        return inspectSchemeDao.getById(id,dept_id);
    }

    @Override
    public List<InspectScheme> list( Map<String,Object> params, Integer page, Integer PageSize,Integer dept_id) {
        String name= (String) params.get("name");
        List<InspectScheme> ret = inspectSchemeDao.list(name, page, PageSize,dept_id);
        return ret;
    }

    @Override
    public long count( Map<String,Object> params, Integer dept_id) {
        StringBuilder hql = new StringBuilder("select count(*) from InspectScheme WHERE dept_id=:dept_id");
        String name= (String) params.get("name");
        params.put("dept_id",dept_id);
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        long ret = inspectSchemeDao.count(hql.toString(), params);
        return ret;
    }

    @Override
    public InspectScheme add(InspectScheme inspectScheme, Integer dept_id) {
        resetProject(inspectScheme);
        inspectSchemeDao.save(inspectScheme);
        return inspectScheme;
    }

    @Override
    public int del(List<Integer> ids, Integer dept_id) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("dept_id",dept_id);
        params.put("ids", ids);
        return inspectSchemeDao.executeHql("delete from InspectScheme where id in (:ids) and dept_id=:dept_id", params);
    }

    @Override
    public InspectScheme update(InspectScheme inspectScheme, Integer dept_id) {
        resetProject(inspectScheme);
        inspectScheme.setDept_id(dept_id);
        inspectSchemeDao.update(inspectScheme);
        return inspectScheme;
    }
    private void resetProject(InspectScheme inspectScheme){
        inspectScheme.setProject(projectDao.getById(inspectScheme.getProject().getId()));
        inspectScheme.setInspectItem(inspectItemDao.getById(inspectScheme.getInspectItem().getId()));
        inspectScheme.setInstitution(institutionDao.getById(inspectScheme.getInstitution().getId()));
    }
}
