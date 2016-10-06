package tt.dao.business;

import tt.dao.BaseDaoI;
import tt.model.business.AreaObj;
import tt.model.business.InspectItem;

import java.util.List;

/**
 * Created by taotao on 2016/9/23.
 */
public interface AreaObjDaoI extends BaseDaoI<AreaObj> {
    AreaObj get(Integer id);
}
