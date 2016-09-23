package tt.util.mail;


import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import tt.listener.ServerListener;
import tt.model.TSystemConfig;
import tt.util.Constant;
import tt.util.DateUtil;
import tt.util.EncDecUtils;
import tt.util.LoadConfigFile;

import org.apache.log4j.Logger;


public class SendMail
{

    private static final Logger logger = Logger.getLogger(SendMail.class);

    // 邮件会话
    private Session session = null;

    // 系统属性对象
    private Properties properties = System.getProperties();

    // 服务器验证发送的用户名和密码
    private Authenticator authenticator = null;

    // 设置发送的SMTP服务器
    private void setSMTPHost(String smtpHost)
    {
        if (smtpHost == null)
        {
            throw new RuntimeException("[Error] SMTP Host is empty!");
        }
        properties.setProperty("mail.smtp.host", smtpHost);
    }

    // 判断字符串是否为空/长度为0
    private boolean isStringEmpty(String s)
    {
        return s == null || s.length() == 0;
    }

    // 使用SSL
    // smtp.163.com 安全类型：SSL 端口号：465 / 994
    private void enableSSL(String sslPort)
    {
        if (isStringEmpty(sslPort))
        {
            throw new RuntimeException("[Error] SSL port is empty!");
        }
        properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        properties.setProperty("mail.smtp.socketFactory.fallback", "false");
        properties.setProperty("mail.smtp.port", sslPort);
        properties.setProperty("mail.smtp.socketFactory.port", sslPort);
    }

    // 验证用户信息
    private void enableAuth(final String username, final String password)
    {
        if (username == null || password == null)
        {
            throw new RuntimeException("[Error] Username or password is empty!");
        }
        properties.put("mail.smtp.auth", "true");
        authenticator = new Authenticator()
        {
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication(username, password);
            }
        };
    }

    /**
     * @param smtpHost
     *            smtp地址:smtp.qiye.163.com
     * @param needAuth
     *            是否需要验证 true:验证 false：不验证
     * @param username
     *            用户名
     * @param password
     *            密码
     * @param isSSL
     *            是否开启ssl true：是 false：否
     * @param sslPort
     *            ssl的端口
     */
    public SendMail(String smtpHost, boolean needAuth, final String username,
                    final String password, boolean isSSL, String sslPort)
    {
        setSMTPHost(smtpHost);
        if (isSSL)
        {
            enableSSL(sslPort);
        }
        if (needAuth)
        {
            enableAuth(username, password);
        }
        session = getSession(needAuth);
    }

    public SendMail()
        throws Exception
    {
        LoadConfigFile loadconfig = LoadConfigFile.getInstance();
        String smtpHost = loadconfig.getValue("mailServerHost");
        boolean needAuth = true;
        String username = loadconfig.getValue("mailUserName");
        String password = EncDecUtils.aesDecrypt(loadconfig.getValue("mailPasswd"),
            Constant.KEYVALUE);
        boolean isSSL = Boolean.parseBoolean(loadconfig.getValue("mailOpenSSL"));
        String sslPort = loadconfig.getValue("mailServerSSLPort");
        setSMTPHost(smtpHost);
        if (isSSL)
        {
            enableSSL(sslPort);
        }
        if (needAuth)
        {
            enableAuth(username, password);
        }
        session = getSession(needAuth);
    }

    // 获取session会话
    private Session getSession(boolean needAuth)
    {
        return needAuth ? session = Session.getInstance(properties,
            authenticator) : Session.getInstance(properties);
    }

    /**
     * @param toEmailAddresses
     *            收件人
     * @param ccEmailAddresses
     *            抄送人
     * @param filenames
     *            附件
     * @param subject
     *            标题
     * @param content
     *            内容
     */
    public String send(String toEmailAddresses, String ccEmailAddresses, List<String> filenames,
                       String subject, String content)
    {
        // 设置debug打印信息
        // session.setDebug(true);
        MimeMessage message = new MimeMessage(session);
        LoadConfigFile loadconfig = LoadConfigFile.getInstance();
        try
        {
            // 设置发件人
            message.addFrom(InternetAddress.parse(loadconfig.getValue("fromAddress")));
            // 设置收件人
            message.setRecipients(Message.RecipientType.TO,
                emailToInternetAddressArray(toEmailAddresses));
            // 设置抄送人
            message.setRecipients(Message.RecipientType.CC,
                emailToInternetAddressArray(ccEmailAddresses));
            // 设置发送邮件的时间
            message.setSentDate(new Date());
            // 设置标题
            message.setSubject(subject, "UTF-8");
            // 设置内容
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            // messageBodyPart.setText(UnicodeToChinese(text));
            messageBodyPart.setContent(content, "text/html;charset=UTF-8");

            Multipart multipart = new MimeMultipart();// 附件传输格式
            multipart.addBodyPart(messageBodyPart);
            if (filenames != null)
            {
                for (int i = 0; i < filenames.size(); i++ )
                {
                    MimeBodyPart messageBodyPart2 = new MimeBodyPart();
                    // 选择出每一个附件名
                    String filename = filenames.get(i);
                    // 得到数据源
                    FileDataSource fds = new FileDataSource(filename);
                    // 得到附件本身并至入BodyPart
                    messageBodyPart2.setDataHandler(new DataHandler(fds));
                    // 得到文件名同样至入BodyPart
                    messageBodyPart2.setFileName(MimeUtility.encodeText(fds.getName()));
                    multipart.addBodyPart(messageBodyPart2);
                }
            }
            message.setContent(multipart);
            message.saveChanges();
            // 发送邮件
            Transport.send(message);
            logger.info("发送邮件成功");
        }
        catch (Exception e)
        {
            logger.info("发送邮件失败");
            logger.error("发送邮件失败", e);
            if (e.getMessage().equals("Invalid Addresses"))
            {
                return "邮箱地址不正确,邮件发送失败!";
            }
            return e.getMessage();
        }
        return "success";

    }

    private InternetAddress[] emailToInternetAddressArray(String email)
        throws AddressException
    {
        if (email == null || 0 == email.length())
        {
            return new InternetAddress[0];
        }
        String[] emails = email.split(",");
        InternetAddress[] addresses = new InternetAddress[emails.length];
        for (int i = 0; i < emails.length; i++ )
        {
            addresses[i] = new InternetAddress(emails[i]);
        }
        return addresses;
    }

    public void SendUserLockMail(String username)
        throws Exception
    {
        String toAddress = "";
        if (ServerListener.sysConfigMap.containsKey("TO_ADDRESS"))
        {
            TSystemConfig tSystemConfig = ServerListener.sysConfigMap.get("TO_ADDRESS");
            toAddress = tSystemConfig.getConfContext();
        }
        if (toAddress == null || toAddress.equals(""))
        {
            logger.error("[信息]-系统参数中没有 key为 TO_ADDRESS 的信息或TO_ADDRESS的值为空");
            logger.error("发送邮件失败！");
            return;
        }

        send(toAddress, null, null, "账户锁定通知",
            "<pre>管理员，你好：<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;" + username + "用户账号在"
                                              + DateUtil.format(new Date()) + "被锁定了。</pre>");
    }

    /**
     * 给用户发送账户密码 add by zhangxh 2015-11-22 17:07:01
     * 
     * @Description:
     * @Check
     * @param content
     * @return
     * @throws Exception
     */
    public String SendPwdmail(String content, String toAddress)
        throws Exception
    {

        return send(toAddress, null, null, "密码通知", content);

    }

}
