package tt.dao.business.impl;


import tt.dao.business.BInspectDaoI;
import org.springframework.stereotype.Repository;
import tt.model.business.InspectData;
import tt.dao.impl.BaseDaoImpl;


@Repository
public class BInspectDaoImpl extends BaseDaoImpl<InspectData> implements BInspectDaoI
{
    @Override
    public void addIns(InspectData ins)
    {
        this.save(ins);
    }
}
