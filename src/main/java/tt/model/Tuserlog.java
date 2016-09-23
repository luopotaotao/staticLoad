package tt.model;


// default package
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.bytecode.internal.javassist.FieldHandled;
import org.hibernate.bytecode.internal.javassist.FieldHandler;


/**
 * TUserLog entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_user_log")
public class Tuserlog implements java.io.Serializable, FieldHandled
{
    /**
     * 意义，目的和功能，以及被用到的地方<br>
     */
    private static final long serialVersionUID = -3007278496020275960L;

    // Fields
    private String userLogId;

    private String formContent;

    private String adminName;

    private String text;

    private Date createTime;

    private String url;

    private String userIp;

    // Constructors
    /** default constructor */
    public Tuserlog()
    {}

    public Tuserlog(String adminName)
    {
        this.adminName = adminName;
    }

    public Tuserlog(String userLogId, String adminName, String text, Date createTime, String url,
                    String userIp)
    {
        this.userLogId = userLogId;
        this.adminName = adminName;
        this.text = text;
        this.createTime = createTime;
        this.url = url;
        this.userIp = userIp;
    }

    /** minimal constructor */
    public Tuserlog(String userLogId, String adminName, String text, Date createTime, String url)
    {
        this.userLogId = userLogId;
        this.adminName = adminName;
        this.text = text;
        this.createTime = createTime;
        this.url = url;
    }

    /** full constructor */
    public Tuserlog(String userLogId, String formContent, String adminName, String text,
                    Date createTime, String url, String userIp)
    {
        this.userLogId = userLogId;
        this.formContent = formContent;
        this.adminName = adminName;
        this.text = text;
        this.createTime = createTime;
        this.url = url;
        this.userIp = userIp;
    }

    // Property accessors
    @Id
    @Column(name = "USER_LOG_ID", unique = true, nullable = false, length = 36)
    public String getUserLogId()
    {
        return this.userLogId;
    }

    public void setUserLogId(String userLogId)
    {
        this.userLogId = userLogId;
    }

    @Basic(fetch = FetchType.LAZY)
    @Column(name = "FORM_CONTENT", columnDefinition = "longtext")
    public String getFormContent()
    {
        if (fieldHandler != null)
        {
            return (String)(fieldHandler.readObject(this, "formContent", formContent));
        }
        return this.formContent;
    }

    public void setFormContent(String formContent)
    {
        this.formContent = formContent;
    }

    @Column(name = "ADMIN_NAME", nullable = false, length = 20)
    public String getAdminName()
    {
        return this.adminName;
    }

    public void setAdminName(String adminName)
    {
        this.adminName = adminName;
    }

    @Column(name = "TEXT", nullable = false, length = 100)
    public String getText()
    {
        return this.text;
    }

    public void setText(String text)
    {
        this.text = text;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CREATE_TIME", nullable = false, length = 19)
    public Date getCreateTime()
    {
        return this.createTime;
    }

    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }

    @Column(name = "URL", nullable = false, length = 200)
    public String getUrl()
    {
        return this.url;
    }

    public void setUrl(String url)
    {
        this.url = url;
    }

    @Column(name = "USER_IP", length = 15)
    public String getUserIp()
    {
        return this.userIp;
    }

    public void setUserIp(String userIp)
    {
        this.userIp = userIp;
    }

    private FieldHandler fieldHandler;

    @Override
    public FieldHandler getFieldHandler()
    {
        return fieldHandler;
    }

    @Override
    public void setFieldHandler(FieldHandler fieldHandler)
    {
        this.fieldHandler = fieldHandler;
    }
}