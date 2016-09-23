package tt.pageModel;


import java.io.Serializable;
import java.util.Date;


public class BusiLog extends PageHelper implements Serializable
{
    /**
     * 意义，目的和功能，以及被用到的地方<br>
     */
    private static final long serialVersionUID = -9219344397056325092L;

    private String logId;

    private String seTsmId;

    private String seid;

    private String instanceAid;

    private Byte orgTaskType;

    private Byte subTaskType;

    private String operResult;

    private String seExecuteSw;

    private Byte reqSrc;

    private String errorDesc;

    private String seqId;

    private Date createTime;

    private String orgTaskTypeStr;

    private String subTaskTypeStr;

    private String reqSrcStr;

    private Date createTimeStart;

    private Date createTimeEnd;

    public String getLogId()
    {
        return logId;
    }

    public void setLogId(String logId)
    {
        this.logId = logId;
    }

    public String getSeTsmId()
    {
        return seTsmId;
    }

    public void setSeTsmId(String seTsmId)
    {
        this.seTsmId = seTsmId;
    }

    public String getSeid()
    {
        return seid;
    }

    public void setSeid(String seid)
    {
        this.seid = seid;
    }

    public String getInstanceAid()
    {
        return instanceAid;
    }

    public void setInstanceAid(String instanceAid)
    {
        this.instanceAid = instanceAid;
    }

    public Byte getOrgTaskType()
    {
        return orgTaskType;
    }

    public void setOrgTaskType(Byte orgTaskType)
    {
        this.orgTaskType = orgTaskType;
    }

    public Byte getSubTaskType()
    {
        return subTaskType;
    }

    public void setSubTaskType(Byte subTaskType)
    {
        this.subTaskType = subTaskType;
    }

    public String getOperResult()
    {
        return operResult;
    }

    public void setOperResult(String operResult)
    {
        this.operResult = operResult;
    }

    public String getSeExecuteSw()
    {
        return seExecuteSw;
    }

    public void setSeExecuteSw(String seExecuteSw)
    {
        this.seExecuteSw = seExecuteSw;
    }

    public Byte getReqSrc()
    {
        return reqSrc;
    }

    public void setReqSrc(Byte reqSrc)
    {
        this.reqSrc = reqSrc;
    }

    public String getErrorDesc()
    {
        return errorDesc;
    }

    public void setErrorDesc(String errorDesc)
    {
        this.errorDesc = errorDesc;
    }

    public String getSeqId()
    {
        return seqId;
    }

    public void setSeqId(String seqId)
    {
        this.seqId = seqId;
    }

    public Date getCreateTime()
    {
        return createTime;
    }

    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }

    public String getOrgTaskTypeStr()
    {
        return orgTaskTypeStr;
    }

    public void setOrgTaskTypeStr(String orgTaskTypeStr)
    {
        this.orgTaskTypeStr = orgTaskTypeStr;
    }

    public String getSubTaskTypeStr()
    {
        return subTaskTypeStr;
    }

    public void setSubTaskTypeStr(String subTaskTypeStr)
    {
        this.subTaskTypeStr = subTaskTypeStr;
    }

    public String getReqSrcStr()
    {
        return reqSrcStr;
    }

    public void setReqSrcStr(String reqSrcStr)
    {
        this.reqSrcStr = reqSrcStr;
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

}
