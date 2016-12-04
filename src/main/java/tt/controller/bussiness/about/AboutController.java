package tt.controller.bussiness.about;

import org.markdown4j.Markdown4jProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tt.model.business.About;
import tt.service.bussiness.AboutServiceI;

import java.io.IOException;

/**
 * Created by tt on 2016/12/4.
 */
@Controller
@RequestMapping("about")
public class AboutController {
    @Autowired
    private AboutServiceI aboutService;
    @Autowired
    private Markdown4jProcessor markdown4jProcessor;
    @RequestMapping("index")
    public String about(Model model) throws IOException {
        About about = aboutService.get();
        String html = about!=null&&about.getContent()!=null?markdown4jProcessor.process(about.getContent()):"未填写";
        model.addAttribute("about",html);
        return "business/about/about";
    }

    @RequestMapping(value = "edit",method = RequestMethod.GET)
    public String edit(Model model){
        About about = aboutService.get();
        String html = about!=null&&about.getContent()!=null?about.getContent():"未填写";
        model.addAttribute("about",html);
        return "business/about/edit";
    }
    @RequestMapping(value = "post",method = RequestMethod.POST)
    @ResponseBody
    public About post(@ModelAttribute About about){
        System.out.println(about.getContent());
        About ret = aboutService.save(about);
        return ret;
    }

}
