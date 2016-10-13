package tt.controller.bussiness;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.User;
import tt.service.bussiness.UserServiceI;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

/**
 * Created by tt on 2016/10/2.
 */
@Controller
@RequestMapping("moduleConfigUserController")
public class ModuleConfigUserController extends BaseController<User> {
    @Autowired
    private UserServiceI userService;

    @RequestMapping("index/{dept_id}")
    public String index(@PathVariable Integer dept_id, Model model) {
        model.addAttribute("baseUrl", "moduleConfigUserController");
        model.addAttribute("dept_id", dept_id);
        return "business/module_config/dept_users";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public User get(@PathVariable int id) {
        return userService.get(id, getDeptId());
    }

    @RequestMapping(value = "{dept_id}/query", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(@PathVariable Integer dept_id,
                           @RequestParam(required = false) String name) {
        if (name != null && !name.trim().isEmpty()) {
            try {
                name = URLDecoder.decode(name, "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        Map<String, Object> params = createHashMap("dept_id", dept_id);
        params.put("name", name);
        List<User> list = userService.list(params, null, null, dept_id);
        return listResponse(list);
    }

    @RequestMapping(value = "/queryAll", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) String name) {
        Map<String, Object> params = new HashMap<>();
        if (name != null && !name.trim().isEmpty()) {
            try {
                name = URLDecoder.decode(name, "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            params.put("name", name);
        }
        List<User> list = userService.list(params, null, null, getDeptId());
        return listResponse(list);
    }


    @RequestMapping(value = "post", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject add(@ModelAttribute User user, BindingResult result) {
        if (userService.isExist(user.getId())) {
            JSONObject ret = jsonResponse("flag", false);
            ret.put("msg", "exist");
            return ret;
        }
        user.setLockSymbol((short) 0);
        user.setRemainingLogins((short) 5);
        userService.add(user, user.getDept().getId());
        return flagResponse(1);

    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute User user) {
        userService.update(user, getDeptId());
        return flagResponse(user.getId());
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") String[] ids) {
        List<String> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id -> list.add(id));
        int ret = userService.del(list);
        return flagResponse(ret);
    }
}
