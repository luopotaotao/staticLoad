package tt.model;


// default package

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * TBusinessConfig entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_business_config")
public class TBusinessConfig implements java.io.Serializable
{

    /**
     * 意义，目的和功能，以及被用到的地方<br>
     */
    private static final long serialVersionUID = 1161777498138709401L;

    // Fields

    private String confId;

    private String confName;

    private String confContext;

    private String confDesc;

    private Date updateTime;

    private String adminName;

    private Short dataVerFalg;

    // Constructors

    /** default constructor */
    public TBusinessConfig()
    {}

    /** minimal constructor */
    public TBusinessConfig(String confId, String confName, Date updateTime, String adminName,
                           Short dataVerFalg)
    {
        this.confId = confId;
        this.confName = confName;
        this.updateTime = updateTime;
        this.adminName = adminName;
        this.dataVerFalg = dataVerFalg;
    }

    /** full constructor */
    public TBusinessConfig(String confId, String confName, String confContext, String confDesc,
                           Date updateTime, String adminName, Short dataVerFalg)
    {
        this.confId = confId;
        this.confName = confName;
        this.confContext = confContext;
        this.confDesc = confDesc;
        this.updateTime = updateTime;
        this.adminName = adminName;
        this.dataVerFalg = dataVerFalg;
    }

    // Property accessors
    @Id
    @Column(name = "CONF_ID", unique = true, nullable = false, length = 50)
    public String getConfId()
    {
        return this.confId;
    }

    public void setConfId(String confId)
    {
        this.confId = confId;
    }

    @Column(name = "CONF_NAME", nullable = false, length = 50)
    public String getConfName()
    {
        return this.confName;
    }

    public void setConfName(String confName)
    {
        this.confName = confName;
    }

    @Column(name = "CONF_CONTEXT", length = 200)
    public String getConfContext()
    {
        return this.confContext;
    }

    public void setConfContext(String confContext)
    {
        this.confContext = confContext;
    }

    @Column(name = "CONF_DESC", length = 200)
    public String getConfDesc()
    {
        return this.confDesc;
    }

    public void setConfDesc(String confDesc)
    {
        this.confDesc = confDesc;
    }

    @Column(name = "UPDATE_TIME", nullable = false, length = 19)
    public Date getUpdateTime()
    {
        return this.updateTime;
    }

    public void setUpdateTime(Date updateTime)
    {
        this.updateTime = updateTime;
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

    @Column(name = "DATA_VER_FLAG", nullable = false)
    public Short getDataVerFalg()
    {
        return this.dataVerFalg;
    }

    public void setDataVerFalg(Short dataVerFalg)
    {
        this.dataVerFalg = dataVerFalg;
    }

}