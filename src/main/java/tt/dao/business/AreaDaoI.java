package tt.dao.business;

import tt.dao.BaseDaoI;
import tt.model.business.Area;

/**
 * Created by tt on 2016/9/29.
 */
public interface AreaDaoI extends BaseDaoI<Area>{
    Area load(Integer id,Integer dept_id);
//
//    int add(Area area);
//
//    int update(Area area);
//
//
//    int del(Integer id);
}
