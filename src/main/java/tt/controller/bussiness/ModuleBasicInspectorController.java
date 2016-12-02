//package tt.controller.bussiness;
//
//import com.alibaba.fastjson.JSONObject;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.*;
//import tt.controller.BaseController;
//import tt.model.business.User;
//import tt.service.bussiness.UserServiceI;
//import tt.util.UrlStringDecoder;
//
//import java.io.UnsupportedEncodingException;
//import java.net.URLDecoder;
//import java.util.Arrays;
//import java.util.LinkedList;
//import java.util.List;
//import java.util.Map;
//
///**
// * Created by tt on 2016/10/2.
// */
//@Controller
//@RequestMapping("moduleBasicUserController")
//public class ModuleBasicUserController extends BaseController<User> {
//    @Autowired
//    private UserServiceI userService;
//
//    @RequestMapping("index/{dept_id}")
//    public String index(@PathVariable Integer dept_id,Model model){
//        model.addAttribute("baseUrl","moduleBasicUserController");
//        model.addAttribute("dept_id",dept_id);
//        return "business/module_basic/dept_user";
//    }
//
//    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
//    @ResponseBody
//    public User get(@PathVariable int id) {
//        return userService.get(id,getDeptId());
//    }
//
//    @RequestMapping(value = "{dept_id}/query",method = RequestMethod.GET)
//    @ResponseBody
//    public JSONObject list(@PathVariable Integer dept_id,
//                           @RequestParam(required = false) String name) {
//        name = UrlStringDecoder.decode(name);
//        Map<String,Object> params = createHashMap("dept_id",dept_id);
//        if (name!=null) {
//            params.put("name",name);
//        }
//        List<User> list = userService.list(params,null,null,getDeptId());
//        return listResponse(list);
//    }
//
//    //    @RequestMapping(value = "post", method = RequestMethod.POST)
//    @RequestMapping(value = "post")
//    @ResponseBody
//    public JSONObject add(@ModelAttribute User user, BindingResult result) {
//        userService.add(user,getDeptId());
//        return flagResponse(user.getId()>0);
//    }
//
//    @RequestMapping(value = "put", method = RequestMethod.POST)
//    @ResponseBody
//    public JSONObject update(@ModelAttribute User user) {
//        userService.update(user,getDeptId());
//        return flagResponse(user.getId()>0);
//    }
//
//    @RequestMapping(value = "delete", method = RequestMethod.POST)
//    @ResponseBody
//    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
//        List<Integer> list = new LinkedList<>();
//        Arrays.stream(ids).forEach(id->list.add(id));
//        int ret = userService.del(list,getDeptId());
//        return flagResponse(ret);
//    }
//}
