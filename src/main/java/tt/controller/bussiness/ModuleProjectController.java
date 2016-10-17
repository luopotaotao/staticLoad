package tt.controller.bussiness;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.Project;
import tt.service.bussiness.ProjectServiceI;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by taotao on 2016/9/27.
 */
@Controller
@RequestMapping("moduleProjectController")
public class ModuleProjectController extends BaseController<Project> {
    @RequestMapping("index")
    public String index(@RequestParam(name = "project_id",required = false) String project_id,Model model){
        model.addAttribute("baseUrl","/moduleProjectController");
        model.addAttribute("project_id",project_id!=null?project_id:"null");
        return "business/module_project/index";
    }
}
