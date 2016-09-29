package tt.service.bussiness;

import tt.model.business.Project;

import java.util.List;

/**
 * Created by tt on 2016/9/29.
 */
public interface ProjectServiceI{
    Project get(int id);

    List<Project> list(Integer area_id, String name, Integer page, Integer pageSize);

    long count(Integer area_id, String name);

    int add(Project project);

    int update(Project project);

    int del(List<Integer> list);
}
