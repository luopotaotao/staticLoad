package tt.service.bussiness;

import tt.model.business.Company;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
public interface CompanyServiceI {
    Company get(int id);
    List<Company> list(Map<String, Object> params, int page, int PageSize);
    long count(Map<String, Object> params);
    int add(Company company);
    int del(int[] ids);
    int update(Company company);
}
