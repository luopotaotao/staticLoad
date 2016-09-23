package tt.util;

import java.text.DecimalFormat;

import tt.pageModel.Privilege;

public class PrivilegesUtil {
	/**
	 * 解析权限串的方法。 传x入格式：c00400 结果：0，1，13
	 */
	public static Privilege getPrivileges(String pvalue) {
		Privilege prv = new Privilege();
		String sdPrvValue = "";
		String sdPrivileges = "";
		String pattern = "00000000";
		DecimalFormat df = new DecimalFormat(pattern);
		if (pvalue != null && pvalue.length() >= 2) {
			// 取第一字节
			String substr1 = pvalue.substring(0, 2);
			String binaryStr1 = df.format(Integer.parseInt(Integer
					.toBinaryString(Integer.parseInt(substr1, 16))));
			// System.out.println("binaryStr1:" + binaryStr1);
			if (!"0".equals(binaryStr1)) {
				if (binaryStr1.charAt(0) == '1') {
					sdPrvValue += "0,";
					sdPrivileges = "Security Domain,";
					if (binaryStr1.charAt(1) == '1') {
						sdPrvValue += "1,";
						sdPrivileges += "DAP Verfication,";
						if (binaryStr1.charAt(7) == '1') {
							sdPrvValue += "7,";
							sdPrivileges += "Mandated DAP Verification,";
						}
					}
					if (binaryStr1.charAt(2) == '1') {
						sdPrvValue += "2,";
						sdPrivileges += "Delegated Management,";
					}
				}
				if (binaryStr1.charAt(3) == '1') {
					sdPrvValue += "3,";
					sdPrivileges += "Card Lock,";
				}
				if (binaryStr1.charAt(4) == '1') {
					sdPrvValue += "4,";
					sdPrivileges += "Card Terminate,";
				}
				if (binaryStr1.charAt(5) == '1') {
					sdPrvValue += "5,";
					sdPrivileges += "Card Reset,";
				}
				if (binaryStr1.charAt(6) == '1') {
					sdPrvValue += "6,";
					sdPrivileges += "CVM Management,";
				}
			}

			if (pvalue.length() >= 6) {
				String substr2 = pvalue.substring(
						pvalue.length() - (pvalue.length() - 2),
						pvalue.length() - 2);
				if (substr2 != null) {
					String binaryStr2 = df.format(Integer.parseInt(Integer
							.toBinaryString(Integer.parseInt(substr2, 16))));
					if (!"0".equals(binaryStr2)) {
						if (binaryStr2.charAt(0) == '1') {
							sdPrvValue += "8,";
							sdPrivileges += "Trusted Path,";
						}
						if (binaryStr2.charAt(1) == '1') {
							sdPrvValue += "9,";
							sdPrivileges += "Authorized Management,";
						}
						if (binaryStr2.charAt(2) == '1') {
							sdPrvValue += "10,";
							sdPrivileges += "Token Management,";
						}
						if (binaryStr2.charAt(3) == '1') {
							sdPrvValue += "11,";
							sdPrivileges += "Global Delete,";
						}
						if (binaryStr2.charAt(4) == '1') {
							sdPrvValue += "12,";
							sdPrivileges += "Global Lock,";
						}
						if (binaryStr2.charAt(5) == '1') {
							sdPrvValue += "13,";
							sdPrivileges += "Global Registry,";
						}
						if (binaryStr2.charAt(6) == '1') {
							sdPrvValue += "14,";
							sdPrivileges += "Final Application,";
						}
						if (binaryStr2.charAt(7) == '1') {
							sdPrvValue += "15,";
							sdPrivileges += "Global Service,";
						}
					}
				}
				String substr3 = pvalue.substring(pvalue.length() - 2,
						pvalue.length());
				if (substr3 != null) {
					String binaryStr3 = df.format(Integer.parseInt(Integer
							.toBinaryString(Integer.parseInt(substr3, 16))));
					if (!"0".equals(binaryStr3)) {
						if (binaryStr3.charAt(0) == '1') {
							sdPrvValue += "16,";
							sdPrivileges += "Receipt Generation,";
						}
						if (binaryStr3.charAt(1) == '1') {
							sdPrvValue += "17,";
							sdPrivileges += "Ciphered Load File Data Block,";
						}
						if (binaryStr3.charAt(2) == '1') {
							sdPrvValue += "18,";
							sdPrivileges += "Contactless Activation,";
						}
						if (binaryStr3.charAt(3) == '1') {
							sdPrvValue += "19,";
							sdPrivileges += "Contactless Self-Activation,";
						}
					}
				}
			}
		}
		prv.setpValues(sdPrvValue);
		prv.setpNames(sdPrivileges);
		return prv;
	}

	public static String privilegesToHexString(String pString) {
		System.out.println("------传过来的权限串---------" + pString);
		if (pString == null || "".equals(pString)) {
			return "000000";
		}
		String[] pkStrings = pString.split(",");
		int[] privileges = new int[pkStrings.length];
		for (int i = 0; i < pkStrings.length; i++) {
			privileges[i] = Integer.valueOf(pkStrings[i]);
		}
		byte[] pribyte = new byte[24];
		for (int i = 0; i < pribyte.length; i++) {
			pribyte[i] = 0;
		}
		for (int i = 0; i < privileges.length; i++) {
			pribyte[privileges[i]] = 1;
			if (privileges[i] == 1) {
				pribyte[0] = 1;
			}
			if (privileges[i] == 2) {
				pribyte[0] = 1;
			}
			if (privileges[i] == 7) {
				pribyte[1] = 1;
				pribyte[0] = 1;
			}
		}
		String priString = bytesToString(pribyte);
		return binaryString2hexString(priString);
	}

	public static String bytesToString(byte abyte0[]) {
		String s = "";
		for (int i = 0; i < abyte0.length; i++)
			s = s + abyte0[i];

		return s;
	}

	// ------------------------------------------------------
	public static String binaryString2hexString(String bString) {
		if (bString == null || bString.equals("") || bString.length() % 8 != 0)
			return null;
		StringBuffer tmp = new StringBuffer();
		int iTmp = 0;
		for (int i = 0; i < bString.length(); i += 4) {
			iTmp = 0;
			for (int j = 0; j < 4; j++) {
				iTmp += Integer.parseInt(bString.substring(i + j, i + j + 1)) << (4 - j - 1);
			}
			tmp.append(Integer.toHexString(iTmp));
		}
		return tmp.toString();
	}

	
	
	
	
	/**
	 * 能力转换类
	 * @param str 例：1,2,3,4,5,6 ...
	 * @param byteLength 期望得到的字节数   1字节 bytelength = 1   2字节 bytelength = 2
	 * 
	 *  str = 1,2,3,4  bytelength = 1  ---> f0
	 *  
	 * @return
	 */
	public static String privilegesToHexString(String str,int byteLength)
	{
		String hexstring ="";
		if(byteLength > 0)
		{
			for(int i=0;i<byteLength;i++)
			{
				hexstring += "00";
			}
		}
		else
		{
			return hexstring;
		}
		String[] pkStrings = str.split(",");
		int[] privileges = new int[pkStrings.length];
		for (int i = 0; i < pkStrings.length; i++) {
			privileges[i] = Integer.valueOf(pkStrings[i]);
		}
		byte[] pribyte = new byte[byteLength*8];
		for (int i = 0; i < pribyte.length; i++) {
			pribyte[i] = 0;
		}
		for(int i =0; i<privileges.length;i++)
		{
			pribyte[privileges[i]-1]=1;
		}
		hexstring = bytesToString(pribyte);
		return binaryString2hexString(hexstring);
	}

	
//	public static void main(String[] args) {
//		System.out.println(HexStringExchangeprivileges("fffff0"));
//						
//	}
	
	public static String HexStringToprivileges(String str)
	{
		String result = "";
		String a = hexString2binaryString(str);
		if(a!=null  && !"".equals(a.trim()))
		{
			for(int i = 0 ; i < a.length() ;i++)
			{
				if(a.charAt(i)=='1')
				{
					result=result+(i+1)+",";
				}
			}
			if(result.length()>1)
			{
				result = result.substring(0,result.length()-1);
			}
		}
		return result;
	}
	
	
	
	public static String hexString2binaryString(String hexString)  
    {  
        if (hexString == null || hexString.length() % 2 != 0)  
            return null;  
        String bString = "", tmp;  
        for (int i = 0; i < hexString.length(); i++)  
        {  
            tmp = "0000"  
                    + Integer.toBinaryString(Integer.parseInt(hexString.substring(i, i + 1), 16));  
            bString += tmp.substring(tmp.length() - 4);  
        }  
        return bString;  
    }  
	
	/**
	 * 将十六进制转换成对应权限串
	 * @param shexStrings
	 * @return
	 */
	public static String HexStringExchangeprivileges(String shexStrings){
		    StringBuffer sb = new StringBuffer();
		    String ss = hexString2binaryString(shexStrings);
            if(ss==null || "".equals(ss.trim())){
        	      return null;
            }
			if (ss.charAt(0) == '1') 
			{
				sb.append("Security Domain").append("<br/>");
				if (ss.charAt(1) == '1') {
					if (ss.charAt(7) == '1') {
						sb.append("Mandated DAP Verification").append("<br/>");
					}
					else
					{
						sb.append("DAP Verfication").append("<br/>");
					}
				}
				if (ss.charAt(2) == '1') {
					sb.append("Delegated Management").append("<br/>");
				}
			}
			if (ss.charAt(3) == '1') {
				sb.append("Card Lock").append("<br/>");
			}
			if (ss.charAt(4) == '1') {
				sb.append("Card Terminate").append("<br/>");
			}
			if (ss.charAt(5) == '1') {
				sb.append("Card Reset").append("<br/>");
			}
			if (ss.charAt(6) == '1') {
				sb.append("CVM Management").append("<br/>");
			}
			if (ss.charAt(7) == '1') {
				sb.append("Mandated DAP Verification").append("<br/>");
			}
			if (ss.charAt(8) == '1') {
				sb.append("Trusted Path").append("<br/>");
			}
			if (ss.charAt(9) == '1') {
				sb.append("Authorized Management").append("<br/>");
			}
			if (ss.charAt(10) == '1') {
				sb.append("Token Management").append("<br/>");
			}
			if (ss.charAt(11) == '1') {
				sb.append("Global Delete").append("<br/>");
			}
			if (ss.charAt(12) == '1') {
				sb.append("Global Lock").append("<br/>");
			}
			if (ss.charAt(13) == '1') {
				sb.append("Global Registry").append("<br/>");
			}
			if (ss.charAt(14) == '1') {
				sb.append("Final Application").append("<br/>");
			}
			if (ss.charAt(15) == '1') {
				sb.append("Global Service").append("<br/>");
			}
			if (ss.charAt(16) == '1') {
				sb.append("Receipt Generation").append("<br/>");
			}
			if (ss.charAt(17) == '1') {
				sb.append("Ciphered Load File Data Block").append("<br/>");
			}
			if (ss.charAt(18) == '1') {
				sb.append("Contactless Activation").append("<br/>");
			}
			if (ss.charAt(19) == '1') {
				sb.append("Contactless Self-Activation").append("<br/>");
			}

		return sb.toString();
	}
	
}
