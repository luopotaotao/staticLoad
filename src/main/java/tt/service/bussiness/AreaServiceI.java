package tt.service.bussiness;

import tt.model.business.Area;

import java.util.List;
import java.util.Map;

/**
 * Created by tt on 2016/9/29.
 */
public interface AreaServiceI extends BaseService<Area>{
    int del(Integer id,Integer dept_id);
    List<Map<String,Object>> queryAreaByPid(Integer pid,Integer dept_id);
}
