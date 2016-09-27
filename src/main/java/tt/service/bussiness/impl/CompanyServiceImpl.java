package tt.service.bussiness.impl;

import tt.dao.business.CompanyDaoI;
import tt.model.business.Company;
import tt.service.bussiness.CompanyServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        return companyDao.get(Company.class, id);
    }

    @Override
    public List<Company> list(Map<String, Object> params, int page, int PageSize) {
        String hql = "from Company where typ in (:typ)";
        List<Company> ret = companyDao.find(hql, params, page, PageSize);
        return ret;
    }

    @Override
    public long count(Map<String, Object> params) {
        String sql = "select count(*) from Company where typ=:typ";
        long ret = companyDao.count(sql, params);
        return ret;
    }

    @Override
    public int add(Company company) {
        companyDao.save(company);
        return 1;
    }

    @Override
    public int del(int[] ids) {
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
