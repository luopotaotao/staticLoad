package tt.service.bussiness;

import tt.model.business.InspectItem;

import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
public interface InspectItemServiceI {
    InspectItem get(int id);
    List<InspectItem> list(String name, int page, int PageSize);
    long count(String name);
    int add(InspectItem inspectItem);
    int del(List<Integer> ids);
    int update(InspectItem inspectItem);
}
