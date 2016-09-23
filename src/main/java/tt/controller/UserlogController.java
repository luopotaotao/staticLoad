package tt.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tt.pageModel.DataGrid;
import tt.pageModel.Userlog;
import tt.service.UserlogServiceI;
import tt.util.annotation.ValidatorAnnotationBean;


@Controller
@RequestMapping("/userlogController")
public class UserlogController extends BaseController
{
    @Autowired
    private UserlogServiceI userlogService;

    /**
     * 跳转到系统操作日志管理页面
     * 
     * @return
     */
    @RequestMapping(value = "/manager")
    public String manager()
    {
        this.getSessionInfo().getResourceList().add("/userlogController/datagrid.action");
        this.getSessionInfo().getResourceMap().put("/userlogController/datagrid.action", "系统日志表格");
        this.getSessionInfo().getResourceList().add("/userlogController/combobox.action");
        this.getSessionInfo().getResourceMap().put("/userlogController/combobox.action",
            "系统日志-管理员下拉列表");
        return "/admin/userlog/userlog";
    }

    /**
     * 系统操作日志查询列表
     */
    @RequestMapping(value = "/datagrid", method = RequestMethod.POST)
    @ResponseBody
    public DataGrid datagrid(Userlog userlog)
        throws Exception
    {
        DataGrid dg = new DataGrid();
        List<String> validatorList = new ArrayList<String>();
        validatorList.add("page");
        validatorList.add("rows");
        validatorList.add("order");
        if (ValidatorAnnotationBean.validatorBeanParams(userlog, validatorList))
        {
            String name = this.getSessionInfo().getName();
            dg = userlogService.datagrid(userlog, name);
        }
        return dg;
    }

    /**
     * 跳转到系统操作日志查询详情页面
     * 
     * @param request
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/search")
    public String search(HttpServletRequest request, String id)
        throws Exception
    {
        Userlog u = userlogService.getUserLog(id);
        request.setAttribute("userlog", u);
        return "/admin/userlog/userlogSearch";
    }

    /**
     * 用户下拉列表
     * 
     * @param userlog
     * @param session
     * @return
     */
    @RequestMapping("/combobox")
    @ResponseBody
    public List<Userlog> combobox(Userlog userlog, HttpSession session)
    {
        try
        {
            return userlogService.combobox(userlog);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }

}
