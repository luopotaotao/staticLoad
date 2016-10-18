package tt.service.bussiness;

import tt.model.business.Project;

import java.util.List;

/**
 * Created by tt on 2016/9/29.
 */
public interface ProjectServiceI extends BaseService<Project>{
    List<Project> list(Integer area_id, Integer dept_id);
// TODO 额外参数
}
