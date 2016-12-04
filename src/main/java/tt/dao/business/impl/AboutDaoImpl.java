package tt.dao.business.impl;

import org.springframework.stereotype.Repository;
import tt.dao.business.AboutDaoI;
import tt.dao.business.AreaDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.About;
import tt.model.business.Area;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by tt on 2016/9/29.
 */
@Repository("aboutDao")
public class AboutDaoImpl extends BaseDaoImpl<About> implements AboutDaoI {
    @Override
    public About get() {
        return (About) getCriteria().uniqueResult();
    }
}
