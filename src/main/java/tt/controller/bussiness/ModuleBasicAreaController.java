package tt.controller.bussiness;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.Area;
import tt.service.bussiness.AreaServiceI;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by taotao on 2016/9/27.
 */
@Controller
@RequestMapping("moduleBasicAreaController")
public class ModuleBasicAreaController extends BaseController<Area> {
    @Autowired
    private AreaServiceI areaService;

    @RequestMapping("index")
    public String index(Model model){
        model.addAttribute("baseUrl","/moduleBasicAreaController");
        return "business/module_basic/area";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Area get(@PathVariable int id) {
        return areaService.load(id);
    }

    @RequestMapping(value = "query/{id}",method = RequestMethod.GET)
    @ResponseBody
    public JSONArray list(@PathVariable Integer id) {
        JSONArray ret = new JSONArray();
        Area area = areaService.load(id);
        System.out.println(area.getChildren().size());
        ret.add(area);
        return ret;
    }

//    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public Area add(@ModelAttribute() Area area) {
        return areaService.add(area);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public Area update(@ModelAttribute Area area) {
        return areaService.update(area);
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@PathVariable Integer id) {
        int ret = areaService.del(id);
        return flagResponse(ret);
    }
}
