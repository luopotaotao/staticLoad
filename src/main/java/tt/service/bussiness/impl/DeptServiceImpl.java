package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.DeptDaoI;
import tt.model.business.Dept;
import tt.service.bussiness.DeptServiceI;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
@Service("deptService")
public class DeptServiceImpl implements DeptServiceI {
    @Autowired
    private DeptDaoI deptDao;

    @Override
    public Dept get(int id) {
        System.out.println("run get");
        return deptDao.get(Dept.class, id);
    }

    @Override
    public List<Dept> list(String name, int page, int PageSize) {
        StringBuilder hql = new StringBuilder("from Dept WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        List<Dept> ret = deptDao.find(hql.toString(), params, page, PageSize);
        return ret;
    }

    @Override
    public long count(String name) {
        StringBuilder hql = new StringBuilder("select count(*) from Dept WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        long ret = deptDao.count(hql.toString(), params);
        return ret;
    }

    @Override
    public int add(Dept dept) {
        deptDao.save(dept);
        return 1;
    }

    @Override
    public int del(List<Integer> ids) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("ids", ids);
        return deptDao.executeHql("delete from Dept where id in (:ids)", params);
    }

    @Override
    public int update(Dept dept) {
        deptDao.update(dept);
        return 1;
    }
}
