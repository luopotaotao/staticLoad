package tt.device.handler;

import com.alibaba.fastjson.JSON;
import com.sun.org.apache.xalan.internal.xsltc.util.IntegerArray;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import tt.model.business.InspectData;
import tt.service.bussiness.BInspectServiceI;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.Socket;

import com.alibaba.fastjson.JSONException;

@Component("deviceSerHandler")
@Scope("prototype")
public class DeviceSerHandler implements Runnable {
    String PRG;
    String STZH;
    String DevNB;
    private static final Logger logger = Logger.getLogger(DeviceSerHandler.class);

    @Autowired
    private BInspectServiceI bInspectServiceI;

    private Socket socket;

    public DeviceSerHandler() {
    }

    public DeviceSerHandler(Socket socket) {
        this.socket = socket;
    }

    public void setSocket(Socket socket) {
        this.socket = socket;
    }

    @Override
    public void run() {
        String addr = socket.getRemoteSocketAddress() + "";
        byte[] buf = new byte[1024];
        int len = 0;
        try (InputStream input = socket.getInputStream()) {

            while ((len = input.read(buf)) != -1) {
                // 请求
                String req = null;
                try {
                    req = new String(buf, 0, len, "gbk");
                } catch (UnsupportedEncodingException e) {
                    sendMsg("socket 解析gbk编码错误", e);
                    return;
                }
                logger.info("收到【" + addr + "】设备报文:" + req);
                if ("$LRK01$END".equals(req)) {
                    // 本次压测结束
                    logger.info("本次压测结束");
                    int count = bInspectServiceI.updateStatus(PRG, STZH, DevNB);
                    if (count > 0) {
                        // 响应成功
                        sendMsg("$LRK01$OK0x0d");
                        closeSocket(socket);
                    } else {
                        sendMsg("更新数据库失败,请联系管理员处理!", new Exception(String.format("标记完成失败!工程:%s,桩号:%s,设备号:%s", PRG, STZH, DevNB)));
                    }
                    return;
                }
                InspectData ins = null;
                try {
                    ins = JSON.parseObject(req, InspectData.class);
                    if(ins.getPrg()==null||ins.getPrg().trim().isEmpty()){
                        dataFormatErr("工程编号","PRG");
                        return;
                    }
                    if(ins.getStzh()==null||ins.getStzh().trim().isEmpty()){
                        dataFormatErr("桩号","STZH");
                        return;
                    }
                    if(ins.getDevnb()==null||ins.getDevnb().trim().isEmpty()){
                        dataFormatErr("设备编号","DevNB");
                        return;
                    }
                } catch (JSONException j) {
                    sendMsg("报文格式错误！",j);
                    return;
                }
                ins.setStatus(1);
                PRG = ins.getPrg();
                STZH = ins.getStzh();
                DevNB = ins.getDevnb();
                //TODO 根据prg,stzh,devNB查找计划,如果没有计划,返回错误信息
                Integer id = bInspectServiceI.add(ins);
                if (id != null && id > 0) {
                    // 响应成功
                    sendMsg("$LRK01$OK0x0d");
                } else {
                    // 响应失败
                    sendMsg("保存失败,请联系管理员!");
                }
            }
        } catch (IOException e) {
            sendMsg("服务器异常，请查看服务器日志！");
            logger.error(e.getStackTrace());
        }

    }

    void closeSocket(Socket s) {
        if (s != null) {
            String addr = socket.getRemoteSocketAddress() + "";
            logger.info("关闭Device addres:" + addr);
            if(!s.isClosed()){
                try {
                    s.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            logger.info("已关闭" + addr);
        }
    }

    private void sendMsg(String msg) {
        try {
            this.socket.getOutputStream().write(msg.getBytes("gbk"));
        } catch (IOException e) {
            logger.error(e.getStackTrace());
        }
    }

    private void sendMsg(String msg, Exception e) {
        sendMsg(msg);
        logger.error(e.getStackTrace());
    }
    private void dataFormatErr(String name,String field){
        sendMsg(String.format("报文格式错误:需要有字段 %s:%s,且值不能为空", name,field));
    }
}