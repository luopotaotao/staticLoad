package tt.dao;


import java.util.List;

import tt.model.TBusinessConfig;
import tt.pageModel.BusinessConfig;


/**
 * 业务参数信息配置数据库操作类
 * 
 * @author liyunxia
 * @version 2015-12-28
 * @see BusinessConfigDaoI
 * @since
 */
public interface BusinessConfigDaoI
{
    /**
     * 业务参数信息配置列表
     * 
     * @param b
     * @return
     * @throws Exception
     */
    public List<TBusinessConfig> datagrid(BusinessConfig b)
        throws Exception;

    /**
     * 业务参数信息配置总记录数
     * 
     * @param b
     * @return
     * @throws Exception
     */
    public long getBusinessConfigCount(BusinessConfig b)
        throws Exception;

    /**
     * 业务参数信息配置添加
     * 
     * @param b
     * @throws Exception
     */
    public void add(BusinessConfig b)
        throws Exception;

    /**
     * 业务参数信息配置修改
     * 
     * @param b
     * @throws Exception
     */
    public void edit(BusinessConfig b)
        throws Exception;

    /**
     * 业务参数信息配置删除
     * 
     * @param id
     * @throws Exception
     */
    public void delete(String id)
        throws Exception;

    /**
     * 根据ID查询业务参数信息对象
     * 
     * @param id
     * @return
     * @throws Exception
     */
    public TBusinessConfig getBusinessConfig(String id)
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
