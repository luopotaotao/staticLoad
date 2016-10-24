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

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

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
        model.addAttribute("baseUrl","moduleBasicEquipmentController");
        model.addAttribute("institution_id",institution_id);
        return "business/module_basic/institution_equipment";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Equipment get(@PathVariable int id) {
        return equipmentService.get(id,getDeptId());
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
        Map<String,Object> params = createHashMap("name",name);
        params.put("institution_id",institution_id);
        List<Equipment> list = equipmentService.list(params,null,null,getDeptId());
        return listResponse(list);
    }

    //    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public JSONObject add(@ModelAttribute Equipment equipment, BindingResult result) {
        equipmentService.add(equipment,getDeptId());
        return flagResponse(equipment.getId()>0);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute Equipment equipment) {
        equipmentService.update(equipment,getDeptId());
        return flagResponse(equipment.getId()>0);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id->list.add(id));
        int ret = equipmentService.del(list,getDeptId());
        return flagResponse(ret);
    }
}
