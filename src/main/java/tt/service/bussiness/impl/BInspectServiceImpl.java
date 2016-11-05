package tt.service.bussiness.impl;


import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.BInspectDaoI;
import tt.device.handler.DeviceSerHandler;
import tt.model.business.InspectData;
import tt.service.bussiness.BInspectServiceI;


@Service("bInspectServiceI")
public class BInspectServiceImpl implements BInspectServiceI,BeanFactoryAware 
{

    @Autowired
    private BInspectDaoI inspectDao;
    @Override
    public void updateStatus(String PRG, String STZH, String DevNB)
            throws Exception
    {
        inspectDao.updateStatus(PRG, STZH, DevNB);
    }
    @Override
    public void add(InspectData ins)
        throws Exception
    {
        inspectDao.addIns(ins);
    }


    private BeanFactory factory;
    public DeviceSerHandler getHandler(){
        return factory.getBean(DeviceSerHandler.class);
    };

    @Override
    public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
        factory = beanFactory;
    }
}
