package tt.service.bussiness.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.AboutDaoI;
import tt.dao.business.AreaDaoI;
import tt.model.business.About;
import tt.model.business.Area;
import tt.service.bussiness.AboutServiceI;
import tt.service.bussiness.AreaServiceI;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by tt on 2016/9/29.
 */
@Service("aboutService")
public class AboutServiceImpl implements AboutServiceI {
    @Autowired
    private AboutDaoI aboutDao;

    @Override
    public About get() {
        return aboutDao.get();
    }

    @Override
    public About save(About about) {
        About ret = null;
        int count = aboutDao.countBySql("select count(*) from b_about").intValue();
        if(count>0){
            About old = aboutDao.get();
            old.setContent(about.getContent());
            aboutDao.update(old);
            ret = old;
        }else{
            aboutDao.save(about);
            ret = about;
        }
        return ret;
    }
}
