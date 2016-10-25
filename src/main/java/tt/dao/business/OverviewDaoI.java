package tt.dao.business;

import tt.dao.BaseDaoI;
import tt.model.business.Overview;

import java.util.List;

/**
 * Created by tt on 2016/10/1.
 */
public interface OverviewDaoI extends BaseDaoI<Overview> {
    List<Overview> queryOverview(Integer area_id,Integer dept_id);
    List<Overview> queryAll(Integer dept_id);
}
