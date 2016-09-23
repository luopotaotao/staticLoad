package tt.dao;


import java.util.List;

import tt.model.Tuserlog;
import tt.pageModel.Userlog;


/**
 * 系统操作日志数据库操作类
 * 
 * @author kiky zhang
 */
public interface UserLogDaoI
{
    /**
     * 查询系统操作日志
     * 
     * @param userlog
     * @param name
     * @return
     * @throws Exception
     */
    public List<Tuserlog> datagrid(Userlog userlog, String name)
        throws Exception;

    /**
     * 查询系统操作日志总数
     * 
     * @param userlog
     * @param name
     * @return
     * @throws Exception
     */
    public Long getUserlogCount(Userlog userlog, String name)
        throws Exception;

    /**
     * 获取系统操作日志对象
     * 
     * @param id
     * @return
     * @throws Exception
     */
    public Tuserlog getUserLog(String id)
        throws Exception;

    /**
     * 操作系统日志管理员下拉列表
     * 
     * @param userlog
     * @return
     * @throws Exception
     */
    public List<Tuserlog> combobox(Userlog userlog)
        throws Exception;

    /**
     * 新增系统操作日志
     * 
     * @param userlog
     * @throws Exception
     */
    public void addUserlog(Userlog userlog)
        throws Exception;

}
