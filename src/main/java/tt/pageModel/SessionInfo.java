package tt.pageModel;


import tt.model.*;
import tt.model.Role;
import tt.model.business.Dept;

import java.util.*;
import java.util.regex.Pattern;


/**
 * session信息模型
 *
 * @author
 */
public class SessionInfo implements java.io.Serializable {

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

    private Set<Pattern> resourceSet;// 用户可以访问的资源地址列表

    private Map<String, String> resourceMap;

    private Dept dept;

    private Dept originDept;

    private tt.model.Role role;

    private String email;
    public Set<Pattern> getResourceSet() {
        return resourceSet;
    }

//    public void setResourceSet(List<String> resourceList) {
//        if (this.resourceSet == null) {
//            this.resourceSet = new LinkedHashSet<>();
//        }
//        for (String item : resourceSet) {
//            if (!resourceMap.containsKey(item)) {
//                this.resourceSet.add(Pattern.compile(item));
//            }
//
//        }
//    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "SessionInfo{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", ip='" + ip + '\'' +
                ", ipinfo='" + ipinfo + '\'' +
                ", action_time=" + action_time +
                ", userAucCount=" + userAucCount +
                ", userAucResult=" + userAucResult +
                ", userAucName='" + userAucName + '\'' +
                ", resourceSet=" + resourceSet +
                ", resourceMap=" + resourceMap +
                ", dept=" + dept +
                ", originDept=" + originDept +
                ", role=" + role +
                ", email='" + email + '\'' +
                '}';
    }




    public String getIpinfo() {
        return ipinfo;
    }

    public void setIpinfo(String ipinfo) {
        this.ipinfo = ipinfo;
    }

    public Map<String, String> getResourceMap() {
        return resourceMap;
    }

    public void setResourceMap(Map<String, String> resourceMap) {
        this.resourceMap = resourceMap;
        this.resourceSet = new LinkedHashSet<>();
        if (resourceMap != null && resourceMap.size() > 0) {
            resourceMap.forEach((key, val) -> {
                this.resourceSet.add(Pattern.compile(val));
            });
        }

    }
    public void addToResourceSet(String pattern,String info){
        if(this.resourceMap!=null&&!this.resourceMap.containsKey(pattern)){
            this.resourceSet.add(Pattern.compile(pattern));
            this.resourceMap.put(pattern,info);
        }
    }
//    public void addToResourceSet(List<Map<String>>)
//    public int getUserAucCount() {
//        return userAucCount;
//    }

    public void setUserAucCount(int userAucCount) {
        this.userAucCount = userAucCount;
    }

    public boolean isUserAucResult() {
        return userAucResult;
    }

    public void setUserAucResult(boolean userAucResult) {
        this.userAucResult = userAucResult;
    }

    public String getUserAucName() {
        return userAucName;
    }

    public void setUserAucName(String userAucName) {
        this.userAucName = userAucName;
    }

    public long getAction_time() {
        return action_time;
    }

    public void setAction_time(long action_time) {
        this.action_time = action_time;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    public Dept getOriginDept() {
        return originDept;
    }

    public void setOriginDept(Dept originDept) {
        this.originDept = originDept;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
