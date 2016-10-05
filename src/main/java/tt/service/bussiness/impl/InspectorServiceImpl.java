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
    public Inspector get(int id) {
        return inspectorDao.get(Inspector.class, id);
    }


    @Override
    public List<Inspector> list(Integer institution_id, String name) {
        List<Inspector> ret = inspectorDao.list(institution_id, name, null, null);
        return ret;
    }

    @Override
    public int add(Inspector inspector) {
        inspectorDao.save(inspector);
        return 1;
    }

    @Override
    public int del(List<Integer> ids) {
        if (ids == null || ids.size() < 1) {
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("ids", ids);
        return inspectorDao.executeHql("delete from Inspector where id in (:ids)", params);
    }

    @Override
    public int update(Inspector inspector) {
        inspectorDao.update(inspector);
        return 1;
    }
}
