package tt.dao.business.impl;

import org.bouncycastle.asn1.isismtt.x509.Restriction;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import tt.dao.business.InspectorDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.Inspector;

import java.util.List;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("inspectorDao")
public class InspectorDaoImpl extends BaseDaoImpl<Inspector> implements InspectorDaoI {
    @Override
    public List<Inspector> list(Integer institution_id, String name, Integer page, Integer pageSize) {
        Criteria criteria = getCriteria()
                .add(Restrictions.eq("institution_id",institution_id)).addOrder(Order.asc("id"));
        if(name!=null&&!name.trim().isEmpty()){
            criteria.add(Restrictions.like("name","%"+name+"%"));
        }
//        if(page!=null&&pageSize!=null){
//            criteria.setFirstResult((page-1)*pageSize);
//            criteria.setMaxResults(pageSize);
//        }
        return criteria.list();
    }
}
