package tt.pageModel;


import tt.util.annotation.Validator;


/**
 * EasyUI 分页帮助类
 * 
 * @author
 */
public class PageHelper implements java.io.Serializable
{

    /**
     * 
     */
    private static final long serialVersionUID = 7197957446887080442L;

    @Validator(int_value_Min = 1)
    private int page;// 当前页

    @Validator(accessIntValue = {10, 20, 30, 40, 50})
    private int rows;// 每页显示记录数

    private String sort;// 排序字段

    @Validator(accessStrValue = {"asc", "desc"})
    private String order;// asc/desc

    public int getPage()
    {
        return page;
    }

    public void setPage(int page)
    {
        this.page = page;
    }

    public int getRows()
    {
        return rows;
    }

    public void setRows(int rows)
    {
        this.rows = rows;
    }

    public String getSort()
    {
        return sort;
    }

    public void setSort(String sort)
    {
        this.sort = sort;
    }

    public String getOrder()
    {
        return order;
    }

    public void setOrder(String order)
    {
        this.order = order;
    }

}
