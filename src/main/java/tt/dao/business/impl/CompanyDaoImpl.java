package tt.dao.business.impl;

import tt.dao.business.CompanyDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.Company;
import org.springframework.stereotype.Repository;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("companyDao")
public class CompanyDaoImpl extends BaseDaoImpl<Company> implements CompanyDaoI {
    @Override
    public Company get(Integer id) {
        return super.getById(id);
    }
}
