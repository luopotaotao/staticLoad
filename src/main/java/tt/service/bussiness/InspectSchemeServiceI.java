package tt.service.bussiness;

import tt.model.business.InspectScheme;

import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
public interface InspectSchemeServiceI {
    InspectScheme get(int id);
    List<InspectScheme> list(String name, int page, int PageSize);
    long count(String name);
    int add(InspectScheme inspectScheme);
    int del(List<Integer> ids);
    int update(InspectScheme inspectScheme);
}
