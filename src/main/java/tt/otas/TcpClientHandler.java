package tt.otas;


import org.apache.mina.core.service.IoHandler;
import org.apache.mina.core.session.IdleStatus;
import org.apache.mina.core.session.IoSession;


/**
 * @author LLH
 * @version 1.0.0 2013-9-5 上午9:48:27
 */
public class TcpClientHandler implements IoHandler
{

    @Override
    public void exceptionCaught(IoSession session, Throwable e)
        throws Exception
    {
        session.closeNow();//.close(true);
    }

    /**
     * 当接收到消息后被触发
     */
    @Override
    public void messageReceived(IoSession session, Object obj)
        throws Exception
    {

    }

    @Override
    public void messageSent(IoSession session, Object obj)
        throws Exception
    {

    }

    @Override
    public void sessionClosed(IoSession session)
        throws Exception
    {

    }

    /**
     * 当会话创建时被触发
     */
    @Override
    public void sessionCreated(IoSession session)
        throws Exception
    {

    }

    @Override
    public void sessionIdle(IoSession session, IdleStatus status)
        throws Exception
    {

    }

    @Override
    public void sessionOpened(IoSession session)
        throws Exception
    {

    }

    @Override
    public void inputClosed(IoSession arg0)
        throws Exception
    {

    }

}
