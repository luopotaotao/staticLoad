package tt.controller.bussiness;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.exception.ParameterException;
import tt.model.business.InspectData;
import tt.service.bussiness.InspectDataServiceI;

import java.util.*;

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
        model.addAttribute("baseUrl", "moduleBasicInspectDataController");
        return "business/module_data/index";
    }

    /**
     * @param PRG  工程id
     * @param STZH 桩号id
     * @return
     */
    @RequestMapping(value = "query/{PRG}/{STZH}", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject queryData(@PathVariable String PRG, @PathVariable String STZH) {
        List<InspectData> list_press = inspectDataService.list(PRG, STZH,true,getDeptId());
        List<InspectData> list_release = inspectDataService.list(PRG, STZH,false,getDeptId());
        Map<String,Object> data = sortData(list_press);
        JSONObject ret = new JSONObject();
        ret.put("source_press",listResponse(list_press));
        ret.put("source_release",listResponse(list_release));
        ret.put("statistic","");
        for(Map.Entry<String,Object> entry:data.entrySet()){
            ret.put(entry.getKey(),entry.getValue());
        }
        return ret;
    }

    private Map<String,Object> sortData(List<InspectData> source){
        Map<String, Object> chart0 = inspectDataService.calcChart0(source);;
        Map<String, Object> chart1 = inspectDataService.calcChart1(source);
        Map<String, Object> chart2 = inspectDataService.calcChart2(source);
        Map<String,Object> ret = new HashMap<>();
        ret.put("chart0",chart0);
        ret.put("chart1",chart1);
        ret.put("chart2",chart2);
        return ret;
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
    @RequestMapping("loadLatestData/{PRG}/{STZH}")
    @ResponseBody
    public InspectData loadLatestData(@PathVariable String PRG,@PathVariable String STZH){
        if(PRG==null||STZH==null){
            throw new ParameterException("参数异常,请设置工程号和桩号!");
        }
        return inspectDataService.loadLatestData(PRG,STZH,getDeptId());
    }
}