package tt.dao.business.impl;

import org.springframework.stereotype.Repository;
import tt.dao.business.AreaDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.Area;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by tt on 2016/9/29.
 */
@Repository("areaDao")
public class AreaDaoImpl extends BaseDaoImpl<Area> implements AreaDaoI {

    @Override
    public Area load(Integer id, Integer dept_id) {
        return super.getById(id,dept_id);
    }

    @Override
    public int del(Integer id,Integer dept_id) {
        Map<String,Object> params = new HashMap<>();
        params.put("id",id);
        params.put("dept_id",dept_id);
        return executeSql("delete from b_area where (id=:id or pid=:id) and dept_id=:dept_id",params);
    }
}
