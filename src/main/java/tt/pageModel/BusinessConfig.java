package tt.pageModel;


import java.io.Serializable;
import java.util.Date;

import tt.util.annotation.Validator;


/**
 * Config javaBean.
 * 
 * @author MyEclipse Persistence Tools createTime 2015-06-19 16:42
 */
public class BusinessConfig extends PageHelper implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Validator(notNull = true, notEmpty = true, length_Min = 1, length_Max = 50)
    private String confId;

    @Validator(notNull = true, notEmpty = true, length_Min = 1, length_Max = 50)
    private String confName;

    @Validator(length_Max = 200)
    private String confContext;

    @Validator(length_Max = 200)
    private String confDesc;

    private String adminName;

    private Date updateTime;

    @Validator
    private Short dataVerFalg;

    public String getConfId()
    {
        return confId;
    }

    public void setConfId(String confId)
    {
        this.confId = confId;
    }

    public String getConfName()
    {
        return confName;
    }

    public void setConfName(String confName)
    {
        this.confName = confName;
    }

    public String getConfContext()
    {
        return confContext;
    }

    public void setConfContext(String confContext)
    {
        this.confContext = confContext;
    }

    public String getConfDesc()
    {
        return confDesc;
    }

    public void setConfDesc(String confDesc)
    {
        this.confDesc = confDesc;
    }

    public Date getUpdateTime()
    {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime)
    {
        this.updateTime = updateTime;
    }

    public String getAdminName()
    {
        return adminName;
    }

    public void setAdminName(String adminName)
    {
        this.adminName = adminName;
    }

    public Short getDataVerFalg()
    {
        return dataVerFalg;
    }

    public void setDataVerFalg(Short dataVerFalg)
    {
        this.dataVerFalg = dataVerFalg;
    }
}
