package tt.service.bussiness.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.BInspectDaoI;
import tt.dao.business.InspectPlanDaoI;
import tt.model.business.InspectData;
import tt.model.business.InspectPlan;
import tt.service.bussiness.BInspectServiceI;


@Service("bInspectServiceI")
public class BInspectServiceImpl implements BInspectServiceI {

    @Autowired
    private BInspectDaoI inspectDao;
    @Autowired
    private InspectPlanDaoI inspectPlanDao;

    @Override
    public int updateStatus(String PRG, String STZH, String DevNB) {
        return inspectDao.updateStatus(PRG, STZH, DevNB);
    }

    @Override
    public int add(InspectData ins) {
        InspectPlan plan = inspectPlanDao.getByPrgStzhDevNB(ins.getPrg(), ins.getStzh(), ins.getDevnb());
        if (plan != null) {
            ins.setDept_id(plan.getDept_id());
            ins.setPlan_id(plan.getId());
        }
        inspectDao.addIns(ins);
        return ins.getId();
    }
}
