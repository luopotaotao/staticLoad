package tt.service.bussiness;


import tt.model.business.InspectData;

public interface BInspectServiceI
{
    int add(InspectData ins);
    int updateStatus(String PRG, String STZH, String DevNB);
}
