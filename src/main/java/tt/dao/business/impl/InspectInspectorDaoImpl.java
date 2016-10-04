package tt.dao.business.impl;

import org.springframework.stereotype.Repository;
import tt.dao.business.InspectInspectorDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.Inspector;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("inspectInspectDao")
public class InspectInspectorDaoImpl extends BaseDaoImpl<Inspector> implements InspectInspectorDaoI {
}
