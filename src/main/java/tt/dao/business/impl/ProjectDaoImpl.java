package tt.dao.business.impl;

import org.springframework.stereotype.Repository;
import tt.dao.business.ProjectDaoI;
import tt.dao.impl.BaseDaoImpl;
import tt.model.business.Project;

/**
 * Created by tt on 2016/9/29.
 */
@Repository("projectDao")
public class ProjectDaoImpl extends BaseDaoImpl<Project> implements ProjectDaoI {
}
