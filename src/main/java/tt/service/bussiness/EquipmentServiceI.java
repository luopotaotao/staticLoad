package tt.service.bussiness;

import tt.model.business.Equipment;

import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
public interface EquipmentServiceI {
    Equipment get(int id);
    List<Equipment> list(Integer institution_id, String name);
    int add(Equipment inspectEquipment);
    int del(List<Integer> ids);
    int update(Equipment inspectEquipment);
}
