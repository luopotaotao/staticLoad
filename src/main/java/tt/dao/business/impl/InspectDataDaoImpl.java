package tt.dao.business.impl;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import tt.dao.business.InspectDataDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.InspectData;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("inspectDataDao")
public class InspectDataDaoImpl extends BaseDaoImpl<InspectData> implements InspectDataDaoI {
    @Override
    public InspectData loadLatestData(String PRG, String STZH, Integer dept_id) {
        InspectData ret = null;
        Integer id = getMaxId(PRG,STZH,dept_id);
        if(id!=null){
            ret = (InspectData) getCriteria(dept_id).add(Restrictions.eq("prg",PRG)).add(Restrictions.eq("stzh",STZH)).add(Restrictions.eq("id",id)).uniqueResult();
        }
        return ret;
    }
    private Integer getMaxId(String PRG, String STZH, Integer dept_id){
        Integer id = null;
        String sql = "SELECT id FROM b_inspect_data " +
                " WHERE PRG=:PRG " +
                " AND STZH=:STZH " +
                " AND dept_id=:dept_id " +
                " AND Time = (SELECT MAX(Time) FROM b_inspect_data WHERE PRG=:PRG AND STZH=:STZH AND dept_id=:dept_id ) limit 1";
        Map<String,Object> params = new HashMap<>();
        params.put("PRG",PRG);
        params.put("STZH",STZH);
        params.put("dept_id",dept_id);
        List list = findBySql(sql,params);
        if(list!=null&&list.size()>0){
            try {
                id  = (Integer)list.get(0);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return id;
    }
}
