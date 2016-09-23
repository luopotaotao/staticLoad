package tt.service;


import java.util.List;

import tt.model.TBusinessConfig;
import tt.pageModel.BusinessConfig;
import tt.pageModel.DataGrid;
import tt.pageModel.Json;


/**
 * 业务参数信息配置业务处理类
 * 
 * @author liyunxia
 * @version 2015-12-28
 * @see BusinessConfigServiceI
 * @since
 */
public interface BusinessConfigServiceI
{
    /**
     * 业务参数信息配置列表
     * 
     * @param b
     * @return
     * @throws Exception
     */
    public DataGrid datagrid(BusinessConfig b)
        throws Exception;

    /**
     * 业务参数信息配置添加
     * 
     * @param b
     * @return
     * @throws Exception
     */
    public Json add(BusinessConfig b)
        throws Exception;

    /**
     * 业务参数信息配置修改
     * 
     * @param b
     * @return
     * @throws Exception
     */
    public Json edit(BusinessConfig b)
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
    public BusinessConfig getBusinessConfig(String ids)
        throws Exception;

    /**
     * 查询所有的业务参数
     * 
     * @return
     * @throws Exception
     */
    public List<TBusinessConfig> listBusinessConfig()
        throws Exception;
}
