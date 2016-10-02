package tt.dao.business.impl;

import org.springframework.stereotype.Repository;
import tt.dao.business.InspectSchemeDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.InspectScheme;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("inspectSchemeDao")
public class InspectSchemeDaoImpl extends BaseDaoImpl<InspectScheme> implements InspectSchemeDaoI {
}
