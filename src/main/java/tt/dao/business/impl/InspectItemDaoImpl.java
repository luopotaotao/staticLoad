package tt.dao.business.impl;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;
import tt.dao.business.InspectItemDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.InspectItem;

import java.util.List;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("inspectItemDao")
public class InspectItemDaoImpl extends BaseDaoImpl<InspectItem> implements InspectItemDaoI {
    @Override
    public List<InspectItem> list(String name, Integer page, Integer pageSize) {
        Criteria c = getCriteria();
        if(!isEmpty(name)){
            c.add(like("name",name));
        }
        if(page!=null&pageSize!=null){
            c.setFirstResult((page-1)*pageSize);
            c.setMaxResults(pageSize);
        }
        return c.list();
    }

}
