package tt.dao.business.impl;

import org.springframework.stereotype.Repository;
import tt.dao.business.FileDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.File;

/**
 * Created by tt on 2016/11/28.
 */
@Repository("fileDao")
public class FileDaoImpl extends BaseDaoImpl<File> implements FileDaoI {
}
