package tt.dao.business.impl;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import tt.dao.business.InspectMethodDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.InspectMethod;

import java.util.List;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("inspectMethodDao")
public class InspectMethodDaoImpl extends BaseDaoImpl<InspectMethod> implements InspectMethodDaoI {
    @Override
    public List<InspectMethod> list(Integer inspect_item_id, String name,Integer dept_id) {
        Criteria c = getCriteria(null,null,dept_id).add(Restrictions.eq("inspect_item_id",inspect_item_id));
        if(!isEmpty(name)){
            c.add(like("name","%"+name+"%"));
        }
        return c.list();
    }

    @Override
    public List<InspectMethod> findByIds(List<Integer> ids) {
        return getCriteria().add(Restrictions.in("id",ids)).list();
    }
}
