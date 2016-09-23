package tt.util.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 
 * @ClassName: Validator
 * @Description: 自定义注解bean
 * @author: zhangziqi
 * @modify: TODO(修改人)
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Validator
{

    /**
     * 验证注解的元素值不为null且不为空（字符串长度不为0）
     * 适用于 String
     * 默认：false 可以为null/长度为0
     * @return
     */
    public boolean notEmpty() default false;
    
    /**
     * 验证注解的元素值不是null 
     * 适用于 非基本类型
     * 默认：false 可以为null 
     * @return
     */
    public boolean notNull() default false;
    
    /**
     * 验证注解的元素值长度小于max
     * 适用于 String
     * 默认 -1 不验证
     * @return
     */
    public int length_Max() default -1;
    
    /**
     * 验证注解的元素值长度大于min
     * 适用于 String
     * 默认 -1不验证
     * @return
     */
    public int length_Min() default -1;
    
    /**
     * 期望的int类型值
     * 适用于 整形
     * @return
     */
    public int[] accessIntValue() default {};
    
    /**
     * 期望的short类型值
     * 适用于 short
     * @return
     */
    public short[] accessShortValue() default {};
    
    /**
     * 期望的Byte类型值
     * 适用于 Byte
     * @return
     */
    public byte[] accessByteValue() default {};
    
    /**
     * 验证注解的元素值小于max
     * 适用于 int 
     * @return
     */
    public int int_value_Max() default Integer.MAX_VALUE;
    
    /**
     * 验证注解的元素值大于min
     * 适用于 short
     * @return
     */
    public short short_value_Min() default Short.MIN_VALUE;

    /**
     * 验证注解的元素值小于max
     * 适用于 short 
     * @return
     */
    public short short_value_Max() default Short.MAX_VALUE;
    
    /**
     * 验证注解的元素值大于min
     * 适用于 short
     * @return
     */
    public short byte_value_Min() default Byte.MIN_VALUE;

    /**
     * 验证注解的元素值小于max
     * 适用于 short 
     * @return
     */
    public short byte_value_Max() default Byte.MAX_VALUE;
    
    
    /**
     * 验证注解的元素值大于min
     * 适用于 int
     * @return
     */
    public int int_value_Min() default Integer.MIN_VALUE;
    
    
    
    /**
     * 验证注解元素的值是否是数组中的值
     * 适用于 String
     * @return 
     */
    public String[] accessStrValue() default {};
    
    /**
     * 正则验证  
     * *              0次或多次
     * +              1次或多次
     * ?              0次或1次
     * {n}            恰好n次
     * {n,m}          从n到m次
     * [abc]          a、b 或 c（简单类）
     * [^abc]         任何字符，除了 a、b 或 c（否定）
     * [a-zA-Z]       a 到 z 或 A 到 Z，两头的字母包括在内（范围）
     * [a-d[m-p]]     a 到 d 或 m 到 p：[a-dm-p]（并集）
     * [a-z&&[def]]   d、e 或 f（交集）
     * [a-z&&[^bc]]   a 到 z，除了 b 和 c：[ad-z]（减去）
     * [a-z&&[^m-p]]  a 到 z，而非 m 到 p：[a-lq-z]（减去）
     * \d             数字：[0-9]
     * \D             非数字： [^0-9]
     * \s             空白字符：[ \t\n\x0B\f\r]
     * \S             非空白字符：[^\s]
     * \w             单词字符：[a-zA-Z_0-9]
     * \W             非单词字符：[^\w]
     */
    public String regex() default "";
    
    /**
     * 可自定义一些需要校验的属性
     */
    
}
