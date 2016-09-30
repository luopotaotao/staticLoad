package tt.service.bussiness;

import tt.model.business.Area;

/**
 * Created by tt on 2016/9/29.
 */
public interface AreaServiceI {
    Area load(Integer id);

    Area add(Area area);

    Area update(Area area);

    int del(Integer id);
}
