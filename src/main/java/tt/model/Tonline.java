package tt.model;


// default package

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * Tonline entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "T_ONLINE")
public class Tonline implements java.io.Serializable
{

    // Fields

    /**
     * 
     */
    private static final long serialVersionUID = 7270966403235858381L;

    private String id;

    private String ip;

    private Date logindatetime;

    private String loginname;

    // Constructors

    /** default constructor */
    public Tonline()
    {}

    /** full constructor */
    public Tonline(String id, String ip, Date logindatetime, String loginname)
    {
        this.id = id;
        this.ip = ip;
        this.logindatetime = logindatetime;
        this.loginname = loginname;
    }

    // Property accessors
    @Id
    @Column(name = "ID", unique = true, nullable = false, length = 36)
    public String getId()
    {
        return this.id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    @Column(name = "IP", nullable = false, length = 20)
    public String getIp()
    {
        return this.ip;
    }

    public void setIp(String ip)
    {
        this.ip = ip;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "LOGINDATETIME", nullable = false, length = 7)
    public Date getLogindatetime()
    {
        return this.logindatetime;
    }

    public void setLogindatetime(Date logindatetime)
    {
        this.logindatetime = logindatetime;
    }

    @Column(name = "LOGINNAME", nullable = false, length = 20)
    public String getLoginname()
    {
        return this.loginname;
    }

    public void setLoginname(String loginname)
    {
        this.loginname = loginname;
    }

}