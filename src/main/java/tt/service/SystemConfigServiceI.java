package tt.service;


import java.util.List;

import tt.model.TSystemConfig;
import tt.pageModel.DataGrid;
import tt.pageModel.Json;
import tt.pageModel.SystemConfig;


/**
 * 业务参数信息配置业务处理类
 * 
 * @author liyunxia
 * @version 2015-12-28
 * @see SystemConfigServiceI
 * @since
 */
public interface SystemConfigServiceI
{
    /**
     * 业务参数信息配置列表
     * 
     * @param s
     * @return
     * @throws Exception
     */
    public DataGrid datagrid(SystemConfig s)
        throws Exception;

    /**
     * 业务参数信息配置添加
     * 
     * @param s
     * @return
     * @throws Exception
     */
    public Json add(SystemConfig s)
        throws Exception;

    /**
     * 业务参数信息配置修改
     * 
     * @param s
     * @return
     * @throws Exception
     */
    public Json edit(SystemConfig s)
        throws Exception;

    /**
     * 业务参数信息配置删除
     * 
     * @param id
     * @return
     * @throws Exception
     */
    public Json delete(String id)
        throws Exception;

    /**
     * 根据ID查询业务参数信息
     * 
     * @param ids
     * @return
     * @throws Exception
     */
    public SystemConfig getSystemConfig(String ids)
        throws Exception;

    /**
     * 查询所有的系统参数
     * 
     * @return
     * @throws Exception
     */
    public List<TSystemConfig> listSystemConfig()
        throws Exception;
}
