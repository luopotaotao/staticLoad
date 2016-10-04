package tt.dao.business.impl;

import org.springframework.stereotype.Repository;
import tt.dao.business.InspectDataDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.InspectData;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("inspectDataDao")
public class InspectDataDaoImpl extends BaseDaoImpl<InspectData> implements InspectDataDaoI {
}
