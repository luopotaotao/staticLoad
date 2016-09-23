//package laser.util;
//
//import java.io.File;
//import java.io.IOException;
//import java.util.Enumeration;
//import java.util.zip.ZipEntry;
//import java.util.zip.ZipFile;
//
//import org.xmlpull.v1.XmlPullParser;
//
//import android.content.res.AXmlResourceParser;
//import android.util.TypedValue;
//
//
///**
// * 获得APK文件包名称的工具类
// * 需要 AXMLPrinter.jar
// * @author zhangziqi
// *
// */
//public class GetApkPackageName {
//
//	/**
//	 * 获得apk文件，包名称
//	 * @param file apk文件的new File();
//	 * @return
//	 */
//	public static String[] getapkpackagename(File file)
//	{
//		String st[] = new String[2];
//		ZipFile zipFile;
//		try {
//			zipFile = new ZipFile(file);
//			Enumeration<?> enumeration = zipFile.entries();
//			ZipEntry zipEntry = null;
//			while (enumeration.hasMoreElements()) {
//				zipEntry = (ZipEntry) enumeration.nextElement();
//				if (zipEntry.isDirectory()) {
//				} else {
//					if ("AndroidManifest.xml".equals(zipEntry.getName())) {
//						try {
//							AXmlResourceParser parser = new AXmlResourceParser();
//							parser.open(zipFile.getInputStream(zipEntry));
//							while (true) {
//								int type = parser.next();
//								if (type == XmlPullParser.END_DOCUMENT) {
//									break;
//								}
//								switch (type) {
//								case XmlPullParser.START_TAG: {
//									for (int i = 0; i != parser.getAttributeCount(); ++i) {
//										if ("package".equals(parser.getAttributeName(i))) {
//											st[1] = getAttributeValue(parser, i);
//										}
//										else if("versionName".equals(parser.getAttributeName(i))){
//											st[0] = getAttributeValue(parser,i);
//										}
//									}
//								}
//								}
//							}
//							parser.close();
//						} catch (Exception e) {
//							e.printStackTrace();
//						}
//					}
//				}
//			}
//			zipFile.close();
//		}
//		catch (IOException e) {
//		}
//		return st;
//	}
//
//	private static String getAttributeValue(AXmlResourceParser parser, int index) {
//		int type = parser.getAttributeValueType(index);
//		int data = parser.getAttributeValueData(index);
//		if (type == TypedValue.TYPE_STRING) {
//			return parser.getAttributeValue(index);
//		}
//		return String.format("<0x%X, type 0x%02X>", data, type);
//	}
//}
