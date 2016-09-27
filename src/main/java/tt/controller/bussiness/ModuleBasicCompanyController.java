package tt.controller.bussiness;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import tt.controller.BaseController;
import tt.model.business.Company;
import tt.service.bussiness.CompanyServiceI;

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
    public String index(){
        System.out.println("123");
        return "business/module_basic/company";
    }

    @RequestMapping("index/:typ")
    public String companyIndex() {

        return "business/company";
    }


    @RequestMapping(value = "get/:id", method = RequestMethod.GET)
    public Company get(@PathVariable Integer id) {
        return companyService.get(id);
    }

    @RequestMapping(value = "query")
    public Map<String, Object> list(@RequestParam Map<String, Object> params, @RequestParam Integer page, @RequestParam Integer pageSize) {
        List<Company> list = companyService.list(params,page,pageSize);
        long count = companyService.count(params);
        return listResponse(count, list);
    }

    @RequestMapping(value = "post", method = RequestMethod.POST)
    public Map<String, Object> add(@RequestParam Company company) {
        int ret = companyService.add(company);
        return flagResponse(ret);
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
