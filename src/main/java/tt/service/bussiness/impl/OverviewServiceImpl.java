package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.OverviewDaoI;
import tt.dao.business.ProjectDaoI;
import tt.model.business.Overview;
import tt.model.business.Project;
import tt.service.bussiness.OverviewServiceI;

import java.util.List;

/**
 * Created by tt on 2016/10/1.
 */
@Service
public class OverviewServiceImpl implements OverviewServiceI {
    @Autowired
    private OverviewDaoI overviewDao;
    @Override
    public List<Overview> queryOverviews(Integer area_id, Integer dept_id) {
        List<Overview> overviews = overviewDao.queryOverview(area_id,dept_id);
        return overviews;
    }
}
