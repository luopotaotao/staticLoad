package tt.dao.business.impl;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import tt.dao.business.InspectPlanDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.InspectPlan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("inspectPlanDao")
public class InspectPlanDaoImpl extends BaseDaoImpl<InspectPlan> implements InspectPlanDaoI {
    @Override
    public List<InspectPlan> list(String name, Integer page, Integer pageSize, Integer dept_id) {
        Criteria c = getCriteria(page, pageSize, dept_id);
        if (!isEmpty(name)) {
            c.add(like("name", name));
        }
        return c.list();
    }

    @Override
    public InspectPlan getByPrgStzhDevNB(String prg, String stzh, String DevNB) {
        String hql = "from InspectPlan ip where ip.equipment.code=:DevNB and ip.stzh=:stzh and ip.project.id in (select id from Project p where p.code=:prg)";
        Map<String, Object> params = new HashMap<>();
        params.put("DevNB", DevNB);
        params.put("stzh", stzh);
        params.put("prg", prg);
        List<InspectPlan> list = this.find(hql, params);
        if (list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public boolean isExistStzh(Integer project_id, String stzh,Integer dept_id) {
        String sql = "select count(*)>0 from b_inspect_plan where dept_id=:dept_id and project_id=:project_id and stzh=:stzh";
        Map<String,Object> params = new HashMap<>();
        params.put("project_id",project_id);
        params.put("stzh",stzh);
        params.put("dept_id",dept_id);
        return countBySql(sql,params).longValue()>0;
    }


}
