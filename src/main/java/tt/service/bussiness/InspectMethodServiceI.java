package tt.service.bussiness;

import tt.model.business.InspectMethod;

import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
public interface InspectMethodServiceI {
    InspectMethod get(int id);
    List<InspectMethod> list(Integer inspect_item_id,String name);
    int add(InspectMethod inspectMethod);
    int del(List<Integer> ids);
    int update(InspectMethod inspectMethod);
}
