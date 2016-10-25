package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.AreaObjDaoI;
import tt.dao.business.CompanyDaoI;
import tt.dao.business.ProjectDaoI;
import tt.model.business.AreaObj;
import tt.model.business.Company;
import tt.model.business.Project;
import tt.service.bussiness.ProjectServiceI;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import static org.bouncycastle.asn1.x500.style.RFC4519Style.name;

/**
 * Created by tt on 2016/9/29.
 */
@Service("projectService")
public class ProjectServiceImpl implements ProjectServiceI {
    @Autowired
    private ProjectDaoI projectDao;
    @Autowired
    private AreaObjDaoI areaObjDao;
    @Autowired
    private CompanyDaoI companyDao;
    @Override
    public Project get(Integer id, Integer dept_id) {
        return projectDao.getById(id,dept_id);
    }


    @Override
    public List<Project> list(Map<String,Object> params, Integer page, Integer pageSize, Integer dept_id) {
        params.put("dept_id",dept_id);
        Integer area_id = (Integer) params.get("area_id");
        String name = (String) params.get("name");
        StringBuilder hql = new StringBuilder("from Project WHERE dept_id=:dept_id");
        if (area_id != null && area_id != 0) {
            hql.append(" AND (province_id=:area_id or city_id in (select id from Area where pid=:area_id))");
        }
        if (name != null) {
            params.put("name", "%" + name + "%");
            hql.append(" AND (name like :name or code like :name) ");
        }
        List<Project> ret = projectDao.find(hql.toString(), params, page, pageSize);

        return ret;
    }

    @Override
    public List<Project> list(Integer area_id, Integer dept_id) {
        StringBuilder hql = new StringBuilder("from Project WHERE dept_id=:dept_id");
        Map<String, Object> params = new HashMap<>();
        params.put("dept_id",dept_id);
        if (area_id != null && area_id != 0) {
            params.put("area_id", area_id);
            hql.append(" AND (province_id=:area_id or city_id=:area_id)");
        }
        return projectDao.find(hql.toString(),params);
    }

    //TODO delete?
    @Override
    public long count(Map<String,Object> params, Integer dept_id) {
        return 0;
    }

    @Override
    public Project add(Project project, Integer dept_id) {
        resetProjectComponents(project);
        project.setDept_id(dept_id);
        projectDao.save(project);
        return project;
    }

    @Override
    public Project update(Project project, Integer dept_id) {
        resetProjectComponents(project);
        projectDao.update(project);
        return project;
    }

    @Override
    public int del(List<Integer> list, Integer dept_id) {
        Map<String, Object> params = new LinkedHashMap<>();
        params.put("dept_id",dept_id);
        params.put("ids", list);
        return projectDao.executeHql("delete from Project where id in (:ids) and dept_id=:dept_id", params);
    }

    private void resetProjectComponents(Project project){
        AreaObj province = project.getProvince();
        AreaObj city = project.getCity();
        Company builder = project.getBuilder();
        Company constructor = project.getConstructor();
        Company inspector = project.getInspector();

        if(province!=null&&province.getId()>0){
            project.setProvince(areaObjDao.get(province.getId()));
        }
        if(city!=null&&city.getId()>0){
            project.setCity(areaObjDao.get(city.getId()));
        }
        if(builder!=null&&builder.getId()>0){
            project.setBuilder(companyDao.get(builder.getId()));
        }
        if(constructor!=null&&constructor.getId()>0){
            project.setConstructor(companyDao.get(constructor.getId()));
        }
        if(inspector!=null&&inspector.getId()>0){
            project.setInspector(companyDao.get(inspector.getId()));
        }


    }
}
