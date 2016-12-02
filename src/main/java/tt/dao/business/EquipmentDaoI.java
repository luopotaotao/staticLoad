package tt.dao.business;

import tt.dao.BaseDaoI;
import tt.model.business.Equipment;

import java.util.List;

/**
 * Created by taotao on 2016/9/23.
 */
public interface EquipmentDaoI extends BaseDaoI<Equipment> {
    List<Equipment> list(Integer institution_id, String name,Integer dept_id);
    Equipment loadByCode(String coded);
}
