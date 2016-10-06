package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.InspectItemDaoI;
import tt.dao.business.InspectPlanDaoI;
import tt.dao.business.ProjectDaoI;
import tt.model.business.InspectPlan;
import tt.service.bussiness.InspectPlanServiceI;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
@Service("inspectPlanService")
public class InspectPlanServiceImpl implements InspectPlanServiceI {
    @Autowired
    private InspectPlanDaoI inspectPlanDao;
    @Autowired
    private ProjectDaoI projectDao;
    @Autowired
    private InspectItemDaoI inspectItemDao;

    @Override
    public InspectPlan get(int id) {
        return inspectPlanDao.get(InspectPlan.class, id);
    }

    @Override
    public List<InspectPlan> list(String name, int page, int PageSize) {
        List<InspectPlan> ret = inspectPlanDao.list(name, page, PageSize);
        return ret;
    }

    @Override
    public long count(String name) {
        StringBuilder hql = new StringBuilder("select count(*) from InspectPlan WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        long ret = inspectPlanDao.count(hql.toString(), params);
        return ret;
    }

    @Override
    public int add(InspectPlan inspectPlan) {
        resetProject(inspectPlan);
        inspectPlanDao.save(inspectPlan);
        return 1;
    }

    @Override
    public int del(List<Integer> ids) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("ids", ids);
        return inspectPlanDao.executeHql("delete from InspectPlan where id in (:ids)", params);
    }

    @Override
    public int update(InspectPlan inspectPlan) {
        resetProject(inspectPlan);
        inspectPlanDao.update(inspectPlan);
        return 1;
    }
    private void resetProject(InspectPlan inspectPlan){
//        inspectPlan.setProject(projectDao.getById(inspectPlan.getProject().getId()));
//        inspectPlan.setInspectItem(inspectItemDao.getById(inspectPlan.getInspectItem().getId()));
    }
}
