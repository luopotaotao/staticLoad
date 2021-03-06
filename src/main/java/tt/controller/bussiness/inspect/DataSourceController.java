//package tt.controller.bussiness;
//
//import com.alibaba.fastjson.JSONObject;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//import tt.controller.BaseController;
//import tt.model.business.InspectData;
//import tt.service.bussiness.InspectDataServiceI;
//
//import java.util.Arrays;
//import java.util.LinkedList;
//import java.util.List;
//import java.util.Map;
//
///**
// * Created by tt on 2016/10/2.
// */
//@Controller
//@RequestMapping("moduleInspectDataSourceController")
//public class ModuleInspectDataSourceController extends BaseController<InspectData> {
//    @Autowired
//    private InspectDataServiceI inspectProjectService;
//
//    @RequestMapping("index")
//    public String index(Model model){
//        model.addAttribute("baseUrl","/moduleInspectDataSourceController");
//        return "business/module_data/data";
//    }
//
//    /**
//     *
//     * @param PRG 工程id
//     * @param STZH 桩号id
//     * @return
//     */
//    @RequestMapping(value = "query/{PRG}/{STZH}",method = RequestMethod.GET)
//    @ResponseBody
//    public JSONObject list(@PathVariable String PRG,@PathVariable String STZH) {
//        List<InspectData> list = inspectProjectService.list(PRG,STZH,getDeptId());
//        return listResponse( list);
//    }
//
//    @RequestMapping(value = "delete", method = RequestMethod.POST)
//    @ResponseBody
//    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
//        List<Integer> list = new LinkedList<>();
//        Arrays.stream(ids).forEach(id->list.add(id));
//        int ret = inspectProjectService.del(list,getDeptId());
//        return flagResponse(ret);
//    }
//    @RequestMapping(value = "keys",method = RequestMethod.GET)
//    @ResponseBody
//    public List<Map<String,Object>> listKeys(){
//       return inspectProjectService.loadKeys(getDeptId());
//    }
//}
