package tt.pageModel;


import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;


/**
 * session信息模型
 * 
 * @author
 */
public class SessionInfo implements java.io.Serializable
{

    /**
     * 
     */
    private static final long serialVersionUID = 6561812689378348235L;

    private String id;// 用户ID

    private String name;// 用户登录名

    private String ip;// 用户IP

    private String ipinfo; // 用户IP信息

    private long action_time;

    // 当前认证次数
    private int userAucCount;

    // 认证结果
    private boolean userAucResult;

    private String userAucName;

    private List<Pattern> resourceList;// 用户可以访问的资源地址列表

    private Map<String, String> resourceMap;

    public List<Pattern> getResourceList()
    {
        return resourceList;
    }

    public void setResourceList(List<String> resourceList)
    {
        if(this.resourceList==null){
            this.resourceList = new LinkedList<Pattern>();
        }
        for(String item:resourceList){
            this.resourceList.add(Pattern.compile(item));
        }
//        this.resourceList = resourceList;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getIp()
    {
        return ip;
    }

    public void setIp(String ip)
    {
        this.ip = ip;
    }

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    @Override
    public String toString()
    {
        return this.name;
    }

    public String getIpinfo()
    {
        return ipinfo;
    }

    public void setIpinfo(String ipinfo)
    {
        this.ipinfo = ipinfo;
    }

    public Map<String, String> getResourceMap()
    {
        return resourceMap;
    }

    public void setResourceMap(Map<String, String> resourceMap)
    {
        this.resourceMap = resourceMap;
    }

    public int getUserAucCount()
    {
        return userAucCount;
    }

    public void setUserAucCount(int userAucCount)
    {
        this.userAucCount = userAucCount;
    }

    public boolean isUserAucResult()
    {
        return userAucResult;
    }

    public void setUserAucResult(boolean userAucResult)
    {
        this.userAucResult = userAucResult;
    }

    public String getUserAucName()
    {
        return userAucName;
    }

    public void setUserAucName(String userAucName)
    {
        this.userAucName = userAucName;
    }

    public long getAction_time()
    {
        return action_time;
    }

    public void setAction_time(long action_time)
    {
        this.action_time = action_time;
    }

}
