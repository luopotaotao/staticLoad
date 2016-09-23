package tt.util;


import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Date;


/**
 * 反射工具类
 * 
 * @author kiky zhang
 */
public class ReflectionTools
{

    /**
     * 通过类对象，类中属性名称，获取属性值 例： User u = new User(); u.setName("kiky");
     * getPropertyValueByClassNameAndPropertyName(u, "name"); 得到 kiky
     * 
     * @param object
     * @param name
     * @return
     * @throws SecurityException
     * @throws NoSuchMethodException
     * @throws Exception
     */
    public static Object getPropertyValueByClassNameAndPropertyName(Object object, String name)
        throws SecurityException, NoSuchMethodException, Exception
    {
        if (object != null && name != null && !"".equals(name))
        {
            // 拿到该类
            Class<?> clz = object.getClass();
            // 获取实体类的所有属性，返回Field数组
            Field[] fields = clz.getDeclaredFields();
            for (Field field : fields)
            {
                if (name.equals(field.getName()))
                {
                    // 如果该属性的类型是String
                    if (field.getGenericType().toString().equals("class java.lang.String"))
                    {
                        // 拿到该属性的gettet方法 他是根据拼凑的字符来找你写的getter方法的
                        Method m = (Method)object.getClass().getMethod(
                            "get" + getMethodName(field.getName()));
                        String val = (String)m.invoke(object);
                        return val;
                    }
                    // 如果该属性的类型是Integer
                    if (field.getGenericType().toString().equals("class java.lang.Integer"))
                    {
                        Method m = (Method)object.getClass().getMethod(
                            "get" + getMethodName(field.getName()));
                        Integer val = (Integer)m.invoke(object);
                        if (val != null)
                        {
                            return val.intValue();
                        }
                    }
                    // 如果该属性的类型是Date
                    if (field.getGenericType().toString().equals("class java.util.Date"))
                    {
                        Method m = (Method)object.getClass().getMethod(
                            "get" + getMethodName(field.getName()));
                        Date val = (Date)m.invoke(object);
                        if (val != null)
                        {
                            return val;
                        }
                    }
                }
            }
        }
        return null;
    }

    // 把一个字符串的第一个字母大写、效率是最高的、
    private static String getMethodName(String fildeName)
        throws Exception
    {
        byte[] items = fildeName.getBytes();
        items[0] = (byte)((char)items[0] - 'a' + 'A');
        return new String(items);
    }
}
