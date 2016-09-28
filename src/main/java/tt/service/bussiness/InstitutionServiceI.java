package tt.service.bussiness;

import tt.model.business.Institution;

import java.util.List;

/**
 * Created by taotao on 2016/9/23.
 */
public interface InstitutionServiceI {
    Institution get(int id);
    List<Institution> list(Byte typ, String name, int page, int PageSize);
    long count(Byte typ, String name);
    int add(Institution institution);
    int del(List<Integer> ids);
    int update(Institution institution);
}
