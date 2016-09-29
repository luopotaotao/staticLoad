package tt.controller.bussiness;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import tt.model.business.Project;
import tt.pageModel.SessionInfo;
import tt.pageModel.Tree;
import tt.service.bussiness.MapServiceI;
import tt.util.ConfigUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by taotao on 2016/9/27.
 */
@RequestMapping("moduleMapController")
@Controller
public class ModuleMapController {

//    @Autowired
    private MapServiceI mapServiceI;
    @RequestMapping("index")
    public String companyIndex(){
        return "business/module_map/index";
    }

    @RequestMapping("area")
    @ResponseBody
    public Tree areaTree(@SessionAttribute SessionInfo sessionInfo){
        Tree ret = mapServiceI.loadAreaTree(sessionInfo.getId());
        return ret;
    }
    @RequestMapping("{areaId}/projects")
    public List<Project> getProjects(@PathVariable Integer areaId,@SessionAttribute SessionInfo sessionInfo){
        List<Project> ret = mapServiceI.loadProjectsByArea(areaId,sessionInfo.getId());
        return ret;
    }
}
