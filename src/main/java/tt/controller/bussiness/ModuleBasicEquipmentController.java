package tt.controller.bussiness;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.Equipment;
import tt.service.bussiness.EquipmentServiceI;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by tt on 2016/10/2.
 */
@Controller
@RequestMapping("moduleBasicEquipmentController")
public class ModuleBasicEquipmentController extends BaseController<Equipment> {
    @Autowired
    private EquipmentServiceI equipmentService;

    @RequestMapping("index/{institution_id}")
    public String index(@PathVariable Integer institution_id,Model model){
        model.addAttribute("baseUrl","/moduleBasicEquipmentController");
        model.addAttribute("institution_id",institution_id);
        return "business/module_basic/institution_equipment";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Equipment get(@PathVariable int id) {
        return equipmentService.get(id);
    }

    @RequestMapping(value = "{institution_id}/query",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(@PathVariable Integer institution_id,
                           @RequestParam(required = false) String name) {

        List<Equipment> list = equipmentService.list(institution_id,name);
        return listResponse(list);
    }

    //    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public JSONObject add(@ModelAttribute Equipment equipment, BindingResult result) {
        int ret = equipmentService.add(equipment);
        return flagResponse(1);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute Equipment equipment) {
        int ret = equipmentService.update(equipment);
        return flagResponse(ret);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id->list.add(id));
        int ret = equipmentService.del(list);
        return flagResponse(ret);
    }
}
