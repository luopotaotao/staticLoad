package tt.util;


import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;


public class StringDateToDateEditor extends PropertyEditorSupport
{

    private Logger logger = Logger.getLogger(StringDateToDateEditor.class);

    @Override
    public void setAsText(String text)
    {
        // TODO Auto-generated method stub
        Date value = null;
        String date = "yyyy/MM/dd HH:mm:ss";
        String date1 = "yyyy-MM-dd HH:mm:ss";
        String date2 = "yyyy-MM-dd";
        String date3 = "hh:mi:ss";
        SimpleDateFormat sdf = new SimpleDateFormat();
        if (text != null)
        {
            if (text.length() == date1.length())
            {
                try
                {
                    sdf.applyPattern(date1);
                    value = sdf.parse(text);
                }
                catch (ParseException e)
                {
                    sdf.applyPattern(date);
                    try
                    {
                        value = sdf.parse(text);
                    }
                    catch (ParseException e1)
                    {
                        value = null;
                        logger.info("日期格式属性映射失败：" + text);
                    }
                }
            }
            else if (text.length() == date2.length())
            {
                try
                {
                    sdf.applyPattern(date2);
                    value = sdf.parse(text);
                }
                catch (ParseException e)
                {
                    value = null;
                    logger.info("日期格式属性映射失败：" + text);
                }
            }
            else if (text.length() == date3.length())
            {
                try
                {
                    sdf.applyPattern(date3);
                    value = sdf.parse(text);
                }
                catch (ParseException e)
                {
                    value = null;
                    logger.info("日期格式属性映射失败：" + text);
                }
            }
            else
            {
                value = null;
            }
        }
        else
        {
            value = null;
        }
        setValue(value);
    }

}
