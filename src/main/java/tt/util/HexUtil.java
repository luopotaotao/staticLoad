package tt.util;


/**
 * Copyright (C), 2002-2012, www.chinarainbow.com.cn @{#} HexUtil.java Create on 2009-1-4
 * 下午01:44:22
 * 
 * @author bufegar
 * @version 1.0
 * @description 常用格式化方法 History Date: 2009-1-4
 * @author bufegar
 * @modification: 初始版本
 */

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public final class HexUtil
{
    /**
     * 生成消息摘要(SHA-1)
     * 
     * @param data
     * @return
     * @throws CrbAlgorithmException
     */
    public static final byte[] messageDigestBySHA1(byte[] data)
    {

        if (data == null || data.length == 0)
        {
            throw new NullPointerException("data.");
        }
        MessageDigest md = null;
        try
        {
            md = MessageDigest.getInstance("SHA-1");
            md.update(data);
        }
        catch (NoSuchAlgorithmException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if (md != null)
        {
            return md.digest();
        }
        else
        {
            return null;
        }

    }

    public static String getBerTlvData(String data)
    {
        try
        {
            int flag = Integer.parseInt(data.substring(2, 4), 16);
            int lLength = 0;
            int index = 0;
            if ((flag & 0x80) == 0x80)
            {
                lLength = flag & 0x0F;
                lLength <<= 1;
                index = 2;
            }
            return data.substring(2 + lLength + index);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }

    public static byte[] hexStringToBytes(String s)
    {
        int len = s.length() / 2;
        byte[] out = new byte[len];

        for (int i = 0; i < len; i++ )
        {
            char ch = s.charAt(2 * i);
            char cl = s.charAt(2 * i + 1);
            byte bh = charToByte(ch);
            byte bl = charToByte(cl);
            byte b = (byte)(bh * 16 + bl);
            out[i] = b;

        }
        return out;
    }

    public static byte charToByte(char c)
    {
        if (c >= 0x31 && c <= 0x39)
        {
            return (byte)(c - 0x30);
        }
        else if (c >= 0x41 && c <= 0x46)
        {
            return (byte)(c - 0x41 + 0x0A);
        }
        else if (c >= 0x61 && c <= 0x66)
        {
            return (byte)(c - 0x61 + 0x0A);
        }
        else
        {
            return 0;
        }
    }

    public static String bytesToHexString(byte[] abyte0)
    {
        String s = "";
        if (abyte0 != null)
        {
            for (int i = 0; i < abyte0.length; i++ )
            {
                s = s + byteToHexString(abyte0[i]);
            }
        }
        return s;
    }

    public static String byteToHexString(byte byte0)
        throws NumberFormatException
    {
        // if (byte0 < -128)
        // throw new NumberFormatException(
        // "Bad byte: No values under -128 allowed. It was: " + byte0);
        // if (byte0 > 127)
        // throw new NumberFormatException(
        // "Bad byte: No values over 127 allowed. It was: " + byte0);
        int i;
        if (byte0 < 0)
        {
            i = byte0 + 256;
        }
        else
        {
            i = byte0;
        }
        int j = i / 16;
        int k = i % 16;
        String s = intToHexString(j) + intToHexString(k);
        return s;
    }

    public static String intToHexString(int i)
    {
        if (i < 10)
        {
            return String.valueOf((char)(i + 48));
        }
        else
        {
            return String.valueOf((char)((i - 10) + 97));
        }

    }

    // 十六进制转二进制
    public static String hexString2binaryString(String hexString)
    {
        if (hexString == null || hexString.length() % 2 != 0)
        {
            return null;
        }
        String bString = "";
        String tmp ="";
        for (int i = 0; i < hexString.length(); i++ )
        {
            tmp = "0000"
                  + Integer.toBinaryString(Integer.parseInt(hexString.substring(i, i + 1), 16));
            bString += tmp.substring(tmp.length() - 4);
        }
        return bString;
    }

    // 二进制转十六进制
    public static String binaryString2hexString(String bString)
    {
        if (bString == null || bString.equals("") || bString.length() % 8 != 0)
        {
            return null;
        }
        StringBuffer tmp = new StringBuffer();
        int iTmp = 0;
        for (int i = 0; i < bString.length(); i += 4)
        {
            iTmp = 0;
            for (int j = 0; j < 4; j++ )
            {
                iTmp += Integer.parseInt(bString.substring(i + j, i + j + 1)) << (4 - j - 1);
            }
            tmp.append(Integer.toHexString(iTmp));
        }
        return tmp.toString();
    }

}
