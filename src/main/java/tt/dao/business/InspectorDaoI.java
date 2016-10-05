package tt.dao.business;

import tt.dao.BaseDaoI;
import tt.model.business.InspectProject;
import tt.model.business.Inspector;

import java.util.List;

/**
 * Created by taotao on 2016/9/23.
 */
public interface InspectorDaoI extends BaseDaoI<Inspector> {
    List<Inspector> list(Integer institution_id,String name,Integer page,Integer pageSize);
}
