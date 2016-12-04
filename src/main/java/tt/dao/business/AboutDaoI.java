package tt.dao.business;

import tt.dao.BaseDaoI;
import tt.model.business.About;

/**
 * Created by tt on 2016/12/4.
 */
public interface AboutDaoI extends BaseDaoI<About> {
    About get();
}
