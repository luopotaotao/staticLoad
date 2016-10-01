package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.ProjectDaoI;
import tt.model.business.Project;
import tt.service.bussiness.ProjectServiceI;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by tt on 2016/9/29.
 */
@Service("projectService")
public class ProjectServiceImpl implements ProjectServiceI {
    @Autowired
    private ProjectDaoI projectDao;

    @Override
    public Project get(int id) {
        return projectDao.get(Project.class, id);
    }


    @Override
    public List<Project> list(Integer area_id, String name, Integer page, Integer pageSize) {
        StringBuilder hql = new StringBuilder("from Project WHERE 1=1");
        Map<String, Object> params = new HashMap<>();
        if (area_id != null && area_id != 0) {
            params.put("area_id", area_id);
            hql.append(" AND (province_id=:area_id or city_id in (select id from Area where pid=:area_id))");
        }
        if (name != null) {
            params.put("name", "%" + name + "%");
            hql.append(" AND name like :name ");
        }
        List<Project> ret = projectDao.find(hql.toString(), params, page, pageSize);
        StringBuilder sql = new StringBuilder(
                "SELECT pro.`id`,\n" +
                "  pro.`code`,\n" +
                "  pro.`name`,\n" +
                "  pro.`province_id`,\n" +
                "  provience.name 'province.name',\n" +
                "  pro.`city_id` ,\n" +
                "  city.name 'city.name',\n" +
                "  pro.`address`,\n" +
                "  pro.`lat` ,\n" +
                "  pro.`lng`,\n" +
                "  pro.`constructor_id`,\n" +
                "  constructor.name 'constructor.name' ,\n" +
                "  pro.`builder_id`,\n" +
                "  builder.name 'builder.name',\n" +
                "  pro.`inspector_id`,\n" +
                "  inspector.name 'inspector.name',\n" +
                "  pro.`note`\n" +
                "FROM (select * from b_project where 1=1 ");
        if (area_id != null && area_id != 0) {
            params.put("area_id", area_id);
            sql.append(" AND (city_id=:area_id or province_id in (select id from b_area where pid=:area_id))");
        }
        if (name != null) {
            params.put("name", "%" + name + "%");
            sql.append(" AND name like :name ");
        }
        sql.append(
                ") pro \n" +
                "  LEFT JOIN b_area provience ON pro.province_id = provience.id\n" +
                "  LEFT JOIN b_area city ON pro.city_id = city.id\n" +
                "  LEFT JOIN b_company constructor ON pro.constructor_id = constructor.id\n" +
                "  LEFT JOIN b_company builder ON pro.constructor_id = builder.id\n" +
                "  LEFT JOIN b_company inspector ON pro.constructor_id = inspector.id ");
//        List<Project> list = projectDao.findBySql(Project.class,sql.toString(),params,page,pageSize);
        List<Project> list = projectDao.findBySql(Project.class,"select * from b_project",params,page,pageSize);
        ret.forEach(item -> {
            if (item.getProvince() != null) {
                item.getProvince().setChildren(null);
                item.getProvince().setParent(null);
            }
            if (item.getCity() != null) item.getCity().setChildren(null);
        });
        return list;
    }

    @Override
    public List<Project> list(Integer area_id) {
        StringBuilder hql = new StringBuilder("from Project WHERE 1=1");
        Map<String, Object> params = new HashMap<>();
        if (area_id != null && area_id != 0) {
            params.put("area_id", area_id);
            hql.append(" AND (province_id=:area_id or city_id=:area_id)");
        }
        return projectDao.find(hql.toString(),params);
    }

    @Override
    public long count(Integer area_id, String name) {
        return 0;
    }

    @Override
    public int add(Project project) {
        projectDao.save(project);
        return project.getId();
    }

    @Override
    public int update(Project project) {
        projectDao.update(project);
        return 1;
    }

    @Override
    public int del(List<Integer> list) {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put(":ids", list);
        return projectDao.executeHql("delete from Project where id in (:ids)", params);
    }
}
