package tt.controller.bussiness;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.InspectProject;
import tt.service.bussiness.InspectProjectServiceI;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
@Controller
@RequestMapping("moduleInspectProjectController")
public class ModuleInspectProjectController extends BaseController<InspectProject> {
    @Autowired
    private InspectProjectServiceI inspectProjectService;
    
    @RequestMapping("index")
    public String index(Model model){
        model.addAttribute("baseUrl","/moduleBasicInspectProjectController");
        return "business/module_inspect/inspectProject";
    }

    @RequestMapping("partial")
    public String partial(Model model){
        model.addAttribute("baseUrl","/moduleBasicInspectProjectController");
        return "business/module_basic/company_partial";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public InspectProject get(@PathVariable int id) {
        return inspectProjectService.get(id);
    }

    @RequestMapping(value = "query",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) Byte typ,
                           @RequestParam(required = false) String name,
                           @RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                           @RequestParam(value = "rows",required = false,defaultValue = "10") Integer pageSize) {

        List<InspectProject> list = inspectProjectService.list(name,page,pageSize);
        long count = inspectProjectService.count(name);
        return listResponse(count, list);
    }

    //    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public JSONObject add(@ModelAttribute InspectProject company) {
        int ret = inspectProjectService.add(company);
        return flagResponse(1);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute InspectProject company) {
        int ret = inspectProjectService.update(company);
        return flagResponse(ret);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id->list.add(id));
        int ret = inspectProjectService.del(list);
        return flagResponse(ret);
    }
}
