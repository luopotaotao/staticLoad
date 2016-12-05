package tt.dao.business.impl;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import tt.dao.business.InspectSchemeDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.InspectScheme;

import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("inspectSchemeDao")
public class InspectSchemeDaoImpl extends BaseDaoImpl<InspectScheme> implements InspectSchemeDaoI {

}
