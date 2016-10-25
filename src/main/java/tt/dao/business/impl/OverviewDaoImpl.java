package tt.dao.business.impl;

import org.springframework.stereotype.Repository;
import tt.dao.business.OverviewDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.Overview;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by tt on 2016/10/1.
 */
@Repository("overViewDao")
public class OverviewDaoImpl extends BaseDaoImpl<Overview> implements OverviewDaoI {

    @Override
    public List<Overview> queryOverview(Integer area_id,Integer dept_id) {
        Map params = new HashMap();
        params.put("area_id",area_id);
        params.put("dept_id",dept_id);
        List<Overview> ret = find("from Overview where id=:area_id and dept_id=:dept_id",params);
        return ret;
    }

    @Override
    public List<Overview> queryAll(Integer dept_id) {
        Map params = new HashMap();
        params.put("dept_id",dept_id);
        List<Overview> ret = find("from Overview where level=0 and dept_id=:dept_id",params);
        return ret;
    }
}
