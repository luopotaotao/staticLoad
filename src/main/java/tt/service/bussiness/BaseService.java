package tt.service.bussiness;

import java.util.List;
import java.util.Map;

/**
 * Created by tt on 2016/10/17.
 */
public interface BaseService<T> {
    T get(Integer id, Integer dept_id);
    List<T> list(Map<String,Object> params,Integer page,Integer pageSize, Integer dept_id);
    default long count(Map<String,Object> params,Integer dept_id){return 0;};
    T add(T instance,Integer dept_id);
    int del(List<Integer> ids,Integer dept_id);
    T update(T instance,Integer dept_id);
}
