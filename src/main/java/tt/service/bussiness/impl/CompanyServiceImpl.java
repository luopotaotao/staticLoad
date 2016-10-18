package tt.service.bussiness.impl;

import com.alibaba.fastjson.JSONObject;
import tt.dao.business.CompanyDaoI;
import tt.model.business.Company;
import tt.service.bussiness.CompanyServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
@Service("companyService")
public class CompanyServiceImpl implements CompanyServiceI {
    @Autowired
    private CompanyDaoI companyDao;

    @Override
    public Company get(Integer id, Integer dept_id) {
        return companyDao.getById(id,dept_id);
    }

    @Override
    public List<Company> list(Map<String,Object> params, Integer page, Integer PageSize, Integer dept_id) {
        params.put("dept_id",dept_id);
        Byte typ = (Byte) params.get("typ");
        Byte name = (Byte) params.get("name");
        StringBuilder hql = new StringBuilder("from Company WHERE dept_id=:dept_id");
        if(typ!=null&&typ!=0){
            params.put("typ",typ);
            hql.append(" AND typ=:typ ");
        }
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        List<Company> ret = companyDao.find(hql.toString(), params, page, PageSize);
        return ret;
    }

    @Override
    public long count(Map<String,Object> params, Integer dept_id) {
        StringBuilder hql = new StringBuilder("select count(*) from Company WHERE dept_id=:dept_id");
        Byte typ = (Byte) params.get("typ");
        Byte name = (Byte) params.get("name");
        params.put("dept_id",dept_id);
        if(typ!=null&&typ!=0){
            params.put("typ",typ);
            hql.append(" AND typ=:typ ");
        }
        if(name!=null){
            params.put("name","%"+name+"%");
            hql.append(" AND name like :name ");
        }
        long ret = companyDao.count(hql.toString(), params);
        return ret;
    }

    @Override
    public Company add(Company company, Integer dept_id) {
        company.setDept_id(dept_id);
        companyDao.save(company);
        return company;
    }

    @Override
    public int del(List<Integer> ids, Integer dept_id) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("ids", ids);
        params.put("dept_id",dept_id);
        return companyDao.executeHql("delete from Company where id in (:ids) and dept_id=:dept_id", params);
    }

    @Override
    public Company update(Company company, Integer dept_id) {
        company.setDept_id(dept_id);
        companyDao.update(company);
        return company;
    }
}
