package tt.service.impl;


import java.util.ArrayList;
import java.util.List;

import tt.dao.BusinessConfigDaoI;
import tt.model.TBusinessConfig;
import tt.pageModel.BusinessConfig;
import tt.pageModel.DataGrid;
import tt.pageModel.Json;
import tt.service.BusinessConfigServiceI;
import tt.util.Constant;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("businessConfigService")
public class BusinessConfigServiceImpl implements BusinessConfigServiceI
{
    @Autowired
    private BusinessConfigDaoI businessConfigDao;

    private static final Logger logger = Logger.getLogger(BusinessConfigServiceImpl.class);

    @Override
    public DataGrid datagrid(BusinessConfig b)
        throws Exception
    {
        List<TBusinessConfig> l = businessConfigDao.datagrid(b);
        List<BusinessConfig> nl = new ArrayList<BusinessConfig>();
        changeModel(l, nl);
        DataGrid dg = new DataGrid();
        dg.setRows(nl);
        dg.setTotal(businessConfigDao.getBusinessConfigCount(b));
        return dg;
    }

    private void changeModel(List<TBusinessConfig> l, List<BusinessConfig> nl)
    {
        if (l != null && l.size() > 0)
        {
            for (TBusinessConfig t : l)
            {
                BusinessConfig b = new BusinessConfig();
                changeModel(t, b);
                nl.add(b);
            }
        }
    }

    private void changeModel(TBusinessConfig t, BusinessConfig b)
    {
        if (t != null)
        {
            BeanUtils.copyProperties(t, b);
        }
    }

    @Override
    public Json add(BusinessConfig b)
        throws Exception
    {
        Json j = new Json();
        TBusinessConfig t = businessConfigDao.getBusinessConfig(b.getConfId());
        if (t != null)
        {
            j.setMsg(Constant.MESSAGE_EXIST);
            j.setSuccess(false);
            logger.info("该业务参数【" + b.getConfId() + "】已存在!");
        }
        else
        {
            businessConfigDao.add(b);
            j.setMsg(Constant.ADD_SUCCESS);
            j.setSuccess(true);
            logger.info("添加业务参数【" + b.getConfId() + "】成功!");
        }
        return j;
    }

    @Override
    public Json edit(BusinessConfig b)
        throws Exception
    {
        Json j = new Json();
        TBusinessConfig t = businessConfigDao.getBusinessConfig(b.getConfId());
        if (t != null)
        {
            businessConfigDao.edit(b);
            j.setSuccess(true);
            j.setMsg(Constant.EDIT_SUCCESS);
            logger.info("修改业务参数【" + b.getConfId() + "】成功!");
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
                TBusinessConfig t = businessConfigDao.getBusinessConfig(id);
                if (t != null)
                {
                    businessConfigDao.delete(id);
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
    public BusinessConfig getBusinessConfig(String id)
        throws Exception
    {
        TBusinessConfig t = businessConfigDao.getBusinessConfig(id);
        if (t != null)
        {
            BusinessConfig b = new BusinessConfig();
            changeModel(t, b);
            return b;
        }
        return null;
    }

    @Override
    public List<TBusinessConfig> listBusinessConfig()
        throws Exception
    {
        List<TBusinessConfig> listBusinessConfig = businessConfigDao.listBusinessConfig();
        return listBusinessConfig;
    }
}
