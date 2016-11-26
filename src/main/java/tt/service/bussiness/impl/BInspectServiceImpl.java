package tt.service.bussiness.impl;


import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.BInspectDaoI;
import tt.dao.business.InspectPlanDaoI;
import tt.device.handler.DeviceSerHandler;
import tt.model.business.InspectData;
import tt.model.business.InspectPlan;
import tt.service.bussiness.BInspectServiceI;


@Service("bInspectServiceI")
public class BInspectServiceImpl implements BInspectServiceI, BeanFactoryAware {

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


    private BeanFactory factory;

    public DeviceSerHandler getHandler() {
        return factory.getBean(DeviceSerHandler.class);
    }

    ;

    @Override
    public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
        factory = beanFactory;
    }
}
