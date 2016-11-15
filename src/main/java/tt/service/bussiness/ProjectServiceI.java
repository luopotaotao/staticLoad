package tt.service.bussiness;

import tt.model.business.Project;

import java.util.List;
import java.util.Map;

/**
 * Created by tt on 2016/9/29.
 */
public interface ProjectServiceI extends BaseService<Project>{
    List<Project> list(Integer area_id, Integer dept_id);

    List<String> listStzh(String prg);
// TODO 额外参数
}
