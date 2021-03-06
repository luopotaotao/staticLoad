//package tt.controller.bussiness;
//
//import com.alibaba.fastjson.JSONObject;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//import tt.controller.BaseController;
//import tt.model.business.Dept;
//import tt.service.bussiness.DeptServiceI_;
//import tt.service.bussiness.UserServiceI;
//import tt.util.UrlStringDecoder;
//
//import javax.servlet.http.HttpSession;
//import java.io.File;
//import java.io.IOException;
//import java.nio.file.Files;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//import java.util.*;
//
///**
// * Created by taotao on 2016/9/27.
// */
//@Controller
//@RequestMapping("basic/dept")
//public class ModuleBasicDeptController_ extends BaseController<Dept> {
//    public static final String UPLOAD_DIR = "tmp";
//    public static final String LOGO_DIR = "logo";
//    @Autowired
//    private DeptServiceI_ deptService;
//
//    private UserServiceI userService;
//
//    @RequestMapping("index")
//    public String index(Model model) {
//        Dept dept = getOriginDept()!=null?getOriginDept():getDept();
//        model.addAttribute("baseUrl", "basic/dept");
//        model.addAttribute("dept_id", dept.getId());
//        return "business/module_basic/dept_";
//    }
//
//    @RequestMapping("{dept_id}/users")
//    public String listAccounts(@PathVariable Integer dept_id, Model model) {
//        model.addAttribute("dept_id", dept_id);
//        return "business/module_basic/dept_users";
//    }
//
//    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
//    @ResponseBody
//    public Dept get(@PathVariable int id) {
//        return deptService.get(id);
//    }
//
//    @RequestMapping(value = "query", method = RequestMethod.GET)
//    @ResponseBody
//    public JSONObject list(@RequestParam(required = false) String name,
//                           @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
//                           @RequestParam(value = "rows", required = false, defaultValue = "10") Integer pageSize) {
//        name = UrlStringDecoder.decode(name);
//        List<Dept> list = deptService.list(name, page, pageSize);
//        long count = deptService.count(name);
//        return listResponse(count, list);
//    }
//
//    //    @RequestMapping(value = "post", method = RequestMethod.POST)
//    @RequestMapping(value = "post")
//    @ResponseBody
//    public JSONObject add(@ModelAttribute Dept dept, HttpSession session) {
//
//        boolean isSaved = false;
//        if(dept.getLogo()!=null&&!dept.getLogo().isEmpty()){
//            try {
//                isSaved = saveUploadFile(dept.getLogo(), session);
//            } catch (IOException e) {
//                return flagResponse(0);
//            }
//        }else{
//            isSaved = true;
//        }
//        if (isSaved) {
//            deptService.add(dept);
//            return flagResponse(1);
//        }
//
//        return flagResponse(0);
//    }
//
//    public boolean saveUploadFile(String filename, HttpSession session) throws IOException {
//        boolean flag = false;
//        if (filename != null && !filename.isEmpty()) {
//            String upload_dir = session.getServletContext()
//                    .getRealPath(UPLOAD_DIR) + File.separator + filename;
//            String img_dir = session.getServletContext()
//                    .getRealPath(LOGO_DIR) + File.separator + filename;
//            Path source = Paths.get(upload_dir);
//            Path nwdir = Paths.get(img_dir);
//            if (Files.exists(nwdir)) {
//                flag = true;
//            } else {
//                Path path = Files.move(source, nwdir);
//                flag = path!=null;
//            }
//        }
//        return flag;
//    }
//
//    @RequestMapping(value = "put", method = RequestMethod.POST)
//    @ResponseBody
//    public JSONObject update(@ModelAttribute Dept dept, HttpSession session) {
//        int ret = 0;
//
//        boolean isSaved = false;
//        try {
//            isSaved = saveUploadFile(dept.getLogo(), session);
//            if (isSaved) {
//                deptService.update(dept);
//                ret = deptService.update(dept);
//            }
//        } catch (IOException e) {
//
//        }
//        return flagResponse(ret);
//    }
//
//    @RequestMapping(value = "delete", method = RequestMethod.POST)
//    @ResponseBody
//    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids, HttpSession session) {
//        List<Integer> list = new LinkedList<>();
//        Arrays.stream(ids).forEach(id -> list.add(id));
//        int ret = deptService.del(list);
//        return flagResponse(ret);
//    }
//
//}
