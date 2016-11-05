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
    @Override
    public void updateStatus(String PRG, String STZH, String DevNB)
    {
        String sql = "UPDATE `b_inspect_data` t SET t.`status`='2' WHERE t.`DevNB`='"+DevNB+"' AND t.`PRG`='"+PRG+"' AND t.`STZH`='"+STZH+"'";
        this.executeSql(sql);

    }
}
