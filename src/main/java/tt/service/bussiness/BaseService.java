package tt.service.bussiness;

import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Created by tt on 2016/10/17.
 */
public interface BaseService<T> {
    default T get(Serializable id, Integer dept_id){
        throw new NotImplementedException();
    }
    default List<T> list(Map<String,Object> params,Integer page,Integer pageSize, Integer dept_id){
        throw new NotImplementedException();
    }
    default long count(Map<String,Object> params,Integer dept_id){
        throw new NotImplementedException();
    }
    default T add(T instance,Integer dept_id){
        throw new NotImplementedException();
    }
    default int del(List<Integer> ids,Integer dept_id){
        throw new NotImplementedException();
    }
    default T update(T instance,Integer dept_id){
        throw new NotImplementedException();
    }
}
