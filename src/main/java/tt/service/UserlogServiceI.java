package tt.service;


import java.util.List;

import tt.pageModel.DataGrid;
import tt.pageModel.Userlog;


public interface UserlogServiceI
{

    /**
     * 添加管理员操作日志
     * 
     * @param userlog
     */
    public void add(Userlog userlog)
        throws Exception;

    /**
     * 查询管理员操作日志列表
     * 
     * @param userlog
     * @param name
     * @return
     * @throws Exception
     */

    public DataGrid datagrid(Userlog userlog, String name)
        throws Exception;

    /**
     * 通过id查询管理员日志信息
     * 
     * @param id
     * @return
     * @throws Exception
     */

    public Userlog getUserLog(String id)
        throws Exception;

    /**
     * 查询管理员下拉列表
     * 
     * @param userlog
     * @return
     * @throws Exception
     */

    public List<Userlog> combobox(Userlog userlog)
        throws Exception;

}
