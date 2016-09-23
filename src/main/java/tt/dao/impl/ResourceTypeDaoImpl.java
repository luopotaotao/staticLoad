package tt.dao.impl;


import tt.dao.ResourceTypeDaoI;
import tt.model.Tresourcetype;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;


@Repository
public class ResourceTypeDaoImpl extends BaseDaoImpl<Tresourcetype> implements ResourceTypeDaoI
{

    @Override
    @Cacheable(value = "resourceTypeDaoCache", key = "#id")
    public Tresourcetype getById(String id)
        throws Exception
    {
        return super.get(Tresourcetype.class, id);
    }

}
