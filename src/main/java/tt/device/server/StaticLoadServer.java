package tt.device.server;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tt.device.handler.DeviceSerHandler;
import tt.service.bussiness.BInspectServiceI;
import tt.util.LoadConfigFile;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


@Component
public class StaticLoadServer
{
    private static final Logger logger = Logger.getLogger(StaticLoadServer.class);

    @Autowired
    private BInspectServiceI bInspectServiceI;

    private ServerSocket serverSocket; //

    private ExecutorService servicePool; // 线程池

    private int port = 9905;//端口

    private int threadPoolSize = 15;

    public StaticLoadServer()
    {
        LoadConfigFile loadconfig = LoadConfigFile.getInstance();
        //读取配置文件中的端口
        String deviceServerPort = loadconfig.getValue("deviceServerPort");
        String devicePoolSize = loadconfig.getValue("threadPoolSize");
        if (deviceServerPort != null)
        {
            port = Integer.parseInt(deviceServerPort);
        }
        if(devicePoolSize != null)
        {
            threadPoolSize = Integer.parseInt(devicePoolSize);
        }

        try
        {
            logger.info("开启设备服务，监听端口：" + port + ",线程池线程初始数：" + threadPoolSize);
            this.serverSocket = new ServerSocket(port);
            this.servicePool = Executors.newFixedThreadPool(threadPoolSize);
            this.servicePool.execute(new InitHandler());
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }

    public StaticLoadServer(int port)
    {
        logger.info("开启设备服务，监听端口：" + port);
        try
        {
            this.serverSocket = new ServerSocket(port);
            this.servicePool = Executors.newFixedThreadPool(threadPoolSize);
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }

    class InitHandler implements Runnable
    {
        @Override
        public void run()
        {
            service();
        }
    }

    public void service()
    {
        while (true)
        {
            try
            {
                Socket socket = this.serverSocket.accept(); // 接受到一个连接，并且返回一个客户端的Socket对象实例
                DeviceSerHandler handler = new DeviceSerHandler();
//                DeviceSerHandler handler = bInspectServiceI.getHandler();
                handler.setSocket(socket);
                this.servicePool.execute(handler);
                logger.info("Device addres:" + socket.getRemoteSocketAddress() +" is connecting to the Server");
            }
            catch (IOException e)
            {
                e.printStackTrace();
                this.servicePool.shutdown();
            }
        }
    }

    public static void main(String[] args)
    {
        StaticLoadServer ser = new StaticLoadServer(9905);
        ser.service();
    }
}