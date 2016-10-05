package tt.dao.business;

import tt.dao.BaseDaoI;
import tt.model.business.InspectItem;

import java.util.List;

/**
 * Created by taotao on 2016/9/23.
 */
public interface InspectItemDaoI extends BaseDaoI<InspectItem> {
    List<InspectItem> list(String name, Integer page, Integer pageSize);
}
