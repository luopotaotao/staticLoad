package tt.dao.business.impl;

import org.springframework.stereotype.Repository;
import tt.dao.business.InstitutionDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.Institution;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("institutionDao")
public class InstitutionDaoImpl extends BaseDaoImpl<Institution> implements InstitutionDaoI {
}
