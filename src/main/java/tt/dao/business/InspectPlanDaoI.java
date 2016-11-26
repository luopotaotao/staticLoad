package tt.dao.business;

import tt.dao.BaseDaoI;
import tt.model.business.InspectPlan;

import java.util.List;

/**
 * Created by taotao on 2016/9/23.
 */
public interface InspectPlanDaoI extends BaseDaoI<InspectPlan> {
    List<InspectPlan> list(String name, Integer page, Integer pageSize,Integer dept_id);
    InspectPlan getByPrgStzhDevNB(String prg,String stzh, String DevNB);
    boolean isExistStzh(Integer project_id,String stzh,Integer dept_id);
}
