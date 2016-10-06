package tt.controller.bussiness;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.InspectItem;
import tt.service.bussiness.InspectItemServiceI;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
@Controller
@RequestMapping("moduleInspectItemController")
public class ModuleInspectItemController extends BaseController<InspectItem> {
    @Autowired
    private InspectItemServiceI inspectItemService;

    @RequestMapping("index")
    public String index(Model model) {
        model.addAttribute("baseUrl", "/moduleBasicInspectItemController");
        return "business/module_inspect/inspectItem";
    }

    @RequestMapping("partial")
    public String partial(Model model) {
        model.addAttribute("baseUrl", "/moduleBasicInspectItemController");
        return "business/module_basic/company_partial";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public InspectItem get(@PathVariable int id) {
        return inspectItemService.get(id);
    }

    @RequestMapping(value = "query", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) String name,
                           @RequestParam(value = "page", required = false) Integer page,
                           @RequestParam(value = "rows", required = false) Integer pageSize) {

        List<InspectItem> list = inspectItemService.list(name, page, pageSize);
        long count = inspectItemService.count(name);
        return listResponse(count, list);
    }
    @RequestMapping(value = "comboList", method = RequestMethod.GET)
    @ResponseBody
    public List<InspectItem> comboList(@RequestParam(required = false) String name) {

        List<InspectItem> list = inspectItemService.list(name,null,null);
        return list;
    }

    @RequestMapping(value = "post", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject add(@ModelAttribute InspectItem company) {
        int ret = inspectItemService.add(company);
        return flagResponse(1);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute InspectItem company) {
        int ret = inspectItemService.update(company);
        return flagResponse(ret);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id -> list.add(id));
        int ret = inspectItemService.del(list);
        return flagResponse(ret);
    }
}
