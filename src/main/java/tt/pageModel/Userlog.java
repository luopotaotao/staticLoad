package tt.pageModel;


import java.util.Date;


public class Userlog extends PageHelper implements java.io.Serializable
{
    /**
     * 
     */
    private static final long serialVersionUID = -9075041973076241384L;

    private String userLogId;

    private String formContentStr;

    private String adminName;

    private String text;

    private Date createTime;

    private String url;

    private String userIp;

    private SessionInfo sessionInfo;

    private Date createTimeStart;

    private Date createTimeEnd;

    public String getUserLogId()
    {
        return userLogId;
    }

    public void setUserLogId(String userLogId)
    {
        this.userLogId = userLogId;
    }

    public String getAdminName()
    {
        return adminName;
    }

    public void setAdminName(String adminName)
    {
        this.adminName = adminName;
    }

    public String getText()
    {
        return text;
    }

    public void setText(String text)
    {
        this.text = text;
    }

    public Date getCreateTime()
    {
        return createTime;
    }

    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }

    public String getUrl()
    {
        return url;
    }

    public void setUrl(String url)
    {
        this.url = url;
    }

    public String getUserIp()
    {
        return userIp;
    }

    public void setUserIp(String userIp)
    {
        this.userIp = userIp;
    }

    public SessionInfo getSessionInfo()
    {
        return sessionInfo;
    }

    public void setSessionInfo(SessionInfo sessionInfo)
    {
        this.sessionInfo = sessionInfo;
    }

    public Date getCreateTimeStart()
    {
        return createTimeStart;
    }

    public void setCreateTimeStart(Date createTimeStart)
    {
        this.createTimeStart = createTimeStart;
    }

    public Date getCreateTimeEnd()
    {
        return createTimeEnd;
    }

    public void setCreateTimeEnd(Date createTimeEnd)
    {
        this.createTimeEnd = createTimeEnd;
    }

    public String getFormContentStr()
    {
        return formContentStr;
    }

    public void setFormContentStr(String formContentStr)
    {
        this.formContentStr = formContentStr;
    }

}
