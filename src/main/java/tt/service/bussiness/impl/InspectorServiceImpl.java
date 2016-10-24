package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.InspectorDaoI;
import tt.model.business.Inspector;
import tt.service.bussiness.InspectorServiceI;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
@Service("inspectorService")
public class InspectorServiceImpl implements InspectorServiceI {
    @Autowired
    private InspectorDaoI inspectorDao;

    @Override
    public Inspector get(Integer id, Integer dept_id) {
        return inspectorDao.getById(id,dept_id);
    }


    @Override
    public List<Inspector> list(Map<String,Object> params,Integer page,Integer pageSize, Integer dept_id) {
        Integer institution_id = (Integer) params.get("institution_id");
        String name = (String) params.get("name");
        List<Inspector> ret = inspectorDao.list(institution_id, name, null, null,dept_id);
        return ret;
    }

    @Override
    public Inspector add(Inspector inspector, Integer dept_id) {
        inspector.setDept_id(dept_id);
        inspectorDao.save(inspector);
        return inspector;
    }

    @Override
    public int del(List<Integer> ids, Integer dept_id) {
        if (ids == null || ids.size() < 1) {
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("dept_id",dept_id);
        params.put("ids", ids);
        return inspectorDao.executeHql("delete from Inspector where id in (:ids) and dept_id=:dept_id", params);
    }

    @Override
    public Inspector update(Inspector inspector, Integer dept_id) {
        inspector.setDept_id(dept_id);
        inspectorDao.update(inspector);
        return inspector;
    }
}
