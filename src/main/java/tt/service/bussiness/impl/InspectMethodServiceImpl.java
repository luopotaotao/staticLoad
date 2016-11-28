package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.InspectMethodDaoI;
import tt.model.business.InspectMethod;
import tt.service.bussiness.InspectMethodServiceI;

import java.io.Serializable;
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
    public InspectMethod get(Serializable id, Integer dept_id) {
        return inspectMethodDao.getById(id,dept_id);
    }

    @Override
    public List<InspectMethod> list(Map<String,Object> params,Integer page,Integer pageSize, Integer dept_id) {
        Integer inspect_item_id = (Integer) params.get("inspect_item_id");
        String name = (String) params.get("name");
        List<InspectMethod> ret = inspectMethodDao.list(inspect_item_id,name,dept_id);
        return ret;
    }

    @Override
    public InspectMethod add(InspectMethod inspectMethod, Integer dept_id) {
        inspectMethod.setDept_id(dept_id);
        inspectMethodDao.save(inspectMethod);
        return inspectMethod;
    }

    @Override
    public int del(List<Integer> ids, Integer dept_id) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("dept_id",dept_id);
        params.put("ids", ids);
        return inspectMethodDao.executeHql("delete from InspectMethod where id in (:ids) and dept_id=:dept_id", params);
    }

    @Override
    public InspectMethod update(InspectMethod inspectMethod, Integer dept_id) {
        inspectMethod.setDept_id(dept_id);
        inspectMethodDao.update(inspectMethod);
        return inspectMethod;
    }
}
