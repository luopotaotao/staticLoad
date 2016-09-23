package tt.service.impl;


import java.util.ArrayList;
import java.util.List;

import tt.dao.UserLogDaoI;
import tt.model.Tuserlog;
import tt.pageModel.DataGrid;
import tt.pageModel.Userlog;
import tt.service.UserlogServiceI;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserlogServiceImpl implements UserlogServiceI
{

    @Autowired
    private UserLogDaoI userlogDao;

    @Override
    public DataGrid datagrid(Userlog userlog, String name)
        throws Exception
    {
        List<Tuserlog> l = userlogDao.datagrid(userlog, name);
        List<Userlog> nl = new ArrayList<Userlog>();
        changeModel(l, nl);
        DataGrid dg = new DataGrid();
        dg.setRows(nl);
        dg.setTotal(userlogDao.getUserlogCount(userlog, name));
        return dg;
    }

    private void changeModel(List<Tuserlog> l, List<Userlog> nl)
    {
        if (l != null && l.size() > 0)
        {
            for (Tuserlog t : l)
            {
                Userlog b = new Userlog();
                BeanUtils.copyProperties(t, b);
                nl.add(b);
            }
        }
    }

    @Override
    public Userlog getUserLog(String id)
        throws Exception
    {
        Tuserlog t = userlogDao.getUserLog(id);
        Userlog u = new Userlog();
        if (t != null)
        {
            BeanUtils.copyProperties(t, u);
            u.setFormContentStr(t.getFormContent());
            return u;
        }
        return null;
    }

    @Override
    public void add(Userlog userlog)
        throws Exception
    {
        userlogDao.addUserlog(userlog);
    }

    @Override
    public List<Userlog> combobox(Userlog userlog)
        throws Exception
    {

        List<Tuserlog> ml = new ArrayList<Tuserlog>();
        Tuserlog t = new Tuserlog();
        t.setAdminName("全部");
        ml.add(t);

        List<Tuserlog> l = userlogDao.combobox(userlog);
        List<Userlog> nl = new ArrayList<Userlog>();
        changeModel(ml, nl);
        changeModel(l, nl);
        return nl;
    }

}
