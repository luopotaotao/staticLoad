package tt.pageModel;


import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

import tt.model.*;
import tt.model.Role;
import tt.model.business.Dept;
import tt.util.annotation.Validator;


public class User extends PageHelper implements java.io.Serializable
{

    /**
     * 
     */
    private static final long serialVersionUID = -4788978650996048050L;

    @Validator( notEmpty = true, notNull = true)
    private Integer id;

    @Validator(notEmpty = true, notNull = true, length_Min = 4, length_Max = 20, regex = "[a-zA-z]+")
    private String name;

    private String pwd;

    private Date createdatetime;

    private Date modifydatetime;

    private Date createdatetimeStart;

    private Date createdatetimeEnd;

    private Date modifydatetimeStart;

    private Date modifydatetimeEnd;

    private String roleIds;

    private String roleNames;

    private String verifycode;

    private Date validdatetime;
    private Dept dept;
    private Integer role;
    // 是否锁定的标志，默认为0:未锁定;1:锁定
    @Validator(accessShortValue = {1, 0})
    private Short lockSymbol;

    // 剩余登录次数
    private Short remainingLogins;

    @Validator(notEmpty = true, notNull = true, regex = "^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$")
    private String email;

    public Date getCreatedatetimeStart()
    {
        return createdatetimeStart;
    }

    public void setCreatedatetimeStart(Date createdatetimeStart)
    {
        this.createdatetimeStart = createdatetimeStart;
    }

    public Date getCreatedatetimeEnd()
    {
        return createdatetimeEnd;
    }

    public void setCreatedatetimeEnd(Date createdatetimeEnd)
    {
        this.createdatetimeEnd = createdatetimeEnd;
    }

    public Date getModifydatetimeStart()
    {
        return modifydatetimeStart;
    }

    public void setModifydatetimeStart(Date modifydatetimeStart)
    {
        this.modifydatetimeStart = modifydatetimeStart;
    }

    public Date getModifydatetimeEnd()
    {
        return modifydatetimeEnd;
    }

    public void setModifydatetimeEnd(Date modifydatetimeEnd)
    {
        this.modifydatetimeEnd = modifydatetimeEnd;
    }

    public String getRoleIds()
    {
        return roleIds;
    }

    public void setRoleIds(String roleIds)
    {
        this.roleIds = roleIds;
    }

    public String getRoleNames()
    {
        return roleNames;
    }

    public void setRoleNames(String roleNames)
    {
        this.roleNames = roleNames;
    }

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getPwd()
    {
        return pwd;
    }

    public void setPwd(String pwd)
    {
        this.pwd = pwd;
    }

    public Date getCreatedatetime()
    {
        return createdatetime;
    }

    public void setCreatedatetime(Date createdatetime)
    {
        this.createdatetime = createdatetime;
    }

    public Date getModifydatetime()
    {
        return modifydatetime;
    }

    public void setModifydatetime(Date modifydatetime)
    {
        this.modifydatetime = modifydatetime;
    }

    public String getVerifycode()
    {
        return verifycode;
    }

    public void setVerifycode(String verifycode)
    {
        this.verifycode = verifycode;
    }

    @JSONField(format = "yyyy-MM-dd")
    public Date getValiddatetime()
    {
        return validdatetime;
    }

    public void setValiddatetime(Date validdatetime)
    {
        this.validdatetime = validdatetime;
    }

    public Short getLockSymbol()
    {
        return lockSymbol;
    }

    public void setLockSymbol(Short lockSymbol)
    {
        this.lockSymbol = lockSymbol;
    }

    public Short getRemainingLogins()
    {
        return remainingLogins;
    }

    public void setRemainingLogins(Short remainingLogins)
    {
        this.remainingLogins = remainingLogins;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }
}
