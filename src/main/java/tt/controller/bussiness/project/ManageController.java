package tt.controller.bussiness.project;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tt.controller.BaseController;
import tt.model.business.Project;
import tt.service.bussiness.ProjectServiceI;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

/**
 * Created by taotao on 2016/9/27.
 */
@Controller
@RequestMapping("project/manage")
public class ManageController extends BaseController<Project> {
    @Autowired
    private ProjectServiceI projectService;

    @RequestMapping("index")
    public String index(@RequestParam(name = "project_id", required = false) String project_id, Model model) {
        model.addAttribute("project_id", project_id != null ? project_id : "null");
        return "business/module_project/index";
    }
    @RequestMapping("selectCoordinate")
    public String selectCoordinate(){
        return "business/module_project/project_select_coordinate";
    }

    @RequestMapping(value = "get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Project get(@PathVariable int id) {
        return projectService.get(id,getDeptId());
    }

    @RequestMapping(value = "query",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject list(@RequestParam(required = false) Integer area_id,
                           @RequestParam(required = false) String name,
                           @RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                           @RequestParam(value = "rows",required = false,defaultValue = "10") Integer pageSize) {
        Map<String,Object> params = new HashMap<>();
        if(name!=null&&!name.trim().isEmpty()){
            name = decodeStr(name);
            params.put("name",name);
        }
        if(area_id!=null) {
            params.put("area_id", area_id);
        }
        List<Project> list = null;
        long count = projectService.count(params,getDeptId());
        if(count>0){
            list = projectService.list(params,page,pageSize,getDeptId());
        }
        return listResponse(count, list);
    }

    @RequestMapping(value = "tree",method = RequestMethod.GET)
    @ResponseBody
    public List<Project> list() {
        List<Project> list = projectService.list(null,getDeptId());
        return list;
    }

    @RequestMapping(value = "queryStzh/{prg}")
    @ResponseBody
    public List<String> listStzh(@PathVariable(value = "prg") String prg){
        if(prg!=null&&!prg.trim().isEmpty()){
            return projectService.listStzh(prg);
        }
        return null;
    }

//    @RequestMapping(value = "post", method = RequestMethod.POST)
    @RequestMapping(value = "post")
    @ResponseBody
    public JSONObject add(@ModelAttribute Project project) {
        projectService.add(project,getDeptId());
        return flagResponse(project.getId()>0);
    }

    @RequestMapping(value = "put", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject update(@ModelAttribute Project project) {
        projectService.update(project,getDeptId());
        return flagResponse(project.getId()>0);
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delete(@RequestParam(value = "ids[]") int[] ids) {
        List<Integer> list = new LinkedList<>();
        Arrays.stream(ids).forEach(id->list.add(id));
        int ret = projectService.del(list,getDeptId());
        return flagResponse(ret);
    }

    @RequestMapping("addProject")
    public String addProject(){
        return "business/module_project/project_add_project";
    }
    @RequestMapping("addScheme")
    public String addScheme(){
        return "business/module_project/project_add_scheme";
    }
    @RequestMapping("addPlan")
    public String addPlan(@RequestParam(value = "inspectItemId") Integer inspectItemId,Model model){
        model.addAttribute("inspectItemId",inspectItemId);
        return "business/module_project/project_add_plan";
    }
}
