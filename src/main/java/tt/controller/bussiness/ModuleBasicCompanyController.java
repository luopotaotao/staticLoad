package tt.controller.bussiness;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import tt.controller.BaseController;
import tt.model.business.Company;
import tt.service.bussiness.CompanyServiceI;

import java.util.*;

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
        System.out.println("*********************************");
        model.addAttribute("baseUrl","/moduleBasicCompanyController");
        return "business/module_basic/company";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Company get(@PathVariable int id) {
        System.out.println("*********************************************************"+id);
        return companyService.get(id);
    }

    @RequestMapping(value = "query",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) Byte typ,
                           @RequestParam(required = false) String name,
                           @RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                           @RequestParam(value = "rows",required = false,defaultValue = "10") Integer pageSize) {
//        Map params = new HashMap<String,Object>();
//        if(typ!=null){
//            params.put("typ",typ);
//        }else{
//            List<Byte> typs = new LinkedList<>();
//            typs.add((byte)1);
//            typs.add((byte)2);
//            typs.add((byte)3);
//            params.put("typ",typs);
//        }
        System.out.println(companyService+"Null+++++++++++++++++++++++++++++++++++++++");

        List<Company> list = companyService.list(typ,name,page,pageSize);
        long count = companyService.count(typ,name);
        return listResponse(count, list);
    }

//    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public JSONObject add(@ModelAttribute Company company) {
        int ret = companyService.add(company);
        return flagResponse(1);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute Company company) {
        int ret = companyService.update(company);
        return flagResponse(ret);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id->list.add(id));
        int ret = companyService.del(list);
        return flagResponse(ret);
    }
}
