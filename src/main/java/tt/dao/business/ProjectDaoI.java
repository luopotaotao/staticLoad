package tt.dao.business;

import tt.dao.BaseDaoI;
import tt.model.business.Project;

import java.util.List;

/**
 * Created by tt on 2016/9/29.
 */
public interface ProjectDaoI extends BaseDaoI<Project>{
    List<Project> queryProjectsByAreaId(Integer area_id);
    List<String> queryStzhByProjectCode(String prg);
}
