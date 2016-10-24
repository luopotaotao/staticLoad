package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.EquipmentDaoI;
import tt.model.business.Equipment;
import tt.service.bussiness.EquipmentServiceI;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */
@Service("equipmentService")
public class EquipmentServiceImpl implements EquipmentServiceI {
    @Autowired
    private EquipmentDaoI equipmentDao;

    @Override
    public Equipment get(Integer id, Integer dept_id) {
        return equipmentDao.getById(id, dept_id);
    }


    @Override
    public List<Equipment> list(Map<String, Object> params,Integer page,Integer pageSize, Integer dept_id) {
        Integer institution_id = (Integer) params.get("institution_id");
        String name = (String) params.get("name");
        List<Equipment> ret = equipmentDao.list(institution_id, name,dept_id);
        return ret;
    }

    @Override
    public Equipment add(Equipment equipment, Integer dept_id) {
        equipment.setDept_id(dept_id);
        equipmentDao.save(equipment);
        return equipment;
    }

    @Override
    public int del(List<Integer> ids, Integer dept_id) {
        if (ids == null || ids.size() < 1) {
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("ids", ids);
        params.put("dept_id",dept_id);
        return equipmentDao.executeHql("delete from Equipment where id in (:ids) and dept_id=:dept_id", params);
    }

    @Override
    public Equipment update(Equipment equipment, Integer dept_id) {
        equipment.setDept_id(dept_id);
        equipmentDao.update(equipment);
        return equipment;
    }
}
