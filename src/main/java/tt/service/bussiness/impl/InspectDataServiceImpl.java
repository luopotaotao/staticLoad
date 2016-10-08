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
    public List<InspectData> list(String PRG,String STZH) {
        String hql = "from InspectData WHERE PRG=:PRG and STZH=:STZH order by PRG,STZH,Time";
        Map<String,Object> params = new HashMap<>();
        params.put("PRG",PRG);
        params.put("STZH",STZH);
        List<InspectData> ret = inspectDataDao.find(hql, params);
        return ret;
    }
    @Override
    public int del(List<Integer> ids) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("ids", ids);
        return inspectDataDao.executeHql("delete from InspectData where id in (:ids)", params);
    }

    @Override
    public List<Map<String, Object>> loadKeys() {
        return inspectDataDao.findList("select distinct  new map(d.prg as prg,d.stzh as stzh) from InspectData d",null);
    }
    @Override
    public List<Map<String, Object>> loadUnLinkedKeys() {
        return inspectDataDao.findList("select distinct  new map(d.prg as prg,d.stzh as stzh) from InspectData d where d.plan_id is null",null);
    }
    public List<Map<String, Object>> loadLinkedKeys(Integer plan_id) {
        Map<String,Object> params = new HashMap<>();
        params.put("plan_id",plan_id);
        return inspectDataDao.findList("select distinct  new map(d.prg as prg,d.stzh as stzh) from InspectData d where d.plan_id=:plan_id",params);
    }

    @Override
    public int linkData(Integer plan_id, List<Map<String, Object>> data) {
        String sql = "update b_inspect_data set plan_id=:plan_id where prg=:prg and stzh=:stzh";
        data.forEach(item->{item.put("plan_id",plan_id);inspectDataDao.executeSql(sql,item);});
        return 0;
    }
}
