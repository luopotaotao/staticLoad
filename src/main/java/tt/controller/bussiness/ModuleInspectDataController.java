package tt.controller.bussiness;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.InspectData;
import tt.pageModel.Json;
import tt.service.bussiness.InspectDataServiceI;

import javax.xml.bind.annotation.XmlRootElement;
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
    public JSONObject queryData(@PathVariable String PRG, @PathVariable String STZH) {
        List<InspectData> list = inspectDataService.list(PRG, STZH);
        Map<String,JSONArray> data = sortData(list);
        JSONObject ret = new JSONObject();
        ret.put("source",listResponse(list));
        ret.put("statistic","");
        for(Map.Entry<String,JSONArray> entry:data.entrySet()){
            ret.put(entry.getKey(),entry.getValue());
        }
        return ret;
    }

    private Map<String,JSONArray> sortData(List<InspectData> source){
        //TODO 整理数据,生成统计数据,图表0,1,2的数据
        String chart0 = "[\n" +
                "                {x: 0, y: 0.00},\n" +
                "                {x: 340, y: 0.70},\n" +
                "                {x: 510, y: 1.42},\n" +
                "                {x: 680, y: 2.35},\n" +
                "                {x: 850, y: 3.39},\n" +
                "                {x: 1020, y: 4.51},\n" +
                "                {x: 1190, y: 5.78},\n" +
                "                {x: 1360, y: 6.95},\n" +
                "                {x: 1530, y: 8.17},\n" +
                "                {x: 1700, y: 9.47},\n" +
                "                {x: 1700, y: 9.47},\n" +
                "                {x: 1700, y: 9.47},\n" +
                "                {x: 1700, y: 9.47}]";
        String chart1 = "[{\n" +
                "                name: '340',\n" +
                "                data: [\n" +
                "                    {x: 0, y: 0.50},\n" +
                "                    {x: 5, y: 0.56},\n" +
                "                    {x: 15, y: 0.60},\n" +
                "                    {x: 30, y: 0.64},\n" +
                "                    {x: 45, y: 0.66},\n" +
                "                    {x: 60, y: 0.67},\n" +
                "                    {x: 90, y: 0.70}\n" +
                "                ]\n" +
                "            },\n" +
                "                {\n" +
                "                    name: '510',\n" +
                "                    data: [\n" +
                "                        {x: 0, y: 1.22},\n" +
                "                        {x: 5, y: 1.28},\n" +
                "                        {x: 15, y: 1.31},\n" +
                "                        {x: 30, y: 1.35},\n" +
                "                        {x: 45, y: 1.38},\n" +
                "                        {x: 60, y: 1.40},\n" +
                "                        {x: 90, y: 1.42}\n" +
                "                    ]\n" +
                "                },\n" +
                "\n" +
                "                {\n" +
                "                    name: '640',\n" +
                "                    data: [\n" +
                "                        {x: 0, y: 2.14},\n" +
                "                        {x: 5, y: 2.19},\n" +
                "                        {x: 15, y: 2.23},\n" +
                "                        {x: 30, y: 2.27},\n" +
                "                        {x: 45, y: 2.30},\n" +
                "                        {x: 60, y: 2.33},\n" +
                "                        {x: 90, y: 2.35}\n" +
                "                    ]\n" +
                "                }\n" +
                "            ]";
        String chart2 = "[\n" +
                "                {y:0.00,x:0          },\n" +
                "                {y:0.70,x:2.531478917},\n" +
                "                {y:1.42,x:2.707570176},\n" +
                "                {y:2.35,x:2.832508913},\n" +
                "                {y:3.39,x:2.929418926},\n" +
                "                {y:4.51,x:3.008600172},\n" +
                "                {y:5.78,x:3.075546961},\n" +
                "                {y:6.95,x:3.133538908},\n" +
                "                {y:8.17,x:3.184691431},\n" +
                "                {y:9.47,x:3.230448921},\n" +
                "                {y:9.47,x:3.230448921},\n" +
                "                {y:9.47,x:3.230448921},\n" +
                "                {y:9.47,x:3.230448921}]";
        Map<String,JSONArray> ret = new HashMap<>();
        ret.put("chart0",JSONArray.parseArray(chart0));
        ret.put("chart1",JSONArray.parseArray(chart1));
        ret.put("chart2",JSONArray.parseArray(chart2));
        return ret;
    }


    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id -> list.add(id));
        int ret = inspectDataService.del(list);
        return flagResponse(ret);
    }

    @RequestMapping(value = "keys", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> listKeys() {
        return inspectDataService.loadKeys();
    }

    @RequestMapping(value = "unLinkedKeys", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject listUnlinkedKeys() {
        return listResponse(inspectDataService.loadUnLinkedKeys());
    }

    @RequestMapping(value = "linkedKeys/{plan_id}", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> listLinkedKeys(@PathVariable Integer plan_id) {
        return inspectDataService.loadLinkedKeys(plan_id);
    }

    @RequestMapping(value = "linkData/{plan_id}", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject linkData(@PathVariable(value = "plan_id") Integer plan_id, @RequestBody List<Map<String,Object>> data) {
        int count = inspectDataService.linkData(plan_id,data);
        return flagResponse(count>0);
    }
}