package tt.util.annotation;


import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.log4j.Logger;


public class ValidatorAnnotationBean
{
    static Logger logger = Logger.getLogger(ValidatorAnnotationBean.class);

    public static boolean validatorBeanParams(Object object, List<String> list)
        throws IllegalAccessException, IllegalArgumentException, InvocationTargetException
    {
        boolean result = true;
        if (object != null)
        {
            // 拿到该类
            Class<?> cls = object.getClass();
            Method[] methods = cls.getMethods();
            for (Method method : methods)
            {
                String methodName = method.getName();
                if (Modifier.isStatic(method.getModifiers()))
                {
                    continue;
                }

                if (method.getReturnType().equals(Void.TYPE))
                {
                    continue;
                }

                if (method.getParameterTypes().length != 0)
                {
                    continue;
                }

                if (method.getName().equals("getMetaClass")
                    && method.getReturnType().getName().equals("groovy.lang.MetaClass"))
                {
                    continue;
                }
                String propertyName;
                if (methodName.startsWith("get"))
                {
                    if (methodName.length() < 4)
                    {
                        continue;
                    }

                    if (methodName.equals("getClass"))
                    {
                        continue;
                    }

                    char c3 = methodName.charAt(3);

                    if (Character.isUpperCase(c3))
                    {
                        propertyName = decapitalize(methodName.substring(3));
                    }
                    // 考虑变量名已下划线开始命名
                    else if (c3 == '_')
                    {
                        propertyName = methodName.substring(3);
                    }
                    else
                    {
                        continue;
                    }

                    boolean ignore = isPropertyInClass(cls, propertyName);

                    if (ignore)
                    {
                        continue;
                    }
                }
                // boolean类型函数
                else if (methodName.startsWith("is"))
                {
                    if (methodName.length() < 3)
                    {
                        continue;
                    }

                    char c2 = methodName.charAt(2);

                    if (Character.isUpperCase(c2))
                    {
                        propertyName = decapitalize(methodName.substring(2));
                    }
                    else if (c2 == '_')
                    {
                        propertyName = methodName.substring(2);
                    }
                    else
                    {
                        continue;
                    }
                    boolean ignore = isPropertyInClass(cls, propertyName);

                    if (ignore)
                    {
                        continue;
                    }
                }
                else
                {
                    continue;
                }
                // list存在则验证需要验证的
                if (list != null)
                {
                    for (int i = list.size() - 1; i >= 0; i-- )
                    {
                        String[] strs = list.get(i).split("\\.");
                        if (strs[0].equals(propertyName))
                        {
                            list.remove(i);
                            if (validatorAnotation(cls, propertyName, method.invoke(object)))
                            {
                                if (strs.length != 1)
                                {
                                    List<String> sublist = new ArrayList<String>();
                                    for (int k = 1; k < strs.length; k++ )
                                    {
                                        sublist.add(strs[k]);
                                    }
                                    validatorBeanParams(method.invoke(object), sublist);
                                }
                            }
                            else
                            {
                                result = false;
                                break;
                            }
                        }
                    }
                }
                // list不存在则全部验证
                else
                {
                    validatorBeanParams(method.invoke(object), null);
                    result = validatorAnotation(cls, propertyName, method.invoke(object));
                    return result;
                }
            }
        }
        return result;
    }

    public static boolean validatorAnotation(Class<?> cls, String propertyName, Object obj)
    {
        boolean result = true;
        Field[] fields = cls.getDeclaredFields();
        for (Field field : fields)
        {
            if (field.isAnnotationPresent(Validator.class))
            {
                if (propertyName.equals(field.getName()))
                {
                    Validator validator = field.getAnnotation(Validator.class);
                    if (field.isAnnotationPresent(Validator.class))
                    {
                        if (field.getType().isPrimitive()) // 基础类型
                        {
                            // 目前基础类型只支持int、long
                            if (field.getType().toString().equals("int"))
                            {
                                Integer val = (Integer)obj;
                                int[] accessvalue = validator.accessIntValue();
                                if (accessvalue.length != 0)
                                {
                                    boolean b = true;
                                    for (int i = 0; i < accessvalue.length; i++ )
                                    {
                                        if (val == accessvalue[i])
                                        {
                                            b = false;
                                            break;
                                        }
                                    }
                                    if (b)
                                    {
                                        logger.info("[信息]-[" + field.getType().toString() + "]-["
                                                    + field.getName() + "]-[" + val + "]-值不满足期望值:"
                                                    + Arrays.toString(validator.accessIntValue()));
                                        result = false;
                                        break;
                                    }
                                }
                                if (val > validator.int_value_Max())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值大于期望的最大值");
                                    result = false;
                                    break;
                                }
                                if (val < validator.int_value_Min())
                                {
                                    logger.info("[信息]-[" + field.getType().toString() + "]-["
                                                + field.getName() + "]-[" + val + "]-值小于期望的最小值:"
                                                + validator.int_value_Min());
                                    result = false;
                                    break;
                                }
                            }
                            else if (field.getType().toString().equals("long"))
                            {
                                long val = (Long)obj;
                                int[] accessvalue = validator.accessIntValue();
                                if (accessvalue.length != 0)
                                {
                                    boolean b = true;
                                    for (int i = 0; i < accessvalue.length; i++ )
                                    {
                                        if (val == accessvalue[i])
                                        {
                                            b = false;
                                            break;
                                        }
                                    }
                                    if (b)
                                    {
                                        logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                    + "]-值不满足期望值");
                                        result = false;
                                        break;
                                    }
                                }
                                if (val > validator.int_value_Max())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值大于期望的最大值");
                                    result = false;
                                    break;
                                }
                                if (val < validator.int_value_Min())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值小于期望的最小值");
                                    result = false;
                                    break;
                                }
                            }
                            else if (field.getType().toString().equals("double"))
                            {
                                double val = (Double)obj;
                                if (val > validator.int_value_Max())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值大于期望的最大值");
                                    result = false;
                                    break;
                                }
                                if (val < validator.int_value_Min())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值小于期望的最小值");
                                    result = false;
                                    break;
                                }
                            }
                            else if (field.getType().toString().equals("float"))
                            {
                                double val = (Double)obj;
                                if (val > validator.int_value_Max())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值大于期望的最大值");
                                    result = false;
                                    break;
                                }
                                if (val < validator.int_value_Min())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值小于期望的最小值");
                                    result = false;
                                    break;
                                }
                            }
                            else if (field.getType().toString().equals("byte"))
                            {
                                byte val = (Byte)obj;
                                byte[] accessByteValue = validator.accessByteValue();
                                if (accessByteValue.length != 0)
                                {
                                    boolean b = true;
                                    for (int i = 0; i < accessByteValue.length; i++ )
                                    {
                                        if (val == accessByteValue[i])
                                        {
                                            b = false;
                                            break;
                                        }
                                    }
                                    if (b)
                                    {
                                        logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                    + "]-值不满足期望值");
                                        result = false;
                                        break;
                                    }
                                }
                                if (val > validator.byte_value_Max())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值大于期望的最大值");
                                    result = false;
                                    break;
                                }
                                if (val < validator.byte_value_Min())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值小于期望的最小值");
                                    result = false;
                                    break;
                                }
                            }
                            else
                            {
                                logger.info("[信息]-:" + field.getType().toString() + "，暂时不支持");
                            }
                        }
                        // else if(field.getType().isArray())
                        // {
                        // System.out.print("数组");
                        // }
                        else
                        {

                            // 目前非基础类型支持String、Integer、Long、
                            if (field.getType().toString().equals("class java.lang.String"))
                            {
                                String val = (String)obj;
                                if (validator.notNull() || validator.notEmpty())
                                {
                                    if (val == null)
                                    {
                                        logger.info("[信息]-[" + propertyName + "]-[" + val
                                                    + "]-值为空");
                                        result = false;
                                        break;
                                    }
                                    else
                                    {
                                        if (validator.notEmpty())
                                        {
                                            if (val.length() == 0)
                                            {
                                                logger.info("[信息]-[" + propertyName + "]-[" + val
                                                            + "]-字符串长度为0");
                                                result = false;
                                                break;
                                            }
                                        }
                                    }
                                }
                                if (val != null && val.length() != 0)
                                {

                                    String[] accessvalue = validator.accessStrValue();
                                    if (accessvalue.length != 0)
                                    {
                                        boolean b = true;
                                        for (int i = 0; i < accessvalue.length; i++ )
                                        {
                                            if (val.equals(accessvalue[i]))
                                            {
                                                b = false;
                                                break;
                                            }
                                        }
                                        if (b)
                                        {
                                            logger.info("[信息]-["
                                                        + field.getType().toString()
                                                        + "]-["
                                                        + field.getName()
                                                        + "]-["
                                                        + val
                                                        + "]-值不满足期望值:"
                                                        + Arrays.toString(validator.accessStrValue()));
                                            result = false;
                                            break;
                                        }
                                    }

                                    if (validator.length_Min() != -1)
                                    {
                                        if (val.length() < validator.length_Min())
                                        {
                                            logger.info("[信息]-[" + propertyName + "]-[" + val
                                                        + "]-字符串长度小于要求的最小长度:"
                                                        + validator.length_Min());
                                            result = false;
                                            break;
                                        }
                                    }
                                    if (validator.length_Max() != -1)
                                    {
                                        if (val.length() > validator.length_Max())
                                        {
                                            logger.info("[信息]-[" + propertyName + "]-[" + val
                                                        + "]-字符串长度大于要求的最大长度:"
                                                        + validator.length_Max());
                                            result = false;
                                            break;
                                        }
                                    }
                                    if (!validator.regex().isEmpty())
                                    {
                                        if (!val.matches(validator.regex()))
                                        {
                                            logger.info("[信息]-[" + propertyName + "]-[" + val
                                                        + "]-字符串不满足正则:" + validator.regex());
                                            result = false;
                                            break;
                                        }
                                    }

                                }
                            }
                            else if (field.getType().toString().equals("class java.lang.Integer"))
                            {
                                Integer val = (Integer)obj;
                                int[] accessvalue = validator.accessIntValue();
                                if (validator.notNull() || validator.notEmpty())
                                {
                                    if (val == null)
                                    {
                                        logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                    + "]-值为空");
                                        result = false;
                                        break;
                                    }
                                }
                                if (accessvalue.length != 0)
                                {
                                    boolean b = true;
                                    for (int i = 0; i < accessvalue.length; i++ )
                                    {
                                        if (val == accessvalue[i])
                                        {
                                            b = false;
                                            break;
                                        }
                                    }
                                    if (b)
                                    {
                                        logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                    + "]-值不满足期望值");
                                        result = false;
                                        break;
                                    }
                                }
                                if (val > validator.int_value_Max())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值大于期望的最大值");
                                    result = false;
                                    break;
                                }
                                if (val < validator.int_value_Min())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值小于期望的最小值");
                                    result = false;
                                    break;
                                }
                            }
                            else if (field.getType().toString().equals("class java.lang.Long"))
                            {
                                Long val = (Long)obj;
                                int[] accessvalue = validator.accessIntValue();
                                if (validator.notNull() || validator.notEmpty())
                                {
                                    if (val == null)
                                    {
                                        logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                    + "]-值为空");
                                        result = false;
                                        break;
                                    }
                                }
                                if (accessvalue.length != 0)
                                {
                                    boolean b = true;
                                    for (int i = 0; i < accessvalue.length; i++ )
                                    {
                                        if (val == accessvalue[i])
                                        {
                                            b = false;
                                            break;
                                        }
                                    }
                                    if (b)
                                    {
                                        logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                    + "]-值不满足期望值");
                                        result = false;
                                        break;
                                    }
                                }
                                if (val > validator.int_value_Max())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值大于期望的最大值");
                                    result = false;
                                    break;
                                }
                                if (val < validator.int_value_Min())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值小于期望的最小值");
                                    result = false;
                                    break;
                                }
                            }
                            else if (field.getType().toString().equals("class java.lang.Byte"))
                            {
                                Byte val = (Byte)obj;
                                byte[] accessByteValue = validator.accessByteValue();
                                if (validator.notNull() || validator.notEmpty())
                                {
                                    if (val == null)
                                    {
                                        logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                    + "]-值为空");
                                        result = false;
                                        break;
                                    }
                                }
                                if (accessByteValue.length != 0)
                                {
                                    boolean b = true;
                                    for (int i = 0; i < accessByteValue.length; i++ )
                                    {
                                        if (val == accessByteValue[i])
                                        {
                                            b = false;
                                            break;
                                        }
                                    }
                                    if (b)
                                    {
                                        logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                    + "]-值不满足期望值");
                                        result = false;
                                        break;
                                    }
                                }
                                if (val > validator.byte_value_Max())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值大于期望的最大值");
                                    result = false;
                                    break;
                                }
                                if (val < validator.byte_value_Min())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值小于期望的最小值");
                                    result = false;
                                    break;
                                }
                            }
                            
                            
                            else if (field.getType().toString().equals("class java.lang.Short"))
                            {
                                Short val = (Short)obj;
                                short[] accessvalue = validator.accessShortValue();
                                if (validator.notNull() || validator.notEmpty())
                                {
                                    if (val == null)
                                    {
                                        logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                    + "]-值为空");
                                        result = false;
                                        break;
                                    }
                                }
                                if (accessvalue.length != 0)
                                {
                                    boolean b = true;
                                    for (int i = 0; i < accessvalue.length; i++ )
                                    {
                                        if (val == accessvalue[i])
                                        {
                                            b = false;
                                            break;
                                        }
                                    }
                                    if (b)
                                    {
                                        logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                    + "]-值不满足期望值" + Arrays.toString(accessvalue));
                                        result = false;
                                        break;
                                    }
                                }
                                if (val > validator.short_value_Max())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值大于期望的最大值：" + validator.short_value_Max());
                                    result = false;
                                    break;
                                }
                                if (val < validator.short_value_Min())
                                {
                                    logger.info("[信息]-[" + field.getName() + "]-[" + val
                                                + "]-值小于期望的最小值：" + validator.short_value_Min());
                                    result = false;
                                    break;
                                }
                            }
                            else
                            {
                                logger.info("[信息]-" + propertyName + "("
                                            + field.getType().toString() + ")，暂时不支持");
                            }
                        }
                    }
                }
            }
        }
        return result;
    }

    public static String decapitalize(String name)
    {
        if (name == null || name.length() == 0)
        {
            return name;
        }
        if (name.length() > 1 && Character.isUpperCase(name.charAt(1))
            && Character.isUpperCase(name.charAt(0)))
        {
            return name;
        }
        char[] chars = name.toCharArray();
        chars[0] = Character.toLowerCase(chars[0]);
        return new String(chars);
    }

    private static boolean isPropertyInClass(Class<?> clazz, String propertyName)
    {
        Field[] fields = clazz.getFields();
        for (int i = 0; i < fields.length; i++ )
        {
            if (propertyName.equals(fields[i]))
            {
                return true;
            }
        }
        if (clazz.getSuperclass() != Object.class && clazz.getSuperclass() != null)
        {
            if (isPropertyInClass(clazz.getSuperclass(), propertyName))
            {
                return true;
            }
        }
        return false;
    }
}
