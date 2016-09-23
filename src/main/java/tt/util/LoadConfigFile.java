package tt.util;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import org.apache.log4j.Logger;

import tt.listener.ServerListener;


/**
 * 读取config文件夹下的属性文件。 支持随时修改随时生效
 * 
 * @author zhangziqi
 */
public class LoadConfigFile
{

    public static Properties properties = new Properties();

    private static final String FILENAME = "config.properties";

    private static final String PFILE = ServerListener.getPath() + "config"
                                        + System.getProperty("file.separator") + FILENAME;

    static Logger log = Logger.getLogger(LoadConfigFile.class);

    private File p_file = null;// 参数配置文件

    private long m_lastModifiedTime = 0; // 配置文件最后修改时间

    private FileInputStream pFileInputStream = null;

    private static LoadConfigFile config = new LoadConfigFile();

    public LoadConfigFile()
    {
        try
        {
            // log.info("***************读取配置文件***********************");
            p_file = new File(PFILE);
            m_lastModifiedTime = p_file.lastModified();
            if (m_lastModifiedTime == 0)
            {
                log.error(PFILE + " file does not exist!");
            }
            pFileInputStream = new FileInputStream(p_file);
            properties.load(pFileInputStream);

        }
        catch (IOException e)
        {
            log.error("读取配置文件异常:" + e.getMessage());

        }
        finally
        {
            try
            {
                if (pFileInputStream != null)
                {
                    pFileInputStream.close();
                }
            }
            catch (IOException e)
            {
                // TODO Auto-generated catch block
                log.error("关闭读写文件流异常：" + e.getMessage());

            }
        }
    }

    /**
     * 静态工厂方法
     * 
     * @return 返还Config类的单一实例
     */
    public static synchronized LoadConfigFile getInstance()
    {
        return config;
    }

    /**
     * 从config配置文件获取程序运行参数
     * 
     * @param oid
     * @return
     */
    public String getValue(String key)
    {
        long newTime = p_file.lastModified();
        if (newTime == 0)
        {
            // 属性文件不存在
            if (m_lastModifiedTime == 0)
            {
                log.error(PFILE + " file does not exist!");
            }
            else
            {
                log.error(PFILE + " file was deleted!!");
            }
        }
        else if (newTime > m_lastModifiedTime)
        { // 被修改过的文件重新加载
            m_lastModifiedTime = p_file.lastModified();
            properties.clear();
            FileInputStream fis = null;
            try
            {
                fis = new FileInputStream(PFILE);
                log.info("***************重新读取配置文件***********************");
                properties.load(fis);
            }
            catch (Exception e)
            {
                log.error("load properties File error:" + e.getMessage());
                e.printStackTrace();
            }
            finally
            {
                if (null != fis)
                {
                    try
                    {
                        fis.close();
                    }
                    catch (IOException e)
                    {
                        e.printStackTrace();
                        log.error(e.getMessage());
                    }
                }
            }
        }
        String val = properties.getProperty(key);
        if ("".equals(val) || val == null)
        {
            log.info("配置文件里不存在这个【" + key + "】或者【" + key + "】的值是空");
            return null;
        }
        else
        {
            return val.trim();
        }
    }

    /*
     * public void setValueByOID(String oid, String value) throws Exception{
     * properties.setProperty(oid, value); FileOutputStream fos=null; try { fos=new
     * FileOutputStream( OnlineListener.getPath()+ "config" + System.getProperty("file.separator")
     * + FILENAME); properties.store(fos, OnlineListener.getPath() + "config" +
     * System.getProperty("file.separator") + FILENAME); } catch (FileNotFoundException e) {
     * e.printStackTrace(); } catch (IOException e) { e.printStackTrace(); }finally{ fos.close(); }
     * }
     */
}
