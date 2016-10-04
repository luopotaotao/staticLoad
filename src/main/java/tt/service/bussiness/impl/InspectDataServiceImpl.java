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
    public List<InspectData> list(Integer PRG,Integer STZH) {
        String hql = "from InspectData WHERE PRG=:PRG and STZH=:STZH";
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
}
