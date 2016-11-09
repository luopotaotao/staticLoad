package tt.dao.business;

import tt.dao.BaseDaoI;
import tt.model.business.User;

import java.util.List;

/**
 * Created by taotao on 2016/9/23.
 */
public interface UserDaoI extends BaseDaoI<User> {
    List<User> list(Integer current_role,Integer dept_id, String name, Integer page, Integer pageSize);
}
