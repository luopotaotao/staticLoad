package tt.util;

/**
 * 从cplc里截取seid工具类
 * 
 * @author
 */
public class SeidCplcUtil
{

    public static String getSeidByCplc(String cplc)
    {
        String seid = cplc.substring(0, 4) + cplc.substring(20, 36);

        return seid;
    }

}
