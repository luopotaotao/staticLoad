package tt.util;


import java.util.ResourceBundle;


/**
 * 项目参数工具类
 * 
 * @author zhangziqi
 * @version 2015年12月25日
 * @see ConfigUtil
 * @since 11
 */
public class ConfigUtil
{

    private static final ResourceBundle bundle = ResourceBundle.getBundle("config");

    /**
     * 获得sessionInfo名字
     * 
     * @return
     */
    public static final String getSessionInfoName()
    {
        return bundle.getString("sessionInfoName");
    }

    /**
     * 通过键获取值
     * 
     * @param key
     * @return
     */
    public static final String get(String key)
    {
        return bundle.getString(key);
    }

    /**
     * 获得允许上传文件的扩展名
     * 
     * @return
     */
    public static final String getUploadFileExts()
    {
        return bundle.getString("uploadFileExts");
    }

    /**
     * 获得上传文件的最大大小限制
     * 
     * @return
     */
    public static final long getUploadFileMaxSize()
    {
        return Long.valueOf(bundle.getString("uploadFileMaxSize"));
    }

}
