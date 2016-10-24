package tt.service.bussiness;

import tt.model.business.Overview;
import tt.model.business.Project;

import java.util.List;

/**
 * Created by tt on 2016/10/1.
 */
public interface OverviewServiceI {
    List<Overview> queryOverviews(Integer area_id, Integer dept_id);
}
