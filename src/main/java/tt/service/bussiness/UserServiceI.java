package tt.service.bussiness;

import tt.model.business.User;

import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
public interface UserServiceI extends BaseService<User> {
    //    List<User> list(Integer institution_id,String name,Integer dept_id);
    int del(List<String> ids);
    boolean isExist(String name);
//TODO 额外参数
}
