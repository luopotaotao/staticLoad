package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.UserDaoI;
import tt.model.business.User;
import tt.model.business.Dept;
import tt.service.bussiness.DeptServiceI;
import tt.service.bussiness.UserServiceI;
import tt.util.Encrypt;
import tt.util.PBKDF2;
import tt.util.RandomUtil;

import java.io.Serializable;
import java.security.NoSuchAlgorithmException;
import java.util.*;

/**
 * Created by taotao on 2016/9/23.
 */
@Service("userService")
public class UserServiceImpl implements UserServiceI {
    @Autowired
    private UserDaoI userDao;

    @Autowired
    private DeptServiceI deptService;

    public User get(String id, Integer dept_id) {
        return userDao.getById(id,dept_id);
    }

    @Override
    public User get(Serializable id, Integer dept_id) {
        return null;
    }

    @Override
    public List<User> list(Map<String,Object> params,Integer page,Integer pageSize,Integer dept_id) {
        String name = (String) params.get("name");
        Integer current_role = (Integer) params.get("role");
        List<User> ret = userDao.list(current_role,dept_id, name, null,null);
        return ret;
    }

    @Override
    public User add(User user, Integer dept_id) {
        Dept dept = deptService.get(dept_id);
        user.setDept(dept);
        user.setCreatedatetime(new Date());
        try {
            byte[] salt = PBKDF2.getSalt().getBytes();
            String pwd1 = RandomUtil.generateWord();
            String pwd = PBKDF2.generateStorngPasswordHash256ByBCP(salt, Encrypt.sha(pwd1));
            user.setPwd(pwd);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        userDao.save(user);
        return user;
    }

    @Override
    public int del(List<Integer> ids, Integer dept_id) {
        return 0;
    }

    @Override
    public int del(List<String> ids) {
        if (ids == null || ids.size() < 1) {
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("ids", ids);
        //TODO 校验是否有权限
        return userDao.executeHql("delete from User where id in (:ids)", params);
    }

    @Override
    public boolean isExist(String name) {
        Map<String,Object> params = new HashMap<>();
        params.put("name",name);
        return userDao.count("select count(*) from User as u where u.name=:name",params)>0;
    }

    @Override
    public User update(User user, Integer dept_id) {
        User oldUser = this.get(user.getId(),dept_id);
//        Dept dept = deptService.get(dept_id);
//        user.setDept(dept);
        oldUser.setEmail(user.getEmail());
        oldUser.setRole(user.getRole());
        userDao.update(oldUser);
        return user;
    }
}
