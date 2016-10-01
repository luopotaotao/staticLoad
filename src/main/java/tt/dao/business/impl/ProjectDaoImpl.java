package tt.dao.business.impl;

import org.springframework.stereotype.Repository;
import tt.dao.business.ProjectDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.Project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by tt on 2016/9/29.
 */
@Repository("projectDaoI")
public class ProjectDaoImpl extends BaseDaoImpl<Project> implements ProjectDaoI {
    @Override
    public List<Project> queryProjectsByAreaId(Integer area_id) {
//        String sql = "select * from Project " +
//                "where " +
//                "province_id =:area_id " +
//                "or city_id in (select id form b_area where pid=:area_id)";
        String hql = "from Project";
        Map<String,Object> params = new HashMap<>();
        params.put("area_id",area_id);
//        List<Project> ret = this.findBySql(Project.class,sql,params);
        List<Project> ret = find(hql,params);
        return ret;
    }
}
