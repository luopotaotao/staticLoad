//package tt.dao.business.impl;
//
//import org.bouncycastle.asn1.isismtt.x509.Restriction;
//import org.hibernate.Criteria;
//import org.hibernate.criterion.Order;
//import org.hibernate.criterion.Restrictions;
//import org.springframework.stereotype.Repository;
//import tt.dao.business.UserDaoI;
//import tt.dao.impl.BaseDaoImpl;
//import tt.model.business.User;
//
//import java.util.List;
//
///**
// * Created by taotao on 2016/9/23.
// */
//@Repository("userDao")
//public class UserDaoImpl extends BaseDaoImpl<User> implements UserDaoI {
//    @Override
//    public List<User> list( String name, Integer page, Integer pageSize,Integer dept_id) {
//        Criteria criteria = getCriteria(page,pageSize,dept_id)
//                .add(Restrictions.eq("dept_id",dept_id)).addOrder(Order.asc("id"));
//        if(name!=null&&!name.trim().isEmpty()){
//            criteria.add(Restrictions.like("name","%"+name+"%"));
//        }
////        if(page!=null&&pageSize!=null){
////            criteria.setFirstResult((page-1)*pageSize);
////            criteria.setMaxResults(pageSize);
////        }
//        return criteria.list();
//    }
//}
