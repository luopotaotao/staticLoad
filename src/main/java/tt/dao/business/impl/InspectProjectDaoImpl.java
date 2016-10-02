package tt.dao.business.impl;

import org.springframework.stereotype.Repository;
import tt.dao.business.InspectProjectDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.InspectProject;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("inspectProjectDao")
public class InspectProjectDaoImpl extends BaseDaoImpl<InspectProject> implements InspectProjectDaoI {
}
