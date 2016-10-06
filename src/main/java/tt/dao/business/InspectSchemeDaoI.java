package tt.dao.business;

import tt.dao.BaseDaoI;
import tt.model.business.InspectScheme;

import java.util.List;

/**
 * Created by taotao on 2016/9/23.
 */
public interface InspectSchemeDaoI extends BaseDaoI<InspectScheme> {
    List<InspectScheme> list(String name, Integer page, Integer pageSize);
}
