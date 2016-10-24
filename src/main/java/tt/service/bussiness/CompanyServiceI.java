package tt.service.bussiness;

import tt.model.business.Company;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
public interface CompanyServiceI extends BaseService<Company> {
//    List<Company> list(Byte typ,String name, int page, int PageSize,Integer dept_id);
//    long count(Byte typ,String name,Integer dept_id);
    //TODO 额外参数
    int del(List<Integer> ids,Integer dept_id);
}
