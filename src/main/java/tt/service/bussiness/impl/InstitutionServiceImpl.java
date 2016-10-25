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
    public Institution get(Integer id, Integer dept_id) {
        return institutionDao.getById(id,dept_id);
    }

    @Override
    public List<Institution> list(Map<String,Object> params, Integer page, Integer PageSize, Integer dept_id) {
        StringBuilder hql = new StringBuilder("from Institution WHERE dept_id=:dept_id");
        params.put("dept_id",dept_id);
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
        List<Institution> ret = institutionDao.find(hql.toString(), params, page, PageSize);
        return ret;
    }

    @Override
    public long count(Map<String,Object> params, Integer dept_id) {
        StringBuilder hql = new StringBuilder("select count(*) from Institution WHERE dept_id=:dept_id");
        params.put("dept_id",dept_id);
        Byte typ = (Byte) params.get("typ");
        Byte name = (Byte) params.get("name");
        if(typ!=null&&typ!=0){
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
    public Institution add(Institution institution, Integer dept_id) {
        institution.setDept_id(dept_id);
        institutionDao.save(institution);
        return institution;
    }

    @Override
    public int del(List<Integer> ids, Integer dept_id) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("dept_id",dept_id);
        params.put("ids", ids);
        return institutionDao.executeHql("delete from Institution where id in (:ids) and dept_id=:dept_id", params);
    }

    @Override
    public Institution update(Institution institution, Integer dept_id) {
        institution.setDept_id(dept_id);
        institutionDao.update(institution);
        return institution;
    }
}
