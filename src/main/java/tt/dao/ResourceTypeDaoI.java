package tt.dao;


import tt.model.Tresourcetype;


/**
 * 资源类型数据库操作类
 * 
 * @author
 */
public interface ResourceTypeDaoI extends BaseDaoI<Tresourcetype>
{

    /**
     * 通过ID获得资源类型
     * 
     * @param id
     * @return
     */
    public Tresourcetype getById(String id)
        throws Exception;

}
