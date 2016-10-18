package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.InspectItemDaoI;
import tt.model.business.InspectItem;
import tt.service.bussiness.InspectItemServiceI;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
@Service("inspectItemService")
public class InspectItemServiceImpl implements InspectItemServiceI {
    @Autowired
    private InspectItemDaoI inspectItemDao;

    @Override
    public InspectItem get(Integer id, Integer dept_id) {
        return inspectItemDao.getById(id,dept_id);
    }

    @Override
    public List<InspectItem> list(Map<String,Object> params, Integer page, Integer PageSize, Integer dept_id) {
        String name = (String) params.get("name");
        List<InspectItem> ret = inspectItemDao.list(name, page, PageSize,dept_id);
        return ret;
    }
    @Override
    public long count(Map<String,Object> params, Integer dept_id) {
        StringBuilder hql = new StringBuilder("select count(*) from InspectItem WHERE and dept_id=:dept_id");
        params.put("dept_id",dept_id);
        String name = (String) params.get("name");
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        long ret = inspectItemDao.count(hql.toString(), params);
        return ret;
    }

    @Override
    public InspectItem add(InspectItem inspectItem, Integer dept_id) {
        inspectItem.setDept_id(dept_id);
        inspectItemDao.save(inspectItem);
        return inspectItem;
    }

    @Override
    public int del(List<Integer> ids, Integer dept_id) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("dept_id",dept_id);
        params.put("ids", ids);
        return inspectItemDao.executeHql("delete from InspectItem where id in (:ids) and dept_id=:dept_id", params);
    }

    @Override
    public InspectItem update(InspectItem inspectItem, Integer dept_id) {
        inspectItem.setDept_id(dept_id);
        inspectItemDao.update(inspectItem);
        return inspectItem;
    }
}
