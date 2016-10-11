package tt.controller.bussiness;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.InspectPlan;
import tt.service.bussiness.InspectPlanServiceI;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
@Controller
@RequestMapping("moduleInspectPlanController")
public class ModuleInspectPlanController extends BaseController<InspectPlan> {
    @Autowired
    private InspectPlanServiceI inspectPlanService;

    @RequestMapping("index")
    public String index(Model model) {
        model.addAttribute("baseUrl", "/moduleInspectPlanController");
        return "business/module_data/plan";
    }

    @RequestMapping("selectScheme")
    public String selectScheme(Model model) {
        model.addAttribute("baseUrl", "/moduleInspectPlanController");
        return "business/module_data/plan_select_scheme";
    }

    @RequestMapping("selectInspector/{institution_id}")
    public String selectInspector(@PathVariable Integer institution_id, Model model) {
        model.addAttribute("institution_id", institution_id);
        return "business/module_data/plan_select_inspector";
    }
    @RequestMapping("showData/{plan_id}")
    public String showData(@PathVariable Integer plan_id,Model model) {
        model.addAttribute("plan_id",plan_id);
        return "business/module_data/plan_show_data";
    }
    @RequestMapping("selectData/{plan_id}")
    public String selectData(@PathVariable Integer plan_id,Model model) {
        model.addAttribute("plan_id",plan_id);
        return "business/module_data/plan_select_data";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public InspectPlan get(@PathVariable int id) {
        return inspectPlanService.get(id);
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
        List<InspectPlan> list = inspectPlanService.list(name, page, pageSize);
        long count = inspectPlanService.count(name);
        return listResponse(count, list);
    }

    //    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public JSONObject add(@ModelAttribute InspectPlan plan, BindingResult result) {
        int ret = inspectPlanService.add(plan);
        return flagResponse(1);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute InspectPlan plan) {
        int ret = inspectPlanService.update(plan);
        return flagResponse(ret);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id -> list.add(id));
        int ret = inspectPlanService.del(list);
        return flagResponse(ret);
    }
}
