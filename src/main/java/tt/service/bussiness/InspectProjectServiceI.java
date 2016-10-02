package tt.service.bussiness;

import tt.model.business.InspectProject;

import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
public interface InspectProjectServiceI {
    InspectProject get(int id);
    List<InspectProject> list( String name, int page, int PageSize);
    long count(String name);
    int add(InspectProject inspectProject);
    int del(List<Integer> ids);
    int update(InspectProject inspectProject);
}
