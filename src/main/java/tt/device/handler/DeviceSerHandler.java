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
import com.alibaba.fastjson.JSONException;

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
        String addr = socket.getRemoteSocketAddress() + "";
        try {  
            byte[] buf = new byte[1024];
            int len = 0;
            InputStream input = socket.getInputStream();
            while((len = input.read(buf))!=-1){
                //请求
                String req = new String(buf,0,len,"gbk");
                logger.info("收到【" + addr +"】设备报文:" + req);
                if("$LRK01$END".equals(req))
                {
                    //本次压测结束
                    logger.info("本次压测结束");
                    return;
                }
                // 请求bean
                InspectData ins = JSON.parseObject(req, InspectData.class);
//                logger.info(ins.toString());
                //数据入库
                bInspectServiceI.add(ins);
                // 响应
                String res = "$LRK01$OKOK0x0d";
                socket.getOutputStream().write(res.getBytes("gbk"));
            }
            
        }
        catch(JSONException j)
        {
            // 响应
            try
            {
                socket.getOutputStream().write("报文格式错误！".getBytes("gbk"));
            }
            catch (Exception e)
            {
                logger.error(e);
            }
            logger.error(j);
        }catch (Exception e) {
            // 响应
            try
            {
                socket.getOutputStream().write("服务器异常，请查看服务器日志！".getBytes("gbk"));
            }
            catch (Exception e1)
            {
                logger.error(e1);
            }
            e.printStackTrace();  
        }
        finally
        {
            closeSocket(socket);
        }
    }

    void closeSocket(Socket s)
    {
        String addr = socket.getRemoteSocketAddress() + "";
        logger.info("关闭Device addres:" + addr);
        if (s != null)
        {
            try
            {
                s.close();
                s = null;
            }
            catch (Exception ex)
            {
                ex.printStackTrace();
            }
            logger.info("已关闭" + addr);
        }
    }
}  