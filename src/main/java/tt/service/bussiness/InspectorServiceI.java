package tt.service.bussiness;

import tt.model.business.Inspector;

import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
public interface InspectorServiceI {
    Inspector get(int id);
    List<Inspector> list(Integer institution_id,String name);
    int add(Inspector inspectInspector);
    int del(List<Integer> ids);
    int update(Inspector inspectInspector);
}
