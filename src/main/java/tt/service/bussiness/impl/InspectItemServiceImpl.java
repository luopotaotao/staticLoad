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
    public InspectItem get(int id) {
        return inspectItemDao.get(InspectItem.class, id);
    }

    @Override
    public List<InspectItem> list(String name, int page, int PageSize) {
        StringBuilder hql = new StringBuilder("from InspectItem WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        List<InspectItem> ret = inspectItemDao.find(hql.toString(), params, page, PageSize);
        return ret;
    }

    @Override
    public long count(String name) {
        StringBuilder hql = new StringBuilder("select count(*) from InspectItem WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        long ret = inspectItemDao.count(hql.toString(), params);
        return ret;
    }

    @Override
    public int add(InspectItem inspectItem) {
        inspectItemDao.save(inspectItem);
        return 1;
    }

    @Override
    public int del(List<Integer> ids) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("ids", ids);
        return inspectItemDao.executeHql("delete from InspectItem where id in (:ids)", params);
    }

    @Override
    public int update(InspectItem inspectItem) {
        inspectItemDao.update(inspectItem);
        return 1;
    }
}
