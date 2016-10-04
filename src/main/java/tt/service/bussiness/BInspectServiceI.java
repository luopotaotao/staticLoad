package tt.service.bussiness;


import tt.device.handler.DeviceSerHandler;
import tt.model.business.InspectData;

public interface BInspectServiceI
{

    void add(InspectData ins)
        throws Exception;
    DeviceSerHandler getHandler();
}
