package tt.model.business;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import tt.model.Role;
import tt.model.Trole;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;



@Entity
@Table(name = "t_user", uniqueConstraints = @UniqueConstraint(columnNames = "NAME") )
public class User implements java.io.Serializable
{
    private String id;

    private Date createdatetime;

    private String email;

    private Short lockSymbol;

    private Date modifydatetime;

    private String name;

    private String pwd;

    private Short remainingLogins;

    private Date validdatetime;

    private Dept dept;

    private Integer role;
    // Constructors
    /** default constructor */
    public User()
    {}

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

    @ManyToOne
    @JoinColumn(name = "dept_id")
    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    @Column(name = "role")
    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }
}