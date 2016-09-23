package tt.dao;


import java.util.List;

import tt.model.TSystemConfig;
import tt.pageModel.SystemConfig;


/**
 * 业务参数信息配置数据库操作类
 * 
 * @author liyunxia
 * @version 2015-12-28
 * @see SystemConfigDaoI
 * @since
 */
public interface SystemConfigDaoI
{
    /**
     * 业务参数信息配置列表
     * 
     * @param s
     * @return
     * @throws Exception
     */
    public List<TSystemConfig> datagrid(SystemConfig s)
        throws Exception;

    /**
     * 业务参数信息配置总记录数
     * 
     * @param s
     * @return
     * @throws Exception
     */
    public long getSystemConfigCount(SystemConfig s)
        throws Exception;

    /**
     * 业务参数信息配置添加
     * 
     * @param s
     * @throws Exception
     */
    public void add(SystemConfig s)
        throws Exception;

    /**
     * 业务参数信息配置修改
     * 
     * @param s
     * @throws Exception
     */
    public void edit(SystemConfig s)
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
    public TSystemConfig getSystemConfig(String id)
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
