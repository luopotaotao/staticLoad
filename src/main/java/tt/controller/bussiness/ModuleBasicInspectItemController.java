package tt.controller.bussiness;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.InspectItem;
import tt.service.bussiness.InspectItemServiceI;
import tt.util.UrlStringDecoder;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

/**
 * Created by taotao on 2016/9/27.
 * 检测机构
 */

@Controller
@RequestMapping("moduleBasicInspectItemController")
public class ModuleBasicInspectItemController extends BaseController<InspectItem> {
    @Autowired
    private InspectItemServiceI inspectItemService;

    @RequestMapping("index")
    public String index(Model model) {
        model.addAttribute("baseUrl", "moduleBasicInspectItemController");
        return "business/module_basic/inspect_item";
    }

    @RequestMapping("{inspectItem_id}/methods")
    public String methods(@PathVariable Integer inspectItem_id, Model model) {
        model.addAttribute("inspectItem_id", inspectItem_id);
        return "business/module_basic/inspect_method";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public InspectItem get(@PathVariable int id) {
        return inspectItemService.get(id,getDeptId());
    }

    @RequestMapping(value = "query", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) String name,
                           @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                           @RequestParam(value = "rows", required = false, defaultValue = "10") Integer pageSize) {
        Map<String,Object> params = new HashMap<>();
        name = UrlStringDecoder.decode(name);
        if (name!=null) {
            params.put("name",name);
        }
        List<InspectItem> list = null;
        long count = inspectItemService.count(params,getDeptId());
        if(count>0){
            list = inspectItemService.list(params, page, pageSize,getDeptId());
        }
        return listResponse(count, list);
    }

    @RequestMapping(value = "comboList", method = RequestMethod.GET)
    @ResponseBody
    public List<InspectItem> comboList(@RequestParam(required = false) String name) {

        List<InspectItem> list = inspectItemService.list(createHashMap("name",name), null, null,getDeptId());
        return list;
    }

    @RequestMapping(value = "post", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject add(@ModelAttribute InspectItem inspectItem) {
        inspectItemService.add(inspectItem,getDeptId());
        return flagResponse(inspectItem.getId()>0);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute InspectItem inspectItem) {
        inspectItemService.update(inspectItem,getDeptId());
        return flagResponse(inspectItem.getId()>0);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id -> list.add(id));
        int ret = inspectItemService.del(list,getDeptId());
        return flagResponse(ret);
    }
}
