package tt.pageModel;


import tt.util.annotation.Validator;


public class Resource implements java.io.Serializable
{

    /**
     * 
     */
    private static final long serialVersionUID = 6253248015661268604L;

    @Validator(notEmpty = true, length_Max = 36, length_Min = 4)
    private String id;

    @Validator(notNull = true, notEmpty = true, accessStrValue = {"1", "2"})
    private String typeId;

    private String typeName;

    @Validator(length_Max = 36, length_Min = 4)
    private String pid;

    private String pname;

    @Validator(notNull = true, notEmpty = true, length_Min = 1, length_Max = 18)
    private String name;

    @Validator(length_Max = 90)
    private String remark;

    @Validator(notNull = true, notEmpty = true, short_value_Min = 1, short_value_Max = 100)
    private Short seq;

    @Validator(length_Max = 100)
    private String url;

    @Validator(length_Max = 80)
    private String iconCls;

    private String roleId;

    private String roleName;

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getTypeId()
    {
        return typeId;
    }

    public void setTypeId(String typeId)
    {
        this.typeId = typeId;
    }

    public String getTypeName()
    {
        return typeName;
    }

    public void setTypeName(String typeName)
    {
        this.typeName = typeName;
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

    public Short getSeq()
    {
        return seq;
    }

    public void setSeq(Short seq)
    {
        this.seq = seq;
    }

    public String getUrl()
    {
        return url;
    }

    public void setUrl(String url)
    {
        this.url = url;
    }

    public String getIconCls()
    {
        return iconCls;
    }

    public void setIconCls(String iconCls)
    {
        this.iconCls = iconCls;
    }

    public String getRoleId()
    {
        return roleId;
    }

    public void setRoleId(String roleId)
    {
        this.roleId = roleId;
    }

    public String getRoleName()
    {
        return roleName;
    }

    public void setRoleName(String roleName)
    {
        this.roleName = roleName;
    }

}
