package tt.pageModel;


import tt.util.annotation.Validator;


public class Role implements java.io.Serializable
{

    /**
     * 
     */
    private static final long serialVersionUID = -2447586452502619979L;

    @Validator(notNull = true, notEmpty = true, length_Min = 1, length_Max = 36)
    private String id;

    @Validator(notNull = true, notEmpty = true, length_Min = 1, length_Max = 36)
    private String pid;

    private String pname;

    @Validator(notNull = true, notEmpty = true, length_Min = 1, length_Max = 15)
    private String name;

    @Validator(length_Max = 90)
    private String remark;

    private Integer seq;

    private String iconCls;

    private String resourceIds;

    private String resourceNames;

    public String getIconCls()
    {
        return iconCls;
    }

    public void setIconCls(String iconCls)
    {
        this.iconCls = iconCls;
    }

    public String getResourceIds()
    {
        return resourceIds;
    }

    public void setResourceIds(String resourceIds)
    {
        this.resourceIds = resourceIds;
    }

    public String getResourceNames()
    {
        return resourceNames;
    }

    public void setResourceNames(String resourceNames)
    {
        this.resourceNames = resourceNames;
    }

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getPid()
    {
        return pid;
    }

    public void setPid(String pid)
    {
        this.pid = pid;
    }

    public String getPname()
    {
        return pname;
    }

    public void setPname(String pname)
    {
        this.pname = pname;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark;
    }

    public Integer getSeq()
    {
        return seq;
    }

    public void setSeq(Integer seq)
    {
        this.seq = seq;
    }

}
