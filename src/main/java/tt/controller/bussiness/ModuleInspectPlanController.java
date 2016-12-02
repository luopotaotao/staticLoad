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
import tt.util.UrlStringDecoder;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

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

    @RequestMapping("selectUser/{dept_id}")
    public String selectUser(@PathVariable Integer dept_id, Model model) {
        model.addAttribute("dept_id", dept_id);
        return "business/module_data/plan_select_user";
    }

    @RequestMapping("selectEquipment/{dept_id}")
    public String selectEquipment(@PathVariable Integer dept_id, Model model) {
        model.addAttribute("dept_id", dept_id);
        return "business/module_data/plan_select_equipment";
    }

    @RequestMapping("showData/{prg}/{plan_id}")
    public String showData(@PathVariable String prg, @PathVariable Integer plan_id, Model model) {

        InspectPlan plan = inspectPlanService.get(plan_id, getDeptId());
        model.addAttribute("prg", prg);
        model.addAttribute("stzh", plan.getStzh());
        return "business/module_data/plan_show_data";
    }

    @RequestMapping("selectData/{plan_id}")
    public String selectData(@PathVariable Integer plan_id, Model model) {
        model.addAttribute("plan_id", plan_id);
        return "business/module_data/plan_select_data";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public InspectPlan get(@PathVariable int id) {
        return inspectPlanService.get(id, getDeptId());
    }

    @RequestMapping(value = "query", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) String name,
                           @RequestParam(value = "page", required = false) Integer page,
                           @RequestParam(value = "rows", required = false) Integer pageSize) {
        Map<String, Object> params = new HashMap<>();
        name = UrlStringDecoder.decode(name);
        if (name != null) {
            params.put("name", name);
        }
        List<InspectPlan> list = inspectPlanService.list(params, page, pageSize, getDeptId());
        long count = inspectPlanService.count(params, getDeptId());
        return listResponse(count, list);
    }

    @RequestMapping(value = "post", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject add(@ModelAttribute InspectPlan plan, BindingResult result) {
        inspectPlanService.add(plan, getDeptId());
        return flagResponse(plan.getId() > 0);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute InspectPlan plan) {
        inspectPlanService.update(plan, getDeptId());
        return flagResponse(plan.getId() > 0);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id -> list.add(id));
        int ret = inspectPlanService.del(list, getDeptId());
        return flagResponse(ret);
    }
}
