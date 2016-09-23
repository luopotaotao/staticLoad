package tt.controller.bussiness;

import tt.controller.BaseController;
import tt.model.business.Company;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/23.
 */

//TODO Company 功能
@RequestMapping("companies")
@Controller
public class CompanyController extends BaseController {

    @RequestMapping("index")
    public String companyIndex() {

        return "";
    }


    @RequestMapping(value = "get/:id", method = RequestMethod.GET)
    public Company get(@PathVariable Integer id) {

        return null;
    }

    @RequestMapping(value = "query")
    public Map<String, Object> list(@RequestParam Map<String, Object> params, @RequestParam Integer page, @RequestParam Integer pageSize) {

        return listResponse(0, null);
    }

    @RequestMapping(value = "post", method = RequestMethod.POST)
    public Map<String, Object> add(@RequestParam Company company) {

        return flagResponse(0);
    }

    @RequestMapping(value = "put", method = RequestMethod.PUT)
    public Map<String, Object> update(@RequestParam List<Company> companies) {

        return flagResponse(0);
    }

    @RequestMapping(value = "delete", method = RequestMethod.DELETE)
    public Map<String, Object> delete(@RequestParam Integer[] ids) {

        return flagResponse(1);
    }
}
