package tt.controller.bussiness.basic;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import tt.controller.BaseController;
import tt.model.business.Company;
import tt.service.bussiness.CompanyServiceI;
import tt.util.UrlStringDecoder;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

/**
 * Created by taotao on 2016/9/27.
 */
@Controller
@RequestMapping("basic/company")
public class CompanyController extends BaseController<Company> {

    @Autowired
    private CompanyServiceI companyService;

    @RequestMapping("index")
    public String index(Model model) {
        return "business/module_basic/company";
    }

    @RequestMapping("partial")
    public String partial(@RequestParam(name="typ") Byte type,Model model) {
        if(type!=null){
            model.addAttribute("typ",type);
        }
        return "business/module_basic/company_partial";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Company get(@PathVariable int id) {
        return companyService.get(id, getDeptId());
    }

    @RequestMapping(value = "query", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) Byte typ,
                           @RequestParam(required = false) String name,
                           @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                           @RequestParam(value = "rows", required = false, defaultValue = "10") Integer pageSize) {
        Map<String, Object> params = new HashMap<>();
        name = UrlStringDecoder.decode(name);
        if (name!=null) {
            params.put("name",name);
        }
        if (typ != null) {
            params.put("typ", typ);
        }
        List<Company> list = null;
        long count = companyService.count(params, getDeptId());
        if (count > 0) {
            list = companyService.list(params, page, pageSize, getDeptId());
        }
        return listResponse(count, list);
    }

    //    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public JSONObject add(@ModelAttribute Company company) {
        companyService.add(company, getDeptId());
        return flagResponse(company.getId() > 0);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute Company company) {
        companyService.update(company, getDeptId());
        return flagResponse(company.getId() > 0);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id -> list.add(id));
        int ret = companyService.del(list, getDeptId());
        return flagResponse(ret);
    }
}
