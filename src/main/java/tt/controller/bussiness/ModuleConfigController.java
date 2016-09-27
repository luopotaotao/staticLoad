package tt.controller.bussiness;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by taotao on 2016/9/27.
 */
@Controller
@RequestMapping("moduleConfig")
public class ModuleConfigController {

    @RequestMapping("/index")
    public String index(){
        return "business/module_config/index";
    }
}
