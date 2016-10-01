package tt.dao.business.impl;

import org.springframework.stereotype.Repository;
import tt.dao.business.AreaDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.Area;

/**
 * Created by tt on 2016/9/29.
 */
@Repository("areaDao")
public class AreaDaoImpl extends BaseDaoImpl<Area> implements AreaDaoI {

}
