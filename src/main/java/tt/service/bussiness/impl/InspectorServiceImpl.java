//package tt.service.bussiness.impl;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import tt.dao.business.UserDaoI;
//import tt.model.business.User;
//import tt.service.bussiness.UserServiceI;
//
//import java.io.Serializable;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
///**
// * Created by taotao on 2016/9/23.
// */
//@Service("userService")
//public class UserServiceImpl implements UserServiceI {
//    @Autowired
//    private UserDaoI userDao;
//
//    @Override
//    public User get(Serializable id, Integer dept_id) {
//        return userDao.getById(id,dept_id);
//    }
//
//
//    @Override
//    public List<User> list(Map<String,Object> params,Integer page,Integer pageSize, Integer dept_id) {
//        String name = (String) params.get("name");
//        List<User> ret = userDao.list(dept_id, name, null, null,dept_id);
//        return ret;
//    }
//
//    @Override
//    public User add(User user, Integer dept_id) {
//        user.setDept_id(dept_id);
//        userDao.save(user);
//        return user;
//    }
//
//    @Override
//    public int del(List<Integer> ids, Integer dept_id) {
//        if (ids == null || ids.size() < 1) {
//            return 0;
//        }
//        Map<String, Object> params = new HashMap<>();
//        params.put("dept_id",dept_id);
//        params.put("ids", ids);
//        return userDao.executeHql("delete from User where id in (:ids) and dept_id=:dept_id", params);
//    }
//
//    @Override
//    public User update(User user, Integer dept_id) {
//        user.setDept_id(dept_id);
//        userDao.update(user);
//        return user;
//    }
//}
