package tt.service.bussiness.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.AreaDaoI;
import tt.model.business.Area;
import tt.service.bussiness.AreaServiceI;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by tt on 2016/9/29.
 */
@Service("areaService")
public class AreaServiceImpl implements AreaServiceI {
    @Autowired
    private AreaDaoI areaDao;

    @Override
    public Area load(Integer id) {
        Area ret = areaDao.get(Area.class,id);
        return ret;
    }

    @Override
    public Area add(Area area) {
        Area parent = areaDao.get(Area.class,area.getParent().getId());
        area.setLevel((byte) (parent.getLevel()+1));
        areaDao.save(area);
        return area;
    }

    @Override
    public Area update(Area area) {
        areaDao.update(area);
        return area;
    }

    @Override
    public int del(Integer id) {
        Area area = load(id);
        areaDao.delete(area);
        return area.getId();
    }

    @Override
    public List<Map<String, Object>> queryAreaByPid(Integer pid) {
        Map<String,Object> params = new HashMap<>();
        params.put("pid",pid);
        return areaDao.findList("select new map(a.id as id,a.text as text) from Area a where pid=:pid",params);
    }
}
