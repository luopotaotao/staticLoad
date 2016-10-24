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

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

/**
 * Created by taotao on 2016/9/27.
 */
@Controller
@RequestMapping("moduleConfigController")
public class ModuleConfigDeptController extends BaseController<Dept> {
    public static final String UPLOAD_DIR = "tmp";
    public static final String LOGO_DIR = "logo";
    @Autowired
    private DeptServiceI deptService;

    @RequestMapping("index")
    public String index(Model model) {
        model.addAttribute("baseUrl", "moduleConfigController");
        return "business/module_config/index";
    }

    @RequestMapping("{dept_id}/users")
    public String personal(@PathVariable Integer dept_id, Model model) {
        model.addAttribute("dept_id", dept_id);
        return "business/module_config/dept_users";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Dept get(@PathVariable int id) {
        return deptService.get(id);
    }

    @RequestMapping(value = "query", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) String name,
                           @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                           @RequestParam(value = "rows", required = false, defaultValue = "10") Integer pageSize) {
        if (name != null && !name.trim().isEmpty()) {
            try {
                name = URLDecoder.decode(name, "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        List<Dept> list = deptService.list(name, page, pageSize);
        long count = deptService.count(name);
        return listResponse(count, list);
    }

    //    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public JSONObject add(@ModelAttribute Dept dept, HttpSession session) {

        boolean isSaved = false;
        try {
            isSaved = saveUploadFile(dept.getLogo(),session);
            if(isSaved){
                deptService.add(dept);
                return flagResponse(1);
            }
        } catch (IOException e) {
            return flagResponse(0);
        }
        return flagResponse(0);
    }

    public boolean saveUploadFile(String filename, HttpSession session) throws IOException {
        if (filename != null && !filename.isEmpty()) {
            String upload_dir = session.getServletContext()
                    .getRealPath(UPLOAD_DIR) + File.separator + filename;
            String img_dir = session.getServletContext()
                    .getRealPath(LOGO_DIR) + File.separator + filename;
            Path source = Paths.get(upload_dir);
            Path nwdir = Paths.get(img_dir);

            Files.move(source, nwdir);
            return true;
        }
        return false;
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
        Arrays.stream(ids).forEach(id -> list.add(id));
        int ret = deptService.del(list);
        return flagResponse(ret);
    }

}
