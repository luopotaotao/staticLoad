package tt.service.bussiness;

import tt.model.business.Company;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
public interface CompanyServiceI {
    Company get(int id);
    List<Company> list(Byte typ,String name, int page, int PageSize);
    long count(Byte typ,String name);
    int add(Company company);
    int del(List<Integer> ids);
    int update(Company company);
}
