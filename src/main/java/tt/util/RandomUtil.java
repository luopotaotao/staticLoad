package tt.util;


import java.util.Random;


/**
 * 生成随机密码工具类
 * 
 * @author
 */
public class RandomUtil
{
    public static String generateWord()
    {
        // 密码
        String password = "";

        // 随机生成三位小写字母
        String lowerStr = "abcdefghijklmnopqrstuvwxyz";
        for (int i = 0; i < 3; i++ )
        {
            password += lowerStr.charAt((int)(Math.random() * lowerStr.length()));
        }

        // 随机生成三位大写字母
        String upperStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        for (int i = 0; i < 3; i++ )
        {
            password += upperStr.charAt((int)(Math.random() * upperStr.length()));
        }

        // 随机生成两位数字
        String number = "0123456789";
        for (int i = 0; i < 2; i++ )
        {
            password += number.charAt((int)(Math.random() * number.length()));
        }

        // 随机生成两位特殊字符
        String specialStr = "@#$%^*+|/=~`!?,.:;-_(){}[]/";
        for (int i = 0; i < 2; i++ )
        {
            password += specialStr.charAt((int)(Math.random() * specialStr.length()));
        }
        return password;
    }

    // 生成随机数字和字母,
    public static String getStringRandom(int length)
    {

        String val = "";
        Random random = new Random();

        // 参数length，表示生成几位随机数
        for (int i = 0; i < length; i++ )
        {

            String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
            // 输出字母还是数字
            if ("char".equalsIgnoreCase(charOrNum))
            {
                // 输出是大写字母还是小写字母
                int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;
                val += (char)(random.nextInt(26) + temp);
            }
            else if ("num".equalsIgnoreCase(charOrNum))
            {
                val += String.valueOf(random.nextInt(10));
            }
        }
        return val;
    }
}
