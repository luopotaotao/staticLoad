package tt.pageModel;


import java.util.Date;

import tt.util.annotation.Validator;


public class Notice extends PageHelper implements java.io.Serializable
{
    private static final long serialVersionUID = -8976782703171245382L;

    private String noticeId;
    @Validator(notNull = true, notEmpty = true, length_Min = 1, length_Max = 200)
    private String noticeName;
    @Validator(notNull = true, notEmpty = true, length_Min = 1, length_Max = 200)
    private String noticeUrl;

    private Date createTime;

    private Date updateTime;

    private String adminName;

    private Short dataVerFlag;

    public String getNoticeId()
    {
        return noticeId;
    }

    public void setNoticeId(String noticeId)
    {
        this.noticeId = noticeId;
    }

    public String getNoticeName()
    {
        return noticeName;
    }

    public void setNoticeName(String noticeName)
    {
        this.noticeName = noticeName;
    }

    public String getNoticeUrl()
    {
        return noticeUrl;
    }

    public void setNoticeUrl(String noticeUrl)
    {
        this.noticeUrl = noticeUrl;
    }

    public Date getCreateTime()
    {
        return createTime;
    }

    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
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

    public Short getDataVerFlag()
    {
        return dataVerFlag;
    }

    public void setDataVerFlag(Short dataVerFlag)
    {
        this.dataVerFlag = dataVerFlag;
    }

}