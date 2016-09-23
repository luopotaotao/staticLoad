package tt.util;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


/**
 * 日期工具类
 * 
 * @author
 */
public class DateUtil
{
    /**
     * 获取一个日期＋随机数（四位） todayandNum
     * 
     * @description:
     * @return
     */
    // public static String todayandNum() {
    // Calendar c = Calendar.getInstance();
    // SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    // return sdf.format(c.getTime()) + getRandom();
    // }

    /**
     * 获得一个四位是随机数 getRandom
     * 
     * @description:
     * @return
     */
    // public static int getRandom() {
    // Random random = new Random(System.currentTimeMillis());
    // return random.nextInt() % 1000;
    //
    // }
    /**
     * 将Date类型转换为字符串
     * 
     * @param date
     *            日期类型
     * @return 日期字符串
     */
    public static String format(Date date)
    {
        return format(date, "yyyy-MM-dd HH:mm:ss");
    }

    /**
     * 将Date类型转换为字符串
     * 
     * @param date
     *            日期类型
     * @param pattern
     *            字符串格式
     * @return 日期字符串
     */
    public static String format(Date date, String pattern)
    {
        if (date == null)
        {
            return "null";
        }
        if (pattern == null || pattern.equals("") || pattern.equals("null"))
        {
            pattern = "yyyy-MM-dd HH:mm:ss";
        }
        return new SimpleDateFormat(pattern).format(date);
    }

    /**
     * 将字符串转换为Date类型
     * 
     * @param date
     *            字符串类型
     * @return 日期类型
     */
    public static Date format(String date)
    {
        return format(date, null);
    }

    /**
     * 将字符串转换为Date类型
     * 
     * @param date
     *            字符串类型
     * @param pattern
     *            格式
     * @return 日期类型
     */
    public static Date format(String date, String pattern)
    {
        if (pattern == null || pattern.equals("") || pattern.equals("null"))
        {
            pattern = "yyyy-MM-dd HH:mm:ss";
        }
        if (date == null || date.equals("") || date.equals("null"))
        {
            return new Date();
        }
        Date d = null;
        try
        {
            d = new SimpleDateFormat(pattern).parse(date);
        }
        catch (ParseException pe)
        {}
        return d;
    }

    /**
     * 获取一个日期 todayandNum2
     * 
     * @description:
     * @return
     */
    public static String todayandNum2()
    {
        Calendar c = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
        return sdf.format(c.getTime());
    }

    // public static String getrftagRandNum() {
    // Date date = new Date();
    // String pattern = "yyyyMMddHHmmss";
    // SecureRandom random = new SecureRandom();
    // int vCode = random.nextInt(99);
    //
    // return new java.text.SimpleDateFormat(pattern).format(date) + vCode;
    // }

    /**
     * 将Date类型转换为字符串
     * 
     * @param date
     *            日期类型
     * @return 日期字符串
     */
    public static Date formatStartDay(Date date)
    {
        String day = format(date, "yyyy-MM-dd");
        return format(day + " 00:00:00");
    }

    public static Date formatEndDay(Date date)
    {
        String day = format(date, "yyyy-MM-dd");
        return format(day + " 23:59:59");
    }

    public static Date formatStartDay(String date)
    {
        return format(date + " 00:00:00");
    }

    public static Date formatEndDay(String date)
    {
        return format(date + " 23:59:59");
    }

    /**
     * @Description:比较两个日期的天数差
     * @Check parameters by the 【caller】 or 【itself】(参数由谁校验)
     * @param date1
     * @param date2
     * @return
     */
    public static int daysBetween(Date date1, Date date2)

    {

        Calendar cal = Calendar.getInstance();

        cal.setTime(date1);

        long time1 = cal.getTimeInMillis();

        cal.setTime(date2);

        long time2 = cal.getTimeInMillis();

        long between_days = (time2 - time1) / (1000 * 3600 * 24);

        return Integer.parseInt(String.valueOf(between_days));

    }
}
