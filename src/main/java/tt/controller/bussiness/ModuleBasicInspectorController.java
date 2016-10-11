package tt.controller.bussiness;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.Inspector;
import tt.service.bussiness.InspectorServiceI;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
@Controller
@RequestMapping("moduleBasicInspectorController")
public class ModuleBasicInspectorController extends BaseController<Inspector> {
    @Autowired
    private InspectorServiceI inspectorService;

    @RequestMapping("index/{institution_id}")
    public String index(@PathVariable Integer institution_id,Model model){
        model.addAttribute("baseUrl","/moduleBasicInspectorController");
        model.addAttribute("institution_id",institution_id);
        return "business/module_basic/institution_inspector";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Inspector get(@PathVariable int id) {
        return inspectorService.get(id);
    }

    @RequestMapping(value = "{institution_id}/query",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(@PathVariable Integer institution_id,
                           @RequestParam(required = false) String name) {
        if(name!=null&&!name.trim().isEmpty()){
            try {
                name = URLDecoder.decode(name,"utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        List<Inspector> list = inspectorService.list(institution_id,name);
        return listResponse(list);
    }

    //    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public JSONObject add(@ModelAttribute Inspector inspector, BindingResult result) {
        int ret = inspectorService.add(inspector);
        return flagResponse(1);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute Inspector inspector) {
        int ret = inspectorService.update(inspector);
        return flagResponse(ret);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id->list.add(id));
        int ret = inspectorService.del(list);
        return flagResponse(ret);
    }
}
