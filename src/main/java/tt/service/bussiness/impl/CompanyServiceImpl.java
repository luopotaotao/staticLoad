package tt.service.bussiness.impl;

import tt.dao.business.CompanyDaoI;
import tt.model.business.Company;
import tt.service.bussiness.CompanyServiceI;
import org.omg.CORBA.Object;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        return null;
    }

    @Override
    public List<Company> list(Map<String, Object> params, int page, int PageSize) {
        return null;
    }

    @Override
    public int count(Map<String, Object> params) {
        return 0;
    }

    @Override
    public int add(Company company) {
        return 0;
    }

    @Override
    public int del(int id) {
        return 0;
    }

    @Override
    public int update(Company company) {
        return 0;
    }
}
