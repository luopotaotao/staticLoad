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
    public Company get(int id) {
        System.out.println("run get");
        return companyDao.get(Company.class, id);
    }

    @Override
    public List<Company> list(Byte typ,String name, int page, int PageSize) {
        StringBuilder hql = new StringBuilder("from Company WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
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
    public long count(Byte typ,String name) {
        StringBuilder hql = new StringBuilder("select count(*) from Company WHERE 1=1");
        Map<String,Object> params = new HashMap<>();
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
    public int add(Company company) {
        companyDao.save(company);
        return 1;
    }

    @Override
    public int del(List<Integer> ids) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("ids", ids);
        return companyDao.executeHql("delete from Company where id in (:ids)", params);
    }

    @Override
    public int update(Company company) {
        companyDao.update(company);
        return 1;
    }
}
