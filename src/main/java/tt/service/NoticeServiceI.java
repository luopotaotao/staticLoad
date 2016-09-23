package tt.service;


import tt.pageModel.DataGrid;
import tt.pageModel.Notice;


/**
 * 公告信息 〈功能详细描述〉
 * 
 * @author zhangxh
 * @version 2016-1-10
 * @see NoticeServiceI
 * @since
 */

public interface NoticeServiceI
{
    /**
     * @Description: 公告信息列表
     * @Check parameters by the 【caller】 or 【itself】(参数由谁校验)
     * @param n
     * @return
     * @throws Exception
     */
    public DataGrid datagrid(Notice n)
        throws Exception;

    /**
     * @Description: 添加公告信息
     * @Check parameters by the 【caller】 or 【itself】(参数由谁校验)
     * @param n
     * @throws Exception
     */

    public void add(Notice n)
        throws Exception;

    /**
     * @Description: 修改公告信息
     * @Check parameters by the 【caller】 or 【itself】(参数由谁校验)
     * @param n
     * @throws Exception
     */

    public void edit(Notice n)
        throws Exception;

    /**
     * @Description: 删除公告信息
     * @Check parameters by the 【caller】 or 【itself】(参数由谁校验)
     * @param id
     * @throws Exception
     */

    public void delete(String id)
        throws Exception;

    /**
     * @Description: 查询某一公告信息
     * @Check parameters by the 【caller】 or 【itself】(参数由谁校验)
     * @param id
     * @return
     * @throws Exception
     */
    public Notice getNotice(String id)
        throws Exception;
}
