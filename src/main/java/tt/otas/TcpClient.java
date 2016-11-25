//package tt.otas;
//
//
//import java.net.InetSocketAddress;
//import java.util.concurrent.TimeUnit;
//
//import org.apache.log4j.Logger;
//import org.apache.mina.core.future.ConnectFuture;
//import org.apache.mina.core.future.ReadFuture;
//import org.apache.mina.core.future.WriteFuture;
//import org.apache.mina.core.session.IoSession;
//import org.apache.mina.filter.codec.ProtocolCodecFilter;
//import org.apache.mina.filter.codec.serialization.ObjectSerializationCodecFactory;
//import org.apache.mina.transport.socket.nio.NioSocketConnector;
//
//import com.crb.log.Log;
//
//
///**
// * TCP客户端,支持同步与异步
// *
// * @author LLH
// * @version 1.0.0 2013-9-5 上午9:10:07
// */
//public class TcpClient
//{
//
//    private static final Logger logger = Logger.getLogger(TcpClient.class);
//
//    // private static TcpClient TC = new TcpClient();
//
//    private NioSocketConnector connector;
//
//    /**
//     * 服务器端IP
//     */
//    private static String ip;
//
//    /**
//     * 服务器端口
//     */
//    private static int port;
//
//    /*
//     * 读/写超时时间
//     */
//    private static int idleTime = 30;
//
//    /*
//     * 连接超时时间
//     */
//    private static long connectTimeout = 30000;
//
//    /**
//     * get instance
//     *
//     * @return
//     */
//    public static TcpClient getInstance(String ip, int port, int idleTime, long connectTimeout)
//    {
//        if (idleTime < 10)
//        {
//            idleTime = 10;
//        }
//        if (connectTimeout < 10000)
//        {
//            connectTimeout = 10000;
//        }
//        TcpClient.ip = ip;
//        TcpClient.port = port;
//        TcpClient.idleTime = idleTime;
//        TcpClient.connectTimeout = connectTimeout;
//        return new TcpClient();
//    }
//
//
//
//    private TcpClient()
//    {
//        try
//        {
//            connector = new NioSocketConnector();
//            connector.getSessionConfig().setReadBufferSize(2048);
//            connector.getSessionConfig().setBothIdleTime(idleTime);
//            connector.setConnectTimeoutMillis(connectTimeout);
//            connector.getFilterChain().addLast("codec",
//                new ProtocolCodecFilter(new ObjectSerializationCodecFactory()));
//            connector.setHandler(new TcpClientHandler());
//        }
//        catch (Exception e)
//        {
//            Log.error("", TcpClient.class, "实例化客户端连接器异常!", e);
//            if (connector != null)
//            {
//                connector.dispose();
//                connector = null;
//            }
//        }
//    }
//
//    public void close()
//    {
//        if (connector != null)
//        {
//            logger.info("销毁连接池");
//            connector.dispose();
//            connector = null;
//        }
//    }
//
//    /**
//     * 向服务器端发送数据,异步方式
//     *
//     * @param data
//     *            需发送的数据
//     * @param obj
//     *            需存储的任务信息(信息将存储在IoSession中,以'msisdn'作为主键)
//     * @return
//     */
//    // public boolean sendDataAsyn(Object data, Object obj) {
//    // if (Log.isDebugEnabled()) {
//    // Log.debug(null, TcpClient.class, "sendDataAsyn(): --->(" + ip + ":"
//    // + port + "), data=" + data);
//    // }
//    // if (data == null) {
//    // return false;
//    // }
//    // IoSession session = getSession((String) obj);
//    //
//    // if (obj != null) {
//    // session.setAttribute("msisdn", obj);
//    // }
//    // session.write(data);
//    // return true;
//    // }
//
//    /**
//     * 向客户端发送数据,同步方式
//     *
//     * @param data
//     *            需要传递对象
//     * @return
//     */
//    public Object sendDataSyn(Object data)
//    {
//        if (Log.isDebugEnabled())
//        {
//            Log.debug("", TcpClient.class,
//                "sendDataSyn(): >>>(" + ip + ":" + port + "), data=" + data);
//        }
//        IoSession session = getSession();
//        if (session == null)
//        {
//            return null;
//        }
//
//        try
//        {
//            session.getConfig().setUseReadOperation(true);
//            WriteFuture wf = session.write(data);
//            wf.awaitUninterruptibly();
//
//            ReadFuture rf = session.read();
//            if (rf.awaitUninterruptibly(idleTime, TimeUnit.SECONDS))
//            {
//                logger.info(rf.getMessage());
//                return rf.getMessage();
//            }
//            else
//            {
//                Log.error("", TcpClient.class, "sendDataSyn(): 对端系统响应数据超时!");
//                return null;
//            }
//        }
//        catch (Exception e)
//        {
//            Log.error("", TcpClient.class, "sendDataSyn(): 发送数据异常!", e);
//        }
//        finally
//        {
//            try
//            {
//                logger.info("关闭连接");
//                session.closeNow();
//                // close();
//            }
//            catch (Exception e)
//            {
//                e.printStackTrace();
//            }
//        }
//        return null;
//    }
//
//    /*
//     * 获取连接会话
//     */
//    private IoSession getSession()
//    {
//        ConnectFuture futrue = null;
//        IoSession session = null;
//        int i = 0;
//        do
//        {
//            try
//            {
//                futrue = connector.connect(new InetSocketAddress(ip, port));
//                futrue.awaitUninterruptibly();
//                session = futrue.getSession();
//                break;
//            }
//            catch (Exception e)
//            {
//                Log.error("", TcpClient.class,
//                    "getSession(): Failed to connect(" + ip + ":" + port + "),try again...");
//                try
//                {
//                    Thread.sleep(2000);
//                }
//                catch (InterruptedException e1)
//                {
//                    e1.printStackTrace();
//                }
//            }
//            i++ ;
//        }
//        while (i < 3);
//        return session;
//    }
//}
