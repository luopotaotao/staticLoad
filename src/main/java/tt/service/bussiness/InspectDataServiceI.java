package tt.service.bussiness;

import tt.model.business.InspectData;

import java.util.List;
import java.util.Map;

/**
 * Created by tt on 2016/10/2.
 */
public interface InspectDataServiceI {
    List<InspectData> list(String PRG,String STZH,Integer dept_id);
    Map<String, Object> calcChart0(List<InspectData> list);
    Map<String, Object> calcChart1(List<InspectData> list);
    Map<String, Object> calcChart2(List<InspectData> list);
    int del(List<Integer> ids,Integer dept_id);
    List<Map<String,Object>> loadKeys(Integer dept_id);
    List<Map<String, Object>> loadUnLinkedKeys(Integer dept_id);
    List<Map<String, Object>> loadLinkedKeys(Integer plan_id,Integer dept_id);
    int linkData(Integer plan_id,List<Map<String,Object>> data,Integer dept_id);

}
