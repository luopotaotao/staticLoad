//package tt.service.bussiness.impl;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import tt.dao.business.DeptDaoI_;
//import tt.model.business.Dept;
//import tt.service.bussiness.DeptServiceI_;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
///**
// * Created by taotao on 2016/9/23.
// */
//@Service("deptService")
//public class DeptServiceImpl_ implements DeptServiceI_ {
//    @Autowired
//    private DeptDaoI_ deptDao;
//
//    @Override
//    public Dept get(int id) {
//        System.out.println("run get");
//        return deptDao.get(Dept.class, id);
//    }
//
//    @Override
//    public List<Dept> list(String name, Integer page, Integer PageSize) {
//        Map<String,Object> params = new HashMap<>();
//        List<Dept> ret = null;
//        if(name!=null){
//            params.put(":like_name",name);
//        }
//        if(page!=null&&PageSize!=null){
//            ret =deptDao.find(params, page, PageSize);
//        }else{
//            ret =deptDao.find(params);
//        }
//        return ret;
//    }
//
//    @Override
//    public long count(String name) {
//        StringBuilder hql = new StringBuilder("select count(*) from Dept WHERE 1=1");
//        Map<String,Object> params = new HashMap<>();
//        if(name!=null){
//            params.put("name","%"+name+"%");
//            hql.append(" AND name like :name ");
//        }
//        long ret = deptDao.count(hql.toString(), params);
//        return ret;
//    }
//
//    @Override
//    public int add(Dept dept) {
//        deptDao.save(dept);
//        return dept.getId()>0?1:0;
//    }
//
//    @Override
//    public int del(List<Integer> ids) {
//        if(ids==null||ids.size()<1){
//            return 0;
//        }
//        Map<String, Object> params = new HashMap<String, Object>();
//        params.put("id", ids);
//        return deptDao.logicDelete("b_dept", params);
//    }
//
//    @Override
//    public int update(Dept dept) {
//        deptDao.update(dept);
//        return 1;
//    }
//}
