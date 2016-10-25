package tt.controller.bussiness;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.Institution;
import tt.service.bussiness.InstitutionServiceI;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

/**
 * Created by taotao on 2016/9/27.
 * 检测机构
 */

@Controller
@RequestMapping("moduleBasicInstitutionController")
public class ModuleBasicInstitutionController extends BaseController<Institution> {
    @Autowired
    private InstitutionServiceI institutionService;

    @RequestMapping("index")
    public String index(Model model) {
        model.addAttribute("baseUrl", "moduleBasicInstitutionController");
        return "business/module_basic/institution";
    }

    @RequestMapping("{institution_id}/personal")
    public String personal(@PathVariable Integer institution_id, Model model) {
        model.addAttribute("institution_id", institution_id);
        return "business/module_basic/institution_inspector";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Institution get(@PathVariable int id) {
        return institutionService.get(id, getDeptId());
    }

    @RequestMapping(value = "query", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) Byte typ,
                           @RequestParam(required = false) String name,
                           @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                           @RequestParam(value = "rows", required = false, defaultValue = "10") Integer pageSize) {
        if (name != null && !name.trim().isEmpty()) {
            try {
                name = URLDecoder.decode(name, "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        Map<String, Object> params = new HashMap<>();
        if (name != null) {
            params.put("name", name);
        }
        if (typ != null) {
            params.put("typ", typ);
        }
        List<Institution> list = null;
        long count = institutionService.count(params, getDeptId());
        if (count > 0) {
            list = institutionService.list(params, page, pageSize, getDeptId());
        }
        return listResponse(count, list);
    }

    //    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public JSONObject add(@ModelAttribute Institution institution) {
        institutionService.add(institution, getDeptId());
        return flagResponse(institution.getId() > 0);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute Institution institution) {
        institutionService.update(institution, getDeptId());
        return flagResponse(institution.getId() > 0);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id -> list.add(id));
        int ret = institutionService.del(list, getDeptId());
        return flagResponse(ret);
    }
}
