package tt.controller.bussiness;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import tt.controller.BaseController;
import tt.model.business.Company;
import tt.service.bussiness.CompanyServiceI;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/27.
 */
@Controller
@RequestMapping("moduleBasicCompanyController")
public class ModuleBasicCompanyController extends BaseController<Company> {
    @Autowired
    private CompanyServiceI companyService;

    @RequestMapping("index")
    public String index(Model model){
        model.addAttribute("baseUrl","/moduleBasicCompanyController");
        return "business/module_basic/company";
    }

    @RequestMapping(value = "get/:id", method = RequestMethod.GET)
    public Company get(@PathVariable Integer id) {
        return companyService.get(id);
    }

    @RequestMapping(value = "query",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> list(@RequestParam(required = false) Byte typ, @RequestParam(value = "page",required = false,defaultValue = "1") Integer page, @RequestParam(value = "rows",required = false,defaultValue = "10") Integer pageSize) {
        Map params = new HashMap<String,Object>();
        if(typ!=null){
            params.put("typ",typ);
        }else{
            List<Byte> typs = new LinkedList<>();
            typs.add((byte)1);
            typs.add((byte)2);
            typs.add((byte)3);
            params.put("typ",typs);
        }

        List<Company> list = companyService.list(params,page,pageSize);
        long count = companyService.count(params);
        return listResponse(count, list);
    }

//    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public Map<String, Object> add(@ModelAttribute Company company) {
        int ret = companyService.add(company);
        return flagResponse(1);
    }

    @RequestMapping(value = "put", method = RequestMethod.PUT)
    public Map<String, Object> update(@RequestParam Company company) {
        int ret = companyService.update(company);
        return flagResponse(ret);
    }

    @RequestMapping(value = "delete", method = RequestMethod.DELETE)
    public Map<String, Object> delete(@RequestParam int[] ids) {
        int ret = companyService.del(ids);
        return flagResponse(ret);
    }
}
