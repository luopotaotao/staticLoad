package tt.dao.business.impl;

import org.springframework.stereotype.Repository;
import tt.dao.business.InspectMethodDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.InspectMethod;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("inspectMethodDao")
public class InspectMethodDaoImpl extends BaseDaoImpl<InspectMethod> implements InspectMethodDaoI {
}
