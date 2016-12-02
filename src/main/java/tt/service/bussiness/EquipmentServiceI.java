package tt.service.bussiness;

import tt.model.business.Equipment;

import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
public interface EquipmentServiceI extends BaseService<Equipment>{
    Equipment loadEquipmentByCode(String code);
//    List<Equipment> list(Integer dept_id, String name,Integer dept_id);
//TODO 额外参数
}
