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
    public Equipment get(int id) {
        return equipmentDao.get(Equipment.class, id);
    }


    @Override
    public List<Equipment> list(Integer institution_id, String name) {
        List<Equipment> ret = equipmentDao.list(institution_id, name);
        return ret;
    }

    @Override
    public int add(Equipment equipment) {
        equipmentDao.save(equipment);
        return 1;
    }

    @Override
    public int del(List<Integer> ids) {
        if (ids == null || ids.size() < 1) {
            return 0;
        }
        Map<String, Object> params = new HashMap<>();
        params.put("ids", ids);
        return equipmentDao.executeHql("delete from Equipment where id in (:ids)", params);
    }

    @Override
    public int update(Equipment equipment) {
        equipmentDao.update(equipment);
        return 1;
    }
}
