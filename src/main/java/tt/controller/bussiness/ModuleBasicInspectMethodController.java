package tt.controller.bussiness;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.InspectItem;
import tt.model.business.InspectMethod;
import tt.service.bussiness.InspectMethodServiceI;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
@Controller
@RequestMapping("moduleBasicInspectMethodController")
public class ModuleBasicInspectMethodController extends BaseController<InspectMethod> {
    @Autowired
    private InspectMethodServiceI inspectMethodService;

    @RequestMapping("index/{inspect_item_id}")
    public String index(@PathVariable Integer inspect_item_id, Model model) {
        model.addAttribute("baseUrl", "/moduleBasicInspectMethodController");
        model.addAttribute("inspect_item_id", inspect_item_id);
        return "business/module_basic/inspect_method";
    }

    @RequestMapping("{inspect_item_id}/methods")
    public String methods(@PathVariable Integer inspect_item_id, Model model) {
        model.addAttribute("inspect_item_id", inspect_item_id);
        return "business/module_basic/inspect_method";
    }

    @RequestMapping(value = "{inspect_item_id}/comboList", method = RequestMethod.GET)
    @ResponseBody
    public List<InspectMethod> comboList(@PathVariable Integer inspect_item_id,@RequestParam(required=false) String name) {

        List<InspectMethod> list = inspectMethodService.list(inspect_item_id,name);
        return list;
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public InspectMethod get(@PathVariable int id) {
        return inspectMethodService.get(id);
    }

    @RequestMapping(value = "{inspect_item_id}/query", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(
            @PathVariable Integer inspect_item_id,
            @RequestParam(required = false) String name) {
        if(name!=null&&!name.trim().isEmpty()){
            try {
                name = URLDecoder.decode(name,"utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        List<InspectMethod> list = inspectMethodService.list(inspect_item_id,name);
        return listResponse(list);
    }

    //    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public JSONObject add(@ModelAttribute InspectMethod company) {
        int ret = inspectMethodService.add(company);
        return flagResponse(1);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute InspectMethod company) {
        int ret = inspectMethodService.update(company);
        return flagResponse(ret);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id -> list.add(id));
        int ret = inspectMethodService.del(list);
        return flagResponse(ret);
    }
}
