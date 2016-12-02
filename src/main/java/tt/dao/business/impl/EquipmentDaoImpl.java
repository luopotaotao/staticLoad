package tt.dao.business.impl;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import tt.dao.business.EquipmentDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.Equipment;

import java.util.List;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("equipmentDao")
public class EquipmentDaoImpl extends BaseDaoImpl<Equipment> implements EquipmentDaoI {
    @Override
    public List<Equipment> list(Integer institution_id, String name,Integer dept_id) {
        Criteria criteria = getCriteria(null,null,dept_id)
                .add(Restrictions.eq("institution_id",institution_id)).addOrder(Order.asc("id"));
        if(name!=null&&!name.trim().isEmpty()){
            criteria.add(like("name",name));
        }
//        if(page!=null&&pageSize!=null){
//            criteria.setFirstResult((page-1)*pageSize);
//            criteria.setMaxResults(pageSize);
//        }
        return criteria.list();
    }

    @Override
    public Equipment loadByCode(String code) {
        return (Equipment) getCriteria().add(Restrictions.eq("code",code)).uniqueResult();
    }
}
