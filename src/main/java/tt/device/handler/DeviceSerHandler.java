package tt.device.handler;

import com.alibaba.fastjson.JSON;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import tt.model.business.InspectData;
import tt.service.bussiness.BInspectServiceI;

import java.io.InputStream;
import java.net.Socket;

@Component("deviceSerHandler")
@Scope("prototype")
public class DeviceSerHandler implements Runnable { 
    private static final Logger logger = Logger.getLogger(DeviceSerHandler.class);
    
    @Autowired
    private BInspectServiceI bInspectServiceI;
    
    private Socket socket;  

    public DeviceSerHandler() {}  
    
    public DeviceSerHandler(Socket socket) {  
        this.socket = socket;  
    }  

    public void setSocket(Socket socket)
    {
        this.socket = socket;
    }

    @Override  
    public void run() {  
        try {  
            byte[] buf = new byte[1024];
            int len = 0;
            InputStream input = socket.getInputStream();
            while((len = input.read(buf))!=-1){
                //请求
                String req = new String(buf,0,len,"gbk");
//                logger.info("rec:" + req);
                // 请求bean
                InspectData ins = JSON.parseObject(req, InspectData.class);
                logger.info(ins.toString());
                bInspectServiceI.add(ins);
                //响应
                String res = "" + "OK0x0d";
                socket.getOutputStream().write(res.getBytes("gbk"));
            }
            
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
}  