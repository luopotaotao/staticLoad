package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.InspectDataDaoI;
import tt.model.business.InspectData;
import tt.service.bussiness.InspectDataServiceI;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
@Service("inspectDataService")
public class InspectDataServiceImpl implements InspectDataServiceI {
    @Autowired
    private InspectDataDaoI inspectDataDao;

    @Override
    public List<InspectData> list(String PRG,String STZH, Integer dept_id) {
        String hql = "from InspectData WHERE PRG=:PRG and STZH=:STZH and dept_id=:dept_id order by PRG,STZH,Time";
        Map<String,Object> params = new HashMap<>();
        params.put("dept_id",dept_id);
        params.put("PRG",PRG);
        params.put("STZH",STZH);
        List<InspectData> ret = inspectDataDao.find(hql, params);
        return ret;
    }
    @Override
    public int del(List<Integer> ids, Integer dept_id) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("dept_id",dept_id);
        params.put("ids", ids);
        return inspectDataDao.executeHql("delete from InspectData where id in (:ids) and dept_id=:dept_id", params);
    }

    @Override
    public List<Map<String, Object>> loadKeys(Integer dept_id) {
        Map<String, Object> params = new HashMap<>();
        params.put("dept_id",dept_id);
        return inspectDataDao.findList("select distinct new map(d.prg as prg,d.stzh as stzh) from InspectData d where d.dept_id=:dept_id",params);
    }
    @Override
    public List<Map<String, Object>> loadUnLinkedKeys(Integer dept_id) {
        Map<String, Object> params = new HashMap<>();
        params.put("dept_id",dept_id);
        return inspectDataDao.findList("select distinct new map(d.prg as prg,d.stzh as stzh) from InspectData d where d.plan_id is null and d.dept_id=:dept_id",params);
    }
    public List<Map<String, Object>> loadLinkedKeys(Integer plan_id,Integer dept_id) {
        Map<String,Object> params = new HashMap<>();
        params.put("dept_id",dept_id);
        params.put("plan_id",plan_id);
        return inspectDataDao.findList("select distinct new map(d.prg as prg,d.stzh as stzh) from InspectData d where d.plan_id=:plan_id and d.dept_id=:dept_id",params);
    }

    @Override
    public int linkData(Integer plan_id, List<Map<String, Object>> data, Integer dept_id) {
        String sql = "update b_inspect_data set plan_id=:plan_id where prg=:prg and stzh=:stzh and d.dept_id=:dept_id";
        int ret = 0;
        for(Map item:data){
            item.put("plan_id",plan_id);
            item.put("dept_id",dept_id);
            ret+=inspectDataDao.executeSql(sql,item);
        }
        return ret;
    }
}
