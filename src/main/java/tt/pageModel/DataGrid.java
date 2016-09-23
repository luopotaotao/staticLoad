package tt.pageModel;


import java.util.ArrayList;
import java.util.List;


/**
 * EasyUI DataGrid模型
 * 
 * @author
 */
public class DataGrid implements java.io.Serializable
{

    /**
     * 
     */
    private static final long serialVersionUID = -3529566878106140446L;

    private Long total = 0L;

    private List rows = new ArrayList<Object>();

    public Long getTotal()
    {
        return total;
    }

    public void setTotal(Long total)
    {
        this.total = total;
    }

    public List getRows()
    {
        return rows;
    }

    public void setRows(List rows)
    {
        this.rows = rows;
    }

}
