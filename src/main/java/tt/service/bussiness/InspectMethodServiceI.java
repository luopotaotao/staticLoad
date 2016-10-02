package tt.service.bussiness;

import tt.model.business.InspectMethod;

import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
public interface InspectMethodServiceI {
    InspectMethod get(int id);
    List<InspectMethod> list(String name, int page, int PageSize);
    long count(String name);
    int add(InspectMethod inspectMethod);
    int del(List<Integer> ids);
    int update(InspectMethod inspectMethod);
}
