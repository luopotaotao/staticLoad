package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import tt.dao.business.AreaDaoI;
import tt.model.business.Area;
import tt.service.bussiness.AreaServiceI;

/**
 * Created by tt on 2016/9/29.
 */
@Service("areaService")
public class AreaServiceImpl implements AreaServiceI {
    @Autowired
    private AreaDaoI areaDaoI;

    @Override
    public Area load(Integer id) {
        Area ret = areaDaoI.get(Area.class,id);
        return ret;
    }

    @Override
    public Area add(Area area) {
        Area parent = areaDaoI.get(Area.class,area.getParent().getId());
        area.setLevel((byte) (parent.getLevel()+1));
        areaDaoI.save(area);
        return area;
    }

    @Override
    public Area update(Area area) {
        areaDaoI.update(area);
        return area;
    }

    @Override
    public int del(Integer id) {
        Area area = load(id);
        areaDaoI.delete(area);
        return area.getId();
    }
}
