package tt.util;


import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import com.crb.util.CrbUtil;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;



/**
 * 编码工具类 1.将byte[]转为各种进制的字符串 2.base 64 encode 3.base 64 decode 4.获取byte[]的md5值 5.获取字符串md5值
 * 6.结合base64实现md5加密 7.AES加密 8.AES加密为base 64 code 9.AES解密 10.将base 64 code AES解密
 * 
 * @author uikoo9
 * @version 0.0.7.20140601
 */
public class EncDecUtils
{
    private static final String KEY_ALGORITHM = "AES";

    private static final String CIPHER_ALGORITHM_CBC = "AES/CBC/PKCS5Padding";

    private static final String SHA1_PRNG = "SHA1PRNG";

    private static final String IV = "K*%JjlMNp08Ulh#j"; // IV length: must be 16 bytes long

    private static final String ENCODING = "UTF-8";

    /**
     * 将byte[]转为各种进制的字符串
     * 
     * @param bytes
     *            byte[]
     * @param radix
     *            可以转换进制的范围，从Character.MIN_RADIX到Character.MAX_RADIX，超出范围后变为10进制
     * @return 转换后的字符串
     */
    public static String binary(byte[] bytes, int radix)
    {
        return new BigInteger(1, bytes).toString(radix);// 这里的1代表正数
    }

    /**
     * base 64 encode
     * 
     * @param bytes
     *            待编码的byte[]
     * @return 编码后的base 64 code
     */
    public static String base64Encode(byte[] bytes)
    {
        return new BASE64Encoder().encode(bytes);
    }

    /**
     * base 64 decode
     * 
     * @param base64Code
     *            待解码的base 64 code
     * @return 解码后的byte[]
     * @throws Exception
     */
    public static byte[] base64Decode(String base64Code)
        throws Exception
    {
        return isEmpty(base64Code) ? null : new BASE64Decoder().decodeBuffer(base64Code);
    }

    /**
     * 获取byte[]的md5值
     * 
     * @param bytes
     *            byte[]
     * @return md5
     * @throws Exception
     */
    public static byte[] md5(byte[] bytes)
        throws Exception
    {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(bytes);

        return md.digest();
    }

    /**
     * 获取字符串md5值
     * 
     * @param msg
     * @return md5
     * @throws Exception
     */
    public static byte[] md5(String msg)
        throws Exception
    {
        return isEmpty(msg) ? null : md5(msg.getBytes());
    }

    /**
     * 结合base64实现md5加密
     * 
     * @param msg
     *            待加密字符串
     * @return 获取md5后转为base64
     * @throws Exception
     */
    public static String md5Encrypt(String msg)
        throws Exception
    {
        return isEmpty(msg) ? null : base64Encode(md5(msg));
    }

    /**
     * AES加密
     * 
     * @param content
     *            待加密的内容
     * @param encryptKey
     *            加密密钥
     * @return 加密后的byte[]
     * @throws Exception
     */
    public static byte[] aesEncryptToBytes(String content, String encryptKey)
        throws Exception
    {
        KeyGenerator kgen = KeyGenerator.getInstance(KEY_ALGORITHM);
        SecureRandom sr = SecureRandom.getInstance(SHA1_PRNG);
        sr.setSeed(encryptKey.getBytes());
        kgen.init(128, sr);

        SecretKey secretKey = kgen.generateKey();
        byte[] enCodeFormat = secretKey.getEncoded();
        SecretKeySpec keySpec = new SecretKeySpec(enCodeFormat, KEY_ALGORITHM);

        Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM_CBC);
        byte[] byteContent = content.getBytes(ENCODING);
        cipher.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(IV.getBytes()));

        return cipher.doFinal(byteContent);
    }

    /**
     * AES加密为base 64 code
     * 
     * @param content
     *            待加密的内容
     * @param encryptKey
     *            加密密钥
     * @return 加密后的base 64 code
     * @throws Exception
     */
    public static String aesEncrypt(String content, String encryptKey)
        throws Exception
    {
        return CrbUtil.base64ToHexString(base64Encode(aesEncryptToBytes(content, encryptKey)));
    }

    /**
     * AES解密
     * 
     * @param encryptBytes
     *            待解密的byte[]
     * @param decryptKey
     *            解密密钥
     * @return 解密后的String
     * @throws Exception
     */
    public static String aesDecryptByBytes(byte[] encryptBytes, String decryptKey)
        throws Exception
    {
        KeyGenerator kgen = KeyGenerator.getInstance(KEY_ALGORITHM);
        SecureRandom sr = SecureRandom.getInstance(SHA1_PRNG);
        sr.setSeed(decryptKey.getBytes());
        kgen.init(128, sr);

        Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM_CBC);
        cipher.init(Cipher.DECRYPT_MODE,
            new SecretKeySpec(kgen.generateKey().getEncoded(), KEY_ALGORITHM),
            new IvParameterSpec(IV.getBytes()));
        if (encryptBytes != null)
        {
            byte[] decryptBytes = cipher.doFinal(encryptBytes);
            return new String(decryptBytes, ENCODING);
        }
        else
        {
            return null;
        }
    }

    /**
     * 将base 64 code AES解密
     * 
     * @param encryptStr
     *            待解密的base 64 code
     * @param decryptKey
     *            解密密钥
     * @return 解密后的string
     * @throws Exception
     */
    public static String aesDecrypt(String encryptStr, String decryptKey)
        throws Exception
    {
        return isEmpty(encryptStr) ? null : aesDecryptByBytes(
            base64Decode(CrbUtil.hexString2Base64(encryptStr)), decryptKey);
    }

    public static boolean isEmpty(String str)
    {
        if (str == null)
        {
            return true;
        }

        if ("".equals(str.trim()) || str.length() == 0)
        {
            return true;
        }

        return false;
    }

}