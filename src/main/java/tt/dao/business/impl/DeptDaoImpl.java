package tt.dao.business.impl;

import org.springframework.stereotype.Repository;
import tt.dao.business.DeptDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.Dept;

/**
 * Created by taotao on 2016/9/23.
 */
@Repository("deptDao")
public class DeptDaoImpl extends BaseDaoImpl<Dept> implements DeptDaoI {
}
