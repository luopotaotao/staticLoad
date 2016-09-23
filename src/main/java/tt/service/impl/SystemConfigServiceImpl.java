package tt.service.impl;


import java.util.ArrayList;
import java.util.List;

import tt.dao.SystemConfigDaoI;
import tt.model.TSystemConfig;
import tt.pageModel.DataGrid;
import tt.pageModel.Json;
import tt.pageModel.SystemConfig;
import tt.service.SystemConfigServiceI;
import tt.util.Constant;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("systemConfigService")
public class SystemConfigServiceImpl implements SystemConfigServiceI
{
    @Autowired
    private SystemConfigDaoI systemConfigDao;

    private static final Logger logger = Logger.getLogger(SystemConfigServiceImpl.class);

    @Override
    public DataGrid datagrid(SystemConfig s)
        throws Exception
    {
        List<TSystemConfig> l = systemConfigDao.datagrid(s);
        List<SystemConfig> nl = new ArrayList<SystemConfig>();
        changeModel(l, nl);
        DataGrid dg = new DataGrid();
        dg.setRows(nl);
        dg.setTotal(systemConfigDao.getSystemConfigCount(s));
        return dg;
    }

    private void changeModel(List<TSystemConfig> l, List<SystemConfig> nl)
    {
        if (l != null && l.size() > 0)
        {
            for (TSystemConfig t : l)
            {
                SystemConfig s = new SystemConfig();
                changeModel(t, s);
                nl.add(s);
            }
        }
    }

    private void changeModel(TSystemConfig t, SystemConfig s)
    {
        if (t != null)
        {
            BeanUtils.copyProperties(t, s);
        }
    }

    @Override
    public Json add(SystemConfig s)
        throws Exception
    {
        Json j = new Json();
        TSystemConfig t = systemConfigDao.getSystemConfig(s.getConfId());
        if (t != null)
        {
            j.setMsg(Constant.MESSAGE_EXIST);
            j.setSuccess(false);
            logger.info("该业务参数【" + s.getConfId() + "】已存在!");
        }
        else
        {
            systemConfigDao.add(s);
            j.setMsg(Constant.ADD_SUCCESS);
            j.setSuccess(true);
            logger.info("添加业务参数【" + s.getConfId() + "】成功!");
        }
        return j;
    }

    @Override
    public Json edit(SystemConfig s)
        throws Exception
    {
        Json j = new Json();
        TSystemConfig t = systemConfigDao.getSystemConfig(s.getConfId());
        if (t != null)
        {
            systemConfigDao.edit(s);
            j.setSuccess(true);
            j.setMsg(Constant.EDIT_SUCCESS);
            logger.info("修改业务参数【" + s.getConfId() + "】成功!");
        }
        else
        {
            j.setSuccess(false);
            j.setMsg(Constant.NO_MESSAGE);
            logger.info("修改业务参数失败，该信息不存在!");
        }
        return j;
    }

    @Override
    public Json delete(String ids)
        throws Exception
    {
        Json j = new Json();
        if (ids != null && ids.length() > 0)
        {
            for (String id : ids.split(","))
            {
                TSystemConfig t = systemConfigDao.getSystemConfig(id);
                if (t != null)
                {
                    systemConfigDao.delete(id);
                    j.setSuccess(true);
                    j.setMsg(Constant.DELETE_SUCCESS);
                    logger.info("删除业务参数【" + id + "】成功!");
                }
                else
                {
                    j.setSuccess(false);
                    j.setMsg(Constant.NO_MESSAGE);
                    logger.info("删除业务参数失败，该业务参数不存在!");
                }
            }
        }
        else
        {
            j.setSuccess(false);
            j.setMsg(Constant.NO_MESSAGE);
            logger.info("业务参数标识【" + ids + "】为空，删除失败!");
        }
        return j;
    }

    @Override
    public SystemConfig getSystemConfig(String id)
        throws Exception
    {
        TSystemConfig t = systemConfigDao.getSystemConfig(id);
        if (t != null)
        {
            SystemConfig s = new SystemConfig();
            changeModel(t, s);
            return s;
        }
        return null;
    }

    @Override
    public List<TSystemConfig> listSystemConfig()
        throws Exception
    {
        List<TSystemConfig> listSystemConfig = systemConfigDao.listSystemConfig();
        return listSystemConfig;
    }
}
