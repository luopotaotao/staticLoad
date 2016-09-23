package tt.util;


import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import org.bouncycastle.crypto.PBEParametersGenerator;
import org.bouncycastle.crypto.digests.SHA256Digest;
import org.bouncycastle.crypto.generators.PKCS5S2ParametersGenerator;
import org.bouncycastle.crypto.params.KeyParameter;

import com.crb.util.CrbUtil;


/*
 * 文 件 名: PBKDF2.java 版 权: Huawei Technologies Co., Ltd. Copyright 2009-2011, All rights reserved 描
 * 述: <描述> 创 建 人: w00275872 创建时间: 2015年8月1日
 */

/**
 * <一句话功能简述> <功能详细描述>
 * 
 * @author w00275872
 * @version [华为终端云统一账号模块, 2015年8月1日]
 * @see [相关类/方法]
 */
public class PBKDF2
{

    /**
     * 使用 Bouncy Castle 支持PBKDF2的SHA256算法 <功能详细描述>
     * 
     * @param password
     * @return
     * @throws NoSuchAlgorithmException
     * @see [类、类#方法、类#成员]
     */
    public static String generateStorngPasswordHash256ByBCP(byte[] salt, String password)
        throws NoSuchAlgorithmException
    {

        int iterations = 500;
        PKCS5S2ParametersGenerator generator = new PKCS5S2ParametersGenerator(new SHA256Digest());

        generator.init(PBEParametersGenerator.PKCS5PasswordToUTF8Bytes(password.toCharArray()),
            salt, iterations);
        KeyParameter key1 = (KeyParameter)generator.generateDerivedMacParameters(256);
        return CrbUtil.ba2HexString(salt) + ":" + CrbUtil.ba2HexString(key1.getKey());

    }

    public static String getSalt()
        throws NoSuchAlgorithmException
    {
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        byte[] salt = new byte[16];
        sr.nextBytes(salt);
        return salt.toString();
    }

    private static String toHex(byte[] array)
        throws NoSuchAlgorithmException
    {
        BigInteger bi = new BigInteger(1, array);
        String hex = bi.toString(16);
        int paddingLength = (array.length * 2) - hex.length();
        if (paddingLength > 0)
        {
            return String.format("%0" + paddingLength + "d", 0) + hex;
        }
        else
        {
            return hex;
        }
    }

}
