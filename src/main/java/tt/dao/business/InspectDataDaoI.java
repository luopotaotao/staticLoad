package tt.dao.business;

import tt.dao.BaseDaoI;
import tt.model.business.InspectData;

/**
 * Created by taotao on 2016/9/23.
 */
public interface InspectDataDaoI extends BaseDaoI<InspectData> {
    InspectData loadLatestData(String PRG,String STZH, Integer dept_id);
}
