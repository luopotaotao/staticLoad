package tt.dao.business.impl;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;
import tt.dao.business.InspectPlanDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.InspectPlan;

import java.util.List;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("inspectPlanDao")
public class InspectPlanDaoImpl extends BaseDaoImpl<InspectPlan> implements InspectPlanDaoI {
    @Override
    public List<InspectPlan> list(String name, Integer page, Integer pageSize) {
        Criteria c = getCriteria(page,pageSize);
        if(!isEmpty(name)){
            c.add(like("name",name));
        }
        return c.list();
    }
}
