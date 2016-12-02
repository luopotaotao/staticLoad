package tt.service.bussiness;

import tt.model.business.Dept;

/**
 * Created by taotao on 2016/9/23.
 */
public interface DeptServiceI extends BaseService<Dept> {
//    List<Dept> list(Byte typ, String name, int page, int PageSize,Integer dept_id);
//    long count(Byte typ, String name,Integer dept_id);
    //TODO 额外参数
        Dept get(int id);
}
