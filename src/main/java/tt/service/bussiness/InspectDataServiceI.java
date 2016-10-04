package tt.service.bussiness;

import tt.model.business.InspectData;

import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
public interface InspectDataServiceI {
    List<InspectData> list(Integer PRG,Integer STZH);
    int del(List<Integer> ids);
}
