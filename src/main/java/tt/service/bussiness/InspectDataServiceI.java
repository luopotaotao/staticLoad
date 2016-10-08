package tt.service.bussiness;

import tt.model.business.InspectData;

import java.util.List;
import java.util.Map;

/**
 * Created by tt on 2016/10/2.
 */
public interface InspectDataServiceI {
    List<InspectData> list(String PRG,String STZH);
    int del(List<Integer> ids);
    List<Map<String,Object>> loadKeys();
    List<Map<String, Object>> loadUnLinkedKeys();
    List<Map<String, Object>> loadLinkedKeys(Integer plan_id);
    int linkData(Integer plan_id,List<Map<String,Object>> data);

}
