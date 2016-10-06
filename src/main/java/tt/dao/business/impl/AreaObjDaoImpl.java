package tt.dao.business.impl;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;
import tt.dao.business.AreaObjDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.Area;
import tt.model.business.AreaObj;

import java.io.Serializable;
import java.util.List;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("areaObjDao")
public class AreaObjDaoImpl extends BaseDaoImpl<AreaObj> implements AreaObjDaoI {
    @Override
    public AreaObj get(Integer id) {
        return super.getById(id);
    }
}
