package tt.service.bussiness.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tt.dao.business.FileDaoI;
import tt.model.business.File;
import tt.service.bussiness.FileService;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Created by tt on 2016/11/28.
 */
@Service
public class FileServiceImpl implements FileService {
    @Autowired
    private FileDaoI fileDao;
    @Override
    public File get(Serializable id, Integer dept_id) {
        return fileDao.getById(id);
    }

    @Override
    public List<File> list(Map<String, Object> params, Integer page, Integer pageSize, Integer dept_id) {
        return null;
    }

    @Override
    public File add(File instance, Integer dept_id) {
        instance.setDept_id(dept_id);
        fileDao.save(instance);
        return instance;
    }

    @Override
    public int del(List<Integer> ids, Integer dept_id) {
        return 0;
    }

    @Override
    public File update(File instance, Integer dept_id) {
        return null;
    }
}
