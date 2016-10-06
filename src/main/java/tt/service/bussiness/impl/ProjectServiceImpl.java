package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.AreaObjDaoI;
import tt.dao.business.ProjectDaoI;
import tt.model.business.Project;
import tt.service.bussiness.AreaServiceI;
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
    @Autowired
    private AreaObjDaoI areaObjDaoI;
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

        return ret;
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
        project.setProvince(areaObjDaoI.get(project.getProvince().getId()));
        project.setCity(areaObjDaoI.get(project.getCity().getId()));
        projectDao.update(project);
        return 1;
    }

    @Override
    public int del(List<Integer> list) {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("ids", list);
        return projectDao.executeHql("delete from Project where id in (:ids)", params);
    }
}
