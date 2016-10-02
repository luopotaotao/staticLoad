package tt.dao.business.impl;

import org.springframework.stereotype.Repository;
import tt.dao.business.InspectItemDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.InspectItem;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("inspectItemDao")
public class InspectItemDaoImpl extends BaseDaoImpl<InspectItem> implements InspectItemDaoI {
}
