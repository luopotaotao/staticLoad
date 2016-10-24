package tt.controller.bussiness;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.InspectScheme;
import tt.service.bussiness.InspectSchemeServiceI;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by tt on 2016/10/2.
 */
@Controller
@RequestMapping("moduleInspectSchemeController")
public class ModuleInspectSchemeController extends BaseController<InspectScheme> {
    @Autowired
    private InspectSchemeServiceI inspectProjectService;

    @RequestMapping("index")
    public String index(Model model) {
        model.addAttribute("baseUrl", "/moduleInspectSchemeController");
        return "business/module_data/scheme";
    }

    @RequestMapping("selectProject")
    public String selectProject() {
        return "business/module_data/scheme_select_project";
    }

    @RequestMapping("selectInstitution")
    public String selectInstitution() {
        return "business/module_data/scheme_select_institution";
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
        if(name!=null&&!name.trim().isEmpty()){
            try {
                name = URLDecoder.decode(name,"utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        Map<String,Object> params = createHashMap("name",name);
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
