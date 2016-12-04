package tt.controller.bussiness.basic;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.markdown4j.Markdown4jProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.Area;
import tt.service.bussiness.AreaServiceI;

import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by taotao on 2016/9/27.
 */
@Controller
@RequestMapping("basic/area")
public class AreaController extends BaseController<Area> {
    @Autowired
    private AreaServiceI areaService;

    @RequestMapping("index")
    public String index(Model model){
        return "business/module_basic/area";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Area get(@PathVariable int id) {
        return areaService.get(id,getDeptId());
    }

    @RequestMapping(value = "query/{id}",method = RequestMethod.GET)
    @ResponseBody
    public JSONArray list(@PathVariable Integer id) {
        JSONArray ret = new JSONArray();
        Area area = areaService.get(id,getDeptId());
        ret.add(area);

        return ret;
    }
    @RequestMapping(value = "area/{pid}",method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String,Object>> queryCity(@PathVariable Integer pid){
        return areaService.queryAreaByPid(pid,getDeptId());
    }

//    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public Area add(@ModelAttribute Area area) {
        setDeptId(area);
        return areaService.add(area,getDeptId());
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public Area update(@ModelAttribute Area area) {
        setDeptId(area);
        return areaService.update(area,getDeptId());
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@PathVariable Integer id) {
        int ret = areaService.del(id,getDeptId());
        return flagResponse(ret);
    }
}
