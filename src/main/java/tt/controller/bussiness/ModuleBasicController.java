package tt.controller.bussiness;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by taotao on 2016/9/27.
 */
@RequestMapping("moduleBasicController")
@Controller
public class ModuleBasicController {
    @RequestMapping("index")
    public String companyIndex(){
        return "business/module_basic/index";
    }
}
