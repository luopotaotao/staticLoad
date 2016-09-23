package tt.util.mail;


import java.util.Date;
import java.util.Properties;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;


/**
 * 简单邮件（不带附件的邮件）发送器
 */
public class SimpleMailSender
{

    public boolean sendTextMail(MailSenderInfo mailInfo)
    {
        try
        {
            JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
            SimpleMailMessage mailMessage = new SimpleMailMessage(); // 建立邮件消息
            senderImpl.setUsername(mailInfo.getUserName()); // 设置username
            senderImpl.setPassword(mailInfo.getPassword()); // 设置password
            mailMessage.setFrom(mailInfo.getFromAddress());
            String[] address = new String[mailInfo.getToAddress().length]; // 创建邮件的接收者地址，并设置到邮件消息中
            for (int i = 0; i < mailInfo.getToAddress().length; i++ )
            {
                address[i] = new String(mailInfo.getToAddress()[i]);
            }
            mailMessage.setTo(address);
            mailMessage.setSubject(mailInfo.getSubject()); // 设置邮件消息的主题
            mailMessage.setSentDate(new Date()); // 设置邮件消息发送的时间
            String mailContent = mailInfo.getContent(); // 设置邮件消息的主要内容
            mailMessage.setText(mailContent);
            Properties prop = mailInfo.getProperties();
            prop.put("mail.smtp.timeout", "25000");
            prop.put("mail.smtp.starttls.enable", "false");
            prop.put("mail.smtp.socketFactory.port", "465");
            prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            prop.put("mail.smtp.socketFactory.fallback", "false");
            senderImpl.setJavaMailProperties(prop);
            senderImpl.send(mailMessage); // 发送邮件
            return true;
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
        return false;
    }

    /**
     * 以HTML格式发送邮件
     * 
     * @param mailInfo
     *            待发送的邮件信息
     */
    public boolean sendHtmlMail(MailSenderInfo mailInfo)
    {
        try
        {
            JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
            MimeMessage mailMessage = senderImpl.createMimeMessage(); // 建立邮件消息,发送简单邮件和html邮件的区别
            MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage, true, "utf-8");
            senderImpl.setUsername(mailInfo.getUserName()); // 设置username
            senderImpl.setPassword(mailInfo.getPassword()); // 设置password
            InternetAddress from = new InternetAddress(mailInfo.getFromAddress());
            messageHelper.setFrom(from);
            InternetAddress[] address = new InternetAddress[mailInfo.getToAddress().length]; // 创建邮件的接收者地址，并设置到邮件消息中
            for (int i = 0; i < mailInfo.getToAddress().length; i++ )
            {
                address[i] = new InternetAddress(mailInfo.getToAddress()[i]);
            }
            messageHelper.setTo(address);
            messageHelper.setSubject(mailInfo.getSubject()); // 设置邮件消息的主题
            messageHelper.setSentDate(new Date()); // 设置邮件消息发送的时间
            messageHelper.setText(mailInfo.getContent(), true);
            Properties prop = mailInfo.getProperties();
            prop.put("mail.smtp.timeout", "25000");
            prop.put("mail.smtp.starttls.enable", "false");
            prop.put("mail.smtp.socketFactory.port", "465");
            prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            prop.put("mail.smtp.socketFactory.fallback", "false");
            senderImpl.setJavaMailProperties(prop);
            senderImpl.send(mailMessage); // 发送邮件
            return true;
        }
        catch (MessagingException ex)
        {
            ex.printStackTrace();
        }
        return false;
    }

}
