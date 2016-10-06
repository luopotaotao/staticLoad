package tt.service.bussiness;

import tt.model.business.InspectPlan;

import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
public interface InspectPlanServiceI {
    InspectPlan get(int id);
    List<InspectPlan> list(String name, int page, int PageSize);
    long count(String name);
    int add(InspectPlan inspectPlan);
    int del(List<Integer> ids);
    int update(InspectPlan inspectPlan);
}
