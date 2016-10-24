package tt.dao.business;

import tt.dao.BaseDaoI;
import tt.model.business.InspectMethod;

import java.util.List;

/**
 * Created by taotao on 2016/9/23.
 */
public interface InspectMethodDaoI extends BaseDaoI<InspectMethod> {
    List<InspectMethod> list(Integer inspect_item_id,String name,Integer dept_id);
}
