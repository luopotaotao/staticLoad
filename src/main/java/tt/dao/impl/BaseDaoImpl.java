package tt.dao.impl;


import java.io.Serializable;
import java.lang.annotation.Annotation;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.hibernate.*;
import org.hibernate.criterion.CriteriaQuery;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.SimpleExpression;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import tt.annotation.NeedDept;
import tt.dao.BaseDaoI;
import tt.pageModel.PageHelper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tt.pageModel.SessionInfo;
import tt.util.ConfigUtil;

import javax.servlet.http.HttpSession;


public class BaseDaoImpl<T> implements BaseDaoI<T> {
    private Class<T> entityClass;
    @Autowired
    private SessionFactory sessionFactory;

    public BaseDaoImpl() {
        Type genType = getClass().getGenericSuperclass();
        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
        entityClass = (Class) params[0];
    }

    /**
     * 获得当前事物的session
     *
     * @return org.hibernate.Session
     */
    public Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }

    public Criteria getCriteria() {
        return getCurrentSession().createCriteria(entityClass);
    }
    public Criteria getCriteria(Map<String, Object> params){
        Criteria c = getCriteria();
        if(params!=null&&!params.isEmpty()){
            params.forEach((key,val) -> {
                if (val instanceof String) {
                    String str = (String) val;
                    if (str.startsWith("%") || str.endsWith("%")) {
                        c.add(like(key, str));
                    } else {
                        c.add(Restrictions.eq(key, str));
                    }
                }else if(val instanceof Collection) {
                    c.add(Restrictions.in(key,(Collection)val));
                } else {
                    c.add(Restrictions.eq(key, val));
                }

            });
        }

        return c;
    }


    public Criteria getCriteria(Integer page, Integer pageSize) {
        //TODO 在这获取用用户信息

//        HttpSession session = ((ServletRequestAttributes) RequestContextHolder
//                .getRequestAttributes()).getRequest().getSession();
//        SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
//        if(sessionInfo!=null){
//            System.out.println(String.format("sessionInfo is not null:%s", sessionInfo.getName()));
//        }
//        boolean flag = entityClass.isAnnotationPresent(NeedDept.class);
//        Annotation[] annotations = entityClass.getAnnotations();
//        System.out.println(annotations.length);
//        if(flag){
//            NeedDept item = entityClass.getAnnotation(NeedDept.class);
//            System.out.println(String.format("annotation:%s,value:%s", item.toString(),item.needUser()));
//        }

        Criteria c = getCriteria();
        if (page != null && pageSize != null) {
            c.setFirstResult((page - 1) * pageSize).setMaxResults(pageSize);
        }
        return c;
    }

    public Criteria getCriteria(Map<String,Object> params,Integer page,Integer pageSize){
        Criteria c = getCriteria(params);
        if (page != null && pageSize != null) {
            c.setFirstResult((page - 1) * pageSize).setMaxResults(pageSize);
        }
        return c;
    }
    public Criteria getCriteria(Integer page, Integer pageSize, Integer dept_id) {
        return getCriteria(page, pageSize).add(Restrictions.eq("dept_id", dept_id));
    }

    public Criteria getCriteria(Integer dept_id){
        return getCriteria().add(Restrictions.eq("dept_id", dept_id));
    }
    @Override
    public Serializable save(T o) {
        if (o != null) {
            return this.getCurrentSession().save(o);
        }
        return null;
    }

    @Override
    public T getById(Serializable id) {
        return (T) getCurrentSession().get(entityClass, id);
    }

    @Override
    public T getById(Serializable id, Serializable dept_id) {
        return (T) getCurrentSession().createCriteria(entityClass)
                .add(Restrictions.eq("id",id))
                .add(Restrictions.eq("dept_id", dept_id))
                .setMaxResults(1).list().get(0);
    }


    @Override
    public T get(Class<T> c, Serializable id) {
        return (T) this.getCurrentSession().get(c, id);
    }

    @Override
    public T get(String hql) {
        Query q = this.getCurrentSession().createQuery(hql);
        List<T> l = q.list();
        if (l != null && l.size() > 0) {
            return l.get(0);
        }
        return null;
    }

    @Override
    public T get(String hql, Map<String, Object> params) {
        Query q = this.getCurrentSession().createQuery(hql);
        if (params != null && !params.isEmpty()) {
            for (String key : params.keySet()) {
                q.setParameter(key, params.get(key));
            }
        }
        List<T> l = q.list();
        if (l != null && l.size() > 0) {
            return l.get(0);
        }
        return null;
    }

    @Override
    public void delete(T o) {
        if (o != null) {
            this.getCurrentSession().delete(o);
        }
    }

    @Override
    public void update(T o) {
        if (o != null) {
            this.getCurrentSession().update(o);
        }
    }

    @Override
    public void saveOrUpdate(T o) {
        if (o != null) {
            this.getCurrentSession().saveOrUpdate(o);
        }
    }

    @Override
    public List<T> find(String hql) {
        Query q = this.getCurrentSession().createQuery(hql);
        return q.list();
    }

    @Override
    public List<T> find(String hql, Map<String, Object> params) {
        Query q = this.getCurrentSession().createQuery(hql);
        if (params != null && !params.isEmpty()) {
            for (String key : params.keySet()) {
                q.setParameter(key, params.get(key));
            }
        }
        return q.list();
    }

    @Override
    public List<T> find(Map<String, Object> params) {
        return getCriteria(params).list();
    }

    @Override
    public List<T> find(Map<String, Object> params, Integer page, Integer rows) {
        return getCriteria(params).setMaxResults(rows).setFirstResult((page-1)*rows).list();
    }

    @Override
    public List<Map<String, Object>> findList(String hql, Map<String, Object> params) {
        Query q = this.getCurrentSession().createQuery(hql);
        if (params != null && !params.isEmpty()) {
            for (String key : params.keySet()) {
                q.setParameter(key, params.get(key));
            }
        }
        return q.list();
    }

    @Override
    public List<T> find(String hql, Map<String, Object> params, int page, int rows) {
        Query q = this.getCurrentSession().createQuery(hql);
        if (params != null && !params.isEmpty()) {
            for (String key : params.keySet()) {
                if (params.get(key) instanceof List) {
                    q.setParameterList(key, (List) params.get(key));
                } else {
                    q.setParameter(key, params.get(key));
                }
            }
        }
        return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
    }


    @Override
    public List<T> find(String hql, int page, int rows) {
        Query q = this.getCurrentSession().createQuery(hql);
        return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
    }

    @Override
    public Long count(String hql) {
        Query q = this.getCurrentSession().createQuery(hql);
        return (Long) q.uniqueResult();
    }

    @Override
    public Long count(String hql, Map<String, Object> params) {
        Query q = this.getCurrentSession().createQuery(hql);
        if (params != null && !params.isEmpty()) {
            for (String key : params.keySet()) {
                if (params.get(key) instanceof List) {
                    q.setParameterList(key, (List) params.get(key));
                } else {
                    q.setParameter(key, params.get(key));
                }
            }
        }
        return (Long) q.uniqueResult();
    }

    public Long count(Map<String, Object> params){
        return (Long) getCriteria().setProjection(Projections.rowCount()).uniqueResult();
    }
    @Override
    public int executeHql(String hql) {
        Query q = this.getCurrentSession().createQuery(hql);
        return q.executeUpdate();
    }

    @Override
    public int executeHql(String hql, Map<String, Object> params) {
        Query q = this.getCurrentSession().createQuery(hql);
        if (params != null && !params.isEmpty()) {
            for (String key : params.keySet()) {
                if (params.get(key) instanceof List) {
                    q.setParameterList(key, (List) params.get(key));
                } else {
                    q.setParameter(key, params.get(key));
                }
            }
        }
        return q.executeUpdate();
    }

    @Override
    public List<Object[]> findBySql(String sql) {
        SQLQuery q = this.getCurrentSession().createSQLQuery(sql);
        return q.list();
    }

    @Override
    public List<Object[]> findBySql(String sql, int page, int rows) {
        SQLQuery q = this.getCurrentSession().createSQLQuery(sql);
        return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
    }

    @Override
    public List<Object[]> findBySql(String sql, Map<String, Object> params) {
        SQLQuery q = this.getCurrentSession().createSQLQuery(sql);
        if (params != null && !params.isEmpty()) {
            for (String key : params.keySet()) {
                if (params.get(key) instanceof List) {
                    q.setParameterList(key, (List) params.get(key));
                } else {
                    q.setParameter(key, params.get(key));
                }
            }
        }
        return q.list();
    }

    @Override
    public List<T> findBySql(Class<T> entity, String sql, Map<String, Object> params) {
        SQLQuery q = this.getCurrentSession().createSQLQuery(sql).addEntity(entity);
        if (params != null && !params.isEmpty()) {
            for (String key : params.keySet()) {
                q.setParameter(key, params.get(key));
            }
        }
        return q.list();
    }

    @Override
    public List<Object[]> findBySql(String sql, Map<String, Object> params, int page, int rows) {
        SQLQuery q = this.getCurrentSession().createSQLQuery(sql);
        if (params != null && !params.isEmpty()) {
            for (String key : params.keySet()) {
                q.setParameter(key, params.get(key));
            }
        }
        return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
    }

    @Override
    public List<T> findBySql(Class<T> entity, String sql, Map<String, Object> params, int page, int rows) {
        SQLQuery q = this.getCurrentSession().createSQLQuery(sql).addEntity(entity);
        return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
    }

    @Override
    public int executeSql(String sql) {
        SQLQuery q = this.getCurrentSession().createSQLQuery(sql);
        return q.executeUpdate();
    }

    @Override
    public int executeSql(String sql, Map<String, Object> params) {
        SQLQuery q = this.getCurrentSession().createSQLQuery(sql);
        if(params!=null&&!params.isEmpty()){
            params.forEach((key,val)->{
                if(val instanceof Collection){
                    q.setParameterList(key,(Collection) val);
                }else{
                    q.setParameter(key, params.get(key));
                }
            });
        }
        return q.executeUpdate();
    }

    @Override
    public BigInteger countBySql(String sql) {
        SQLQuery q = this.getCurrentSession().createSQLQuery(sql);
        return (BigInteger) q.uniqueResult();
    }

    @Override
    public BigInteger countBySql(String sql, Map<String, Object> params) {
        SQLQuery q = this.getCurrentSession().createSQLQuery(sql);
        if (params != null && !params.isEmpty()) {
            for (String key : params.keySet()) {
                q.setParameter(key, params.get(key));
            }
        }
        return (BigInteger) q.uniqueResult();
    }

    @Override
    public int logicDelete(String table,Map<String,Object> params) {

        StringBuilder sql = new StringBuilder("update ").append(table).append(" set deleted=true where 1=1 ");
        if(params!=null&&params.size()>0){
            params.forEach((k,v)->{
                sql.append("and ").append(k);
                if(v instanceof Collection){
                    sql.append(" in (:").append(k).append(")");
                }else{
                    sql.append("= :");
                }
            });
        }
        return executeSql(sql.toString(),params);
    }

    /**
     * 排序
     *
     * @param ph
     * @return
     */
    protected String orderHql(PageHelper ph) {
        String orderString = "";
        if (ph.getSort() != null && ph.getOrder() != null) {
            orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
        }
        return orderString;
    }

    /**
     * 避免用户输入特殊字符时查询结果不准确的问题
     */
    public String ConvertParam(String param) {
        param = param.replace("", "");
        param = param.replace("[", "[[]");
        param = param.replace("_", "[_]");
        param = param.replace("%", "[%]");
        return param;
    }

    protected boolean isEmpty(String val) {
        return val == null || val.trim().isEmpty();
    }

    protected SimpleExpression like(String field, String val) {
        StringBuilder val_like = new StringBuilder("%");
        val_like.append(val.trim()).append("%");
        return Restrictions.like(field, val_like.toString());
    }
}
