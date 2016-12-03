package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.DeptDaoI;
import tt.model.business.Dept;
import tt.service.bussiness.DeptServiceI;

import java.io.Serializable;
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
    public Dept get(Serializable id, Integer dept_id) {
        return deptDao.getById(id);
    }

    @Override
    public List<Dept> list(Map<String,Object> params, Integer page, Integer PageSize, Integer dept_id) {
        StringBuilder hql = new StringBuilder("from Dept WHERE 1=1 ");
//        params.put("dept_id",dept_id);
        Object typ =  params.get("typ");
        Object name =  params.get("name");
        if(typ!=null&&(Byte)typ!=0){
            params.put("typ",typ);
            hql.append(" AND typ=:typ ");
        }
        if(name!=null&&!name.toString().isEmpty()){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        List<Dept> ret = deptDao.find(hql.toString(), params, page, PageSize);
        return ret;
    }

    @Override
    public long count(Map<String,Object> params, Integer dept_id) {
        StringBuilder hql = new StringBuilder("select count(*) from Dept WHERE 1=1 ");
//        params.put("dept_id",dept_id);
        Byte typ = (Byte) params.get("typ");
        Byte name = (Byte) params.get("name");
        if(typ!=null&&typ!=0){
            hql.append(" AND typ=:typ ");
        }
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        long ret = deptDao.count(hql.toString(), params);
        return ret;
    }

    @Override
    public Dept add(Dept dept, Integer dept_id) {
        deptDao.save(dept);
        return dept;
    }

    @Override
    public int del(List<Integer> ids, Integer dept_id) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<String, Object>();
//        params.put("dept_id",dept_id);
        params.put("ids", ids);
        return deptDao.executeHql("delete from Dept where id in (:ids)", params);
    }

    @Override
    public Dept update(Dept dept, Integer dept_id) {
        deptDao.update(dept);
        return dept;
    }

    @Override
    public Dept get(int id) {
        System.out.println("run get");
        return deptDao.get(Dept.class, id);
    }
}
