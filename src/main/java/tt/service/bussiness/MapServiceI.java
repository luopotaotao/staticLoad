package tt.service.bussiness;

import tt.model.business.Project;
import tt.pageModel.Tree;

import java.util.List;

/**
 * Created by tt on 2016/9/29.
 */
public interface MapServiceI {
    Tree loadAreaTree(String id);

    List<Project> loadProjectsByArea(Integer areaId, String id);
}
