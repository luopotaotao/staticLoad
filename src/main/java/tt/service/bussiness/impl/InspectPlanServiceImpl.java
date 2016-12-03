package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.*;
import tt.exception.ExistException;
import tt.model.business.InspectMethod;
import tt.model.business.InspectPlan;
import tt.model.business.User;
import tt.service.bussiness.InspectMethodServiceI;
import tt.service.bussiness.InspectPlanServiceI;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by taotao on 2016/9/23.
 */
@Service("inspectPlanService")
public class InspectPlanServiceImpl implements InspectPlanServiceI {
    @Autowired
    private InspectPlanDaoI inspectPlanDao;

    @Autowired
    private InspectMethodDaoI inspectMethodDao;

    @Autowired
    private UserDaoI userDao;

    @Autowired
    private EquipmentDaoI equipmentDao;
    @Override
    public InspectPlan get(Serializable id, Integer dept_id) {
        return inspectPlanDao.getById(id,dept_id);
    }

    @Override
    public List<InspectPlan> list(Map<String,Object> params, Integer page, Integer PageSize, Integer dept_id) {
        String name = (String) params.get("name");
        List<InspectPlan> ret = inspectPlanDao.list(name, page, PageSize,dept_id);
        return ret;
    }

    @Override
    public long count(Map<String,Object> params, Integer dept_id) {
        StringBuilder hql = new StringBuilder("select count(*) from InspectPlan WHERE dept_id=:dept_id");
        params.put("dept_id",dept_id);
        String name = (String) params.get("name");
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        long ret = inspectPlanDao.count(hql.toString(), params);
        return ret;
    }

    @Override
    public InspectPlan add(InspectPlan inspectPlan,Integer dept_id) {
        //TODO 检测是否存在STZH
        boolean isExist = inspectPlanDao.isExistStzh(inspectPlan.getProject().getId(),inspectPlan.getStzh(),dept_id);
        if(isExist){
            throw new ExistException("该工程下已有桩号:"+inspectPlan.getStzh());
        }
        resetProject(inspectPlan);
        inspectPlan.setDept_id(dept_id);
        inspectPlanDao.save(inspectPlan);
        return inspectPlan;
    }

    @Override
    public int del(List<Integer> ids,Integer dept_id) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("ids", ids);
        params.put("dept_id",dept_id);
        return inspectPlanDao.executeHql("delete from InspectPlan where id in (:ids) and dept_id=:dept_id", params);
    }

    @Override
    public InspectPlan update(InspectPlan inspectPlan,Integer dept_id) {
        resetProject(inspectPlan);
        inspectPlan.setDept_id(dept_id);
        inspectPlanDao.update(inspectPlan);
        return inspectPlan;
    }
    private void resetProject(InspectPlan inspectPlan){
//        inspectPlan.setInspectScheme(in.getById(inspectPlan.getProject().getId()));
        inspectPlan.setEquipment(equipmentDao.getById(inspectPlan.getEquipment().getId()));
        if(inspectPlan.getInspectMethods()!=null&&inspectPlan.getInspectMethods().size()>0){
            List<Integer> methodIds = inspectPlan.getInspectMethods().stream().filter(item->item.getId()!=null).map(method->method.getId()).collect(Collectors.toList());
            List<InspectMethod> methods = inspectMethodDao.findByIds(methodIds);
            if(methodIds!=null&&methodIds.size()>0){
                inspectPlan.setInspectMethods(methods);
            }
        }
        if(inspectPlan.getMajorUser()!=null&&inspectPlan.getMajorUser().getId()!=null){
            User user = userDao.getById(inspectPlan.getMajorUser().getId());
            inspectPlan.setMajorUser(user);
        }else{
            inspectPlan.setMajorUser(null);
        }
        if(inspectPlan.getAssistantUser()!=null&&inspectPlan.getAssistantUser().getId()!=null){
            User user = userDao.getById(inspectPlan.getAssistantUser().getId());
            inspectPlan.setAssistantUser(user);
        }else{
            inspectPlan.setAssistantUser(null);
        }
        if(inspectPlan.getUser()!=null&&inspectPlan.getUser().getId()!=null){
            User user = userDao.getById(inspectPlan.getUser().getId());
            inspectPlan.setUser(user);
        }else{
            inspectPlan.setUser(null);
        }
    }
}
