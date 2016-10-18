package tt.controller.bussiness;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.InspectData;
import tt.service.bussiness.InspectDataServiceI;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by tt on 2016/10/2.
 */
@Controller
@RequestMapping("moduleInspectDataController")
public class ModuleInspectDataController extends BaseController<InspectData> {
    @Autowired
    private InspectDataServiceI inspectDataService;

    @RequestMapping("index")
    public String index(Model model) {
        model.addAttribute("baseUrl", "/moduleBasicInspectDataController");
        return "business/module_data/index";
    }

    /**
     * @param PRG  工程id
     * @param STZH 桩号id
     * @return
     */
    @RequestMapping(value = "query/{PRG}/{STZH}", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(@PathVariable String PRG, @PathVariable String STZH) {
        List<InspectData> list = inspectDataService.list(PRG, STZH,getDeptId());
        return listResponse(list);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id -> list.add(id));
        int ret = inspectDataService.del(list,getDeptId());
        return flagResponse(ret);
    }

    @RequestMapping(value = "keys", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> listKeys() {
        return inspectDataService.loadKeys(getDeptId());
    }

    @RequestMapping(value = "unLinkedKeys", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject listUnlinkedKeys() {
        return listResponse(inspectDataService.loadUnLinkedKeys(getDeptId()));
    }

    @RequestMapping(value = "linkedKeys/{plan_id}", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> listLinkedKeys(@PathVariable Integer plan_id) {
        return inspectDataService.loadLinkedKeys(plan_id,getDeptId());
    }

    @RequestMapping(value = "linkData/{plan_id}", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject linkData(@PathVariable(value = "plan_id") Integer plan_id, @RequestBody List<Map<String,Object>> data) {
        int count = inspectDataService.linkData(plan_id,data,getDeptId());
        return flagResponse(count>0);
    }
}