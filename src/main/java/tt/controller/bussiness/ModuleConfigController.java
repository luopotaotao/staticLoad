package tt.controller.bussiness;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.Dept;
import tt.model.business.Dept;
import tt.service.bussiness.DeptServiceI;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by taotao on 2016/9/27.
 */
@Controller
@RequestMapping("moduleConfigController")
public class ModuleConfigController  extends BaseController<Dept> {
    @Autowired
    private DeptServiceI deptService;

    @RequestMapping("index")
    public String index(Model model){
        model.addAttribute("baseUrl","moduleConfigController");
        return "business/module_config/index";
    }
    @RequestMapping("{dept_id}/users")
    public String personal(@PathVariable Integer dept_id, Model model){
        model.addAttribute("dept_id",dept_id);
        return "business/module_config/dept_users";
    }
    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Dept get(@PathVariable int id) {
        return deptService.get(id);
    }

    @RequestMapping(value = "query",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) String name,
                           @RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                           @RequestParam(value = "rows",required = false,defaultValue = "10") Integer pageSize) {
        if(name!=null&&!name.trim().isEmpty()){
            try {
                name = URLDecoder.decode(name,"utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        List<Dept> list = deptService.list(name,page,pageSize);
        long count = deptService.count(name);
        return listResponse(count, list);
    }

    //    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public JSONObject add(@ModelAttribute Dept dept) {
        int ret = deptService.add(dept);
        return flagResponse(1);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute Dept dept) {
        int ret = deptService.update(dept);
        return flagResponse(ret);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id->list.add(id));
        int ret = deptService.del(list);
        return flagResponse(ret);
    }
}
