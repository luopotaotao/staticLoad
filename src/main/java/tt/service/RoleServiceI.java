package tt.service;


import java.util.List;

import tt.pageModel.Json;
import tt.pageModel.Role;
import tt.pageModel.SessionInfo;
import tt.pageModel.Tree;


/**
 * 角色业务逻辑
 * 
 * @author
 */
public interface RoleServiceI
{

    /**
     * 保存角色
     * 
     * @param role
     */
    public Json add(Role role, SessionInfo sessionInfo)
        throws Exception;

    /**
     * 获得角色
     * 
     * @param id
     * @return
     */
    public Role get(String id)
        throws Exception;

    /**
     * 修改角色
     * 
     * @param role
     */
    public Json edit(Role role)
        throws Exception;

    /**
     * 获得角色treeGrid
     * 
     * @return
     */
    public List<Role> treeGrid(SessionInfo sessionInfo)
        throws Exception;

    /**
     * 删除角色
     * 
     * @param id
     */
    public void delete(String id)
        throws Exception;

    /**
     * 获得角色树(只能看到自己拥有的角色)
     * 
     * @return
     */
    public List<Tree> tree(SessionInfo sessionInfo)
        throws Exception;

    /**
     * 获得角色树
     * 
     * @return
     */
    public List<Tree> allTree()
        throws Exception;

    /**
     * 获得授权树((不包含超级管理员角色)
     * 
     * @return
     */
    public List<Tree> grantRoleTree()
        throws Exception;

    /**
     * 为角色授权
     * 
     * @param role
     */
    public void grant(Role role)
        throws Exception;

}
