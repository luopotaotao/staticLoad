package tt.model;


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;

import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;


/**
 * TUser entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_user", uniqueConstraints = @UniqueConstraint(columnNames = "NAME") )
public class TUser implements java.io.Serializable
{
    /**
     * 意义，目的和功能，以及被用到的地方<br>
     */
    private static final long serialVersionUID = 7722912427892614566L;

    // Fields
    private String id;

    private Date createdatetime;

    private String email;

    private Short lockSymbol;

    private Date modifydatetime;

    private String name;

    private String pwd;

    private Short remainingLogins;

    private Date validdatetime;

    private Set<Trole> troles = new HashSet<Trole>(0);

    // Constructors
    /** default constructor */
    public TUser()
    {}

    /** minimal constructor */
    public TUser(String id, String email, Short lockSymbol, String name, String pwd,
                 Short remainingLogins)
    {
        this.id = id;
        this.email = email;
        this.lockSymbol = lockSymbol;
        this.name = name;
        this.pwd = pwd;
        this.remainingLogins = remainingLogins;
    }

    /** full constructor */
    public TUser(String id, Date createdatetime, String email, Short lockSymbol,
                 Date modifydatetime, String name, String pwd, Short remainingLogins,
                 Date validdatetime)
    {
        this.id = id;
        this.createdatetime = createdatetime;
        this.email = email;
        this.lockSymbol = lockSymbol;
        this.modifydatetime = modifydatetime;
        this.name = name;
        this.pwd = pwd;
        this.remainingLogins = remainingLogins;
        this.validdatetime = validdatetime;
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

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CREATEDATETIME", length = 19)
    public Date getCreatedatetime()
    {
        return this.createdatetime;
    }

    public void setCreatedatetime(Date createdatetime)
    {
        this.createdatetime = createdatetime;
    }

    @Column(name = "EMAIL", nullable = false, length = 64)
    public String getEmail()
    {
        return this.email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    @Column(name = "LOCK_SYMBOL", nullable = false)
    public Short getLockSymbol()
    {
        return this.lockSymbol;
    }

    public void setLockSymbol(Short lockSymbol)
    {
        this.lockSymbol = lockSymbol;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "MODIFYDATETIME", length = 19)
    public Date getModifydatetime()
    {
        return this.modifydatetime;
    }

    public void setModifydatetime(Date modifydatetime)
    {
        this.modifydatetime = modifydatetime;
    }

    @Column(name = "NAME", unique = true, nullable = false, length = 20)
    public String getName()
    {
        return this.name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    @Column(name = "PWD", nullable = false, length = 100)
    public String getPwd()
    {
        return this.pwd;
    }

    public void setPwd(String pwd)
    {
        this.pwd = pwd;
    }

    @Column(name = "REMAINING_LOGINS", nullable = false)
    public Short getRemainingLogins()
    {
        return this.remainingLogins;
    }

    public void setRemainingLogins(Short remainingLogins)
    {
        this.remainingLogins = remainingLogins;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "VALIDDATETIME", length = 10)
    public Date getValiddatetime()
    {
        return this.validdatetime;
    }

    public void setValiddatetime(Date validdatetime)
    {
        this.validdatetime = validdatetime;
    }

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "t_user_trole", joinColumns = {
        @JoinColumn(name = "TUSER_ID", nullable = false, updatable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "TROLE_ID", nullable = false, updatable = false)})
    public Set<Trole> getTroles()
    {
        return this.troles;
    }

    public void setTroles(Set<Trole> troles)
    {
        this.troles = troles;
    }
}