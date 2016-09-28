package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.InstitutionDaoI;
import tt.model.business.Institution;
import tt.service.bussiness.InstitutionServiceI;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
@Service("institutionService")
public class InstitutionServiceImpl implements InstitutionServiceI {
    @Autowired
    private InstitutionDaoI institutionDao;

    @Override
    public Institution get(int id) {
        System.out.println("run get");
        return institutionDao.get(Institution.class, id);
    }

    @Override
    public List<Institution> list(Byte typ,String name, int page, int PageSize) {
        StringBuilder hql = new StringBuilder("from Institution WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
        if(typ!=null&&typ!=0){
            params.put("typ",typ);
            hql.append(" AND typ=:typ ");
        }
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        List<Institution> ret = institutionDao.find(hql.toString(), params, page, PageSize);
        return ret;
    }

    @Override
    public long count(Byte typ,String name) {
        StringBuilder hql = new StringBuilder("select count(*) from Institution WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
        if(typ!=null&&typ!=0){
            params.put("typ",typ);
            hql.append(" AND typ=:typ ");
        }
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        long ret = institutionDao.count(hql.toString(), params);
        return ret;
    }

    @Override
    public int add(Institution institution) {
        institutionDao.save(institution);
        return 1;
    }

    @Override
    public int del(List<Integer> ids) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("ids", ids);
        return institutionDao.executeHql("delete from Institution where id in (:ids)", params);
    }

    @Override
    public int update(Institution institution) {
        institutionDao.update(institution);
        return 1;
    }
}
