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
    public Area get(Integer id,Integer dept_id) {
        Area ret = areaDao.getById(id,dept_id);
        return ret;
    }

    @Override
    public Area add(Area area, Integer dept_id) {
        Area parent = areaDao.get(Area.class,area.getParent().getId());
        area.setLevel((byte) (parent.getLevel()+1));
        area.setParent(parent);
        areaDao.save(area);
        return area;
    }

    @Override
    public Area update(Area area, Integer dept_id) {
        areaDao.update(area);
        return area;
    }

    @Override
    public int del(Integer id,Integer dept_id) {
        return areaDao.del(id,dept_id);
    }
    @Override
    public int del(List<Integer> ids, Integer dept_id) {
        if(ids==null||ids.size()<1){
            return 0;
        }
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("ids", ids);
        params.put("dept_id",dept_id);
        return areaDao.executeHql("delete from Area where id in (:ids) and dept_id=:dept_id", params);
    }

    /**
     *
     * @param pid pid为0时,查找level为0,也就是全国下面的省份
     * @param dept_id
     * @return
     */
    @Override
    public List<Map<String, Object>> queryAreaByPid(Integer pid,Integer dept_id) {
        String sql = null;
        Map<String,Object> params = new HashMap<>();
        if(pid==0){
            params.put("level",(byte)1);
            sql = "select new map(a.id as id,a.text as text) from Area a where level=:level and dept_id=:dept_id";
        }else{
            params.put("pid",pid);
            sql = "select new map(a.id as id,a.text as text) from Area a where pid=:pid and dept_id=:dept_id";
        }
        params.put("dept_id",dept_id);

        return areaDao.findList(sql,params);
    }

    @Override
    public List<Area> list(Map<String, Object> params, Integer page, Integer pageSize, Integer dept_id) {
        return null;
    }

    @Override
    public long count(Map<String, Object> params, Integer dept_id) {
        return 0;
    }
}
