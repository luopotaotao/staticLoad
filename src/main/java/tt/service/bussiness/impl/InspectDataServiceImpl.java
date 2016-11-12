package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.InspectDataDaoI;
import tt.model.business.InspectData;
import tt.service.bussiness.InspectDataServiceI;

import java.util.HashMap;
import java.util.LinkedList;
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
        inspectDataDao.find(new HashMap<>());
        String hql = "from InspectData WHERE PRG=:PRG and STZH=:STZH and dept_id=:dept_id order by SETprs ASC,totalTime ASC";
        Map<String,Object> params = new HashMap<>();
        params.put("dept_id",dept_id);
        params.put("PRG",PRG);
        params.put("STZH",STZH);
        List<InspectData> ret = inspectDataDao.find(hql, params);
        return calcDurationAndCurWyjc(ret);
    }

    /**
     * 计算数据之间的时间间隔和本级位移
     * @param list
     * @return
     */
    private List<InspectData> calcDurationAndCurWyjc(List<InspectData> list) {
        if(list==null||list.isEmpty()){
            return null;
        }
        InspectData firstItem = list.get(0);
        firstItem.setInterval(0);
        if(list.size()>1){
            String current_SETprs = firstItem.getSetprs();
            Double pre_avg_wyjc = 0.0;
            for(int i=1;i<list.size();i++){
                InspectData cur = list.get(i);
                InspectData pre = list.get(i-1);
                Integer interval = cur.getSetprs().equals(pre.getSetprs())?cur.getTotalTime()-cur.getTotalTime():0;
                cur.setInterval(interval);
                //当当前数据和上一条数据的基准压力值一致时,说明当前数据还是和上一条数据属于同一组,直接计算本级位移即可,
                // 否则的话说明数据进入下一基准压力值,需要重新设置当前基准值和上一级的最终位移,再进行计算
                if(!cur.getSetprs().equals(current_SETprs)){
                    current_SETprs = cur.getSetprs();
                    pre_avg_wyjc = pre.getAvgWyjc();
                }
                cur.setCur_wyjc(cur.getAvgWyjc()-pre_avg_wyjc);
            }
        }

        return list;
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

    @Override
    public List<InspectData> calcChart0(List<InspectData> list) {
        List<InspectData> ret = new LinkedList<>();
        if(list==null||list.isEmpty()){
            return null;
        }
        InspectData firstItem = list.get(0);
        firstItem.setInterval(0);
        if(list.size()>1){
            String current_SETprs = firstItem.getSetprs();
            for(int i=1;i<list.size();i++){
                InspectData cur = list.get(i);
                //当当前数据和上一条数据的基准压力值一致时,说明当前数据还是和上一条数据属于同一组,直接计算本级位移即可,
                // 否则的话说明数据进入下一基准压力值,需要重新设置当前基准值和上一级的最终位移,再进行计算
                if(!cur.getSetprs().equals(current_SETprs)){
                    current_SETprs = cur.getSetprs();
                    ret.add(cur);
                }
            }
        }
        ret.add(list.get(list.size()-1));
        return ret;
    }

    @Override
    public List<InspectData> calcChart1(List<InspectData> list) {
        return null;
    }

    @Override
    public List<InspectData> calcChart2(List<InspectData> list) {
        return null;
    }
}
