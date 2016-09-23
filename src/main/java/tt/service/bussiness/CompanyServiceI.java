package tt.service.bussiness;

import tt.model.business.Company;
import org.omg.CORBA.Object;

import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
public interface CompanyServiceI {
    Company get(int id);
    List<Company> list(Map<String, Object> params, int page, int PageSize);
    int count(Map<String, Object> params);
    int add(Company company);
    int del(int id);
    int update(Company company);
}
