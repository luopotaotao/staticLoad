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
    public InspectScheme get(int id) {
        return inspectSchemeDao.get(InspectScheme.class, id);
    }

    @Override
    public List<InspectScheme> list(String name, int page, int PageSize) {
        List<InspectScheme> ret = inspectSchemeDao.list(name, page, PageSize);
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
        resetProject(inspectScheme);
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
        resetProject(inspectScheme);
        inspectSchemeDao.update(inspectScheme);
        return 1;
    }
    private void resetProject(InspectScheme inspectScheme){
        inspectScheme.setProject(projectDao.getById(inspectScheme.getProject().getId()));
        inspectScheme.setInspectItem(inspectItemDao.getById(inspectScheme.getInspectItem().getId()));
        inspectScheme.setInstitution(institutionDao.getById(inspectScheme.getInstitution().getId()));
    }
}
