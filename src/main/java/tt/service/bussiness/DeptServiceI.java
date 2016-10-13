package tt.service.bussiness;

import tt.model.business.Dept;

import java.util.List;

/**
 * Created by taotao on 2016/9/23.
 */
public interface DeptServiceI {
    Dept get(int id);
    List<Dept> list(String name, Integer page, Integer PageSize);
    long count(String name);
    int add(Dept Dept);
    int del(List<Integer> ids);
    int update(Dept Dept);
}
