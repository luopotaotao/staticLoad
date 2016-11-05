package tt.service.bussiness;


import tt.device.handler.DeviceSerHandler;
import tt.model.business.InspectData;

public interface BInspectServiceI
{

    void add(InspectData ins)
        throws Exception;
    void updateStatus(String PRG, String STZH, String DevNB)
            throws Exception;
    DeviceSerHandler getHandler();
}
