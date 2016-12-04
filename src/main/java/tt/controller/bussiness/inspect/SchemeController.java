package tt.controller.bussiness.inspect;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.InspectScheme;
import tt.service.bussiness.InspectSchemeServiceI;
import tt.util.UrlStringDecoder;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

/**
 * Created by tt on 2016/10/2.
 */
@Controller
@RequestMapping("inspect/scheme")
public class SchemeController extends BaseController<InspectScheme> {
    @Autowired
    private InspectSchemeServiceI inspectProjectService;

    @RequestMapping("index")
    public String index(Model model) {
        return "business/module_data/scheme";
    }

    @RequestMapping("selectProject")
    public String selectProject() {
        return "business/module_data/scheme_select_project";
    }

    @RequestMapping("selectDept")
    public String selectDept() {
        return "business/module_data/scheme_select_dept";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public InspectScheme get(@PathVariable int id) {
        return inspectProjectService.get(id,getDeptId());
    }

    @RequestMapping(value = "query", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) String name,
                           @RequestParam(value = "page", required = false) Integer page,
                           @RequestParam(value = "rows", required = false) Integer pageSize) {
        Map<String,Object> params = new HashMap<>();
        name = UrlStringDecoder.decode(name);
        if (name!=null) {
            params.put("name",name);
        }
        List<InspectScheme> list = inspectProjectService.list(params, page, pageSize,getDeptId());
        long count = inspectProjectService.count(params,getDeptId());
        return listResponse(count, list);
    }

    //    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public JSONObject add(@ModelAttribute InspectScheme company) {
        inspectProjectService.add(company,getDeptId());
        return flagResponse(company.getId()>0);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute InspectScheme company) {
        inspectProjectService.update(company,getDeptId());
        return flagResponse(company.getId()>0);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id -> list.add(id));
        int ret = inspectProjectService.del(list,getDeptId());
        return flagResponse(ret);
    }
}
