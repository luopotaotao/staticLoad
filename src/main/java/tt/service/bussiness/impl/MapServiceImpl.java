package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.model.business.Project;
import tt.pageModel.Tree;
import tt.service.bussiness.MapServiceI;

import java.util.List;

/**
 * Created by tt on 2016/9/29.
 */
@Service("mapService")
public class MapServiceImpl implements MapServiceI {
//    @Autowired
//    private MapDao mapDao;
    @Override
    public Tree loadAreaTree(String user_id) {
//        mapDao.loadAreaById(user_id)
        return null;
    }

    @Override
    public List<Project> loadProjectsByArea(Integer areaId, String id) {
        return null;
    }
}
