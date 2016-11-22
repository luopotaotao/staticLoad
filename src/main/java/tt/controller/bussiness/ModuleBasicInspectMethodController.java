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
import tt.util.UrlStringDecoder;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

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
        model.addAttribute("baseUrl", "moduleBasicInspectMethodController");
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
        Map<String,Object> params = createHashMap("inspect_item_id",inspect_item_id);
        params.put("name",name);
        List<InspectMethod> list = inspectMethodService.list(params,null,null,getDeptId());
        return list;
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public InspectMethod get(@PathVariable int id) {
        return inspectMethodService.get(id,getDeptId());
    }

    @RequestMapping(value = "{inspect_item_id}/query", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(
            @PathVariable Integer inspect_item_id,
            @RequestParam(required = false) String name) {
        Map<String,Object> params = createHashMap("inspect_item_id",inspect_item_id);
        name = UrlStringDecoder.decode(name);
        if (name!=null) {
            params.put("name",name);
        }
        List<InspectMethod> list = inspectMethodService.list(params,null,null,getDeptId());
        return listResponse(list);
    }

    //    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public JSONObject add(@ModelAttribute InspectMethod company) {
        inspectMethodService.add(company,getDeptId());
        return flagResponse(company.getId()>0);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute InspectMethod company) {
        inspectMethodService.update(company,getDeptId());
        return flagResponse(company.getId()>0);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id -> list.add(id));
        int ret = inspectMethodService.del(list,getDeptId());
        return flagResponse(ret);
    }
}
