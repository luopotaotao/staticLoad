package tt.util;


import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellValue;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.csvreader.CsvReader;


/**
 * excel、csv读取类 〈功能详细描述〉
 * 
 * @author Jeep Chen
 * @version 2016-2-25
 * @see FilelReadHelper
 * @since
 */
public abstract class FilelReadHelper
{

    /**
     * Excel 2003
     */
    private final static String XLS = "xls";

    /**
     * Excel 2007
     */
    private final static String XLSX = "xlsx";

    /**
     * 编码
     */
    private final static String CHARSET = "GBK";

    /**
     * @Description: 读取csv文件
     * @Check parameters by the 【caller】
     * @param fis
     * @return
     * @throws Exception
     */
    public static ArrayList<String[]> readCsv(ByteArrayInputStream fis)
        throws Exception
    {
        ArrayList<String[]> csvList = new ArrayList<String[]>(); // 用来保存数据
        CsvReader reader = new CsvReader(fis, Charset.forName(CHARSET)); // 一般用这编码读就可以了
        reader.readHeaders(); // 跳过表头 如果需要表头的话，不要写这句。
        while (reader.readRecord())
        {
            // 逐行读入除表头的数据
            csvList.add(reader.getValues());
        }
        reader.close();
        return csvList;
    }

    /**
     * @Description: 读取excel文件
     * @Check parameters by the 【caller
     * @param fis
     *            文件流
     * @param extensionName
     *            文件后缀名
     * @param sheetNum
     *            -1则读取全部sheet，注：excel文件sheet从0开始
     * @return
     * @throws Exception
     */
    public static List<String[]> exportExcelList(FileInputStream fis, String extensionName,
                                                 int sheetNum)
        throws Exception
    {
        Workbook workbook = null;
        if (extensionName.equals(XLS))
        {
            workbook = new HSSFWorkbook(fis);
        }
        else if (extensionName.equals(XLSX))
        {
            workbook = new XSSFWorkbook(fis);
        }
        else
        {
            throw new Exception("该文件不是excel文件");
        }
        return exportListFromExcel(workbook, sheetNum);
    }

    /**
     * 
     * @Description: 由指定的Sheet导出至List
     * @Check parameters by the 【itself】(参数由谁校验)
     * @param workbook
     * @param sheetNum
     * @return
     * @throws Exception
     */
    private static List<String[]> exportListFromExcel(Workbook workbook, int sheetNum) throws Exception
    {
        // 解析公式结果
        FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();

        List<String[]> list = new ArrayList<String[]>();

        int sheetStart = sheetNum;
        int sheetEnd = sheetNum;
        if(sheetNum == -1)
        {
            sheetStart = 0;
            sheetEnd = workbook.getNumberOfSheets() - 1;
        }else if(sheetNum < 0)
        {
            throw new Exception("sheet码参数错误！");
        }
        
        for(int i = sheetStart; i <= sheetEnd; i ++)
        {
            Sheet sheet = workbook.getSheetAt(i);
            int minRowIx = sheet.getFirstRowNum();
            int maxRowIx = sheet.getLastRowNum();
            for (int rowIx = minRowIx; rowIx <= maxRowIx; rowIx++ )
            {
                Row row = sheet.getRow(rowIx);

                short minColIx = row.getFirstCellNum();
                short maxColIx = row.getLastCellNum();
                String as[] = new String[maxColIx];
                for (short colIx = minColIx; colIx <= maxColIx; colIx++ )
                {
                    Cell cell = row.getCell(new Integer(colIx));
                    CellValue cellValue = evaluator.evaluate(cell);
                    if (cellValue == null)
                    {
                        continue;
                    }
                    // 经过公式解析，最后只存在Boolean、Numeric和String三种数据类型，此外就是Error了
                    // 其余数据类型，根据官方文档，完全可以忽略http://poi.apache.org/spreadsheet/eval.html
                    switch (cellValue.getCellType())
                    {
                        case Cell.CELL_TYPE_BOOLEAN:
                            as[colIx] = cellValue.getBooleanValue() + "";
                            break;
                        case Cell.CELL_TYPE_NUMERIC:
                            // 这里的日期类型会被转换为数字类型，需要判别后区分处理
                            as[colIx] = cellValue.getNumberValue() + "";
                            break;
                        case Cell.CELL_TYPE_STRING:
                            as[colIx] = cellValue.getStringValue() + "";
                            break;
                        case Cell.CELL_TYPE_FORMULA:
                            break;
                        case Cell.CELL_TYPE_BLANK:
                            break;
                        case Cell.CELL_TYPE_ERROR:
                            break;
                        default:
                            break;
                    }
                }
                list.add(as);
            }
        }
        
        return list;
    }

    public static void main(String[] args)
    {
        // String path = "D:\\test\\测试excel1.xlsx";
        // // String path = "D:/test/20889119960999510156_201512_账务明细_1.csv";
        // List<String[]> list = null;
        // long end, start = System.currentTimeMillis();
        // try
        // {
        // list = FilelReadHelper.exportList(path, -1);
        // for (String[] str : list)
        // {
        // for (String value : str)
        // System.out.print("|" + value);
        // System.out.println();
        // }
        // System.out.println(list.size());
        // }
        // catch (Exception e)
        // {
        // System.out.println(e.getMessage());
        // }
        // end = System.currentTimeMillis();
        // System.out.println("耗时：" + (end - start) / 1000f + "s");
    }
}
