package tt.controller.bussiness;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import tt.controller.BaseController;
import tt.ext.web.FileUploadProgressListener;
import tt.model.business.File;
import tt.service.bussiness.FileService;
import tt.util.FileUtil;
import tt.util.SessionUtil;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by tt on 2016/11/28.
 */
@Controller
@RequestMapping("file")
public class FileManageController extends BaseController{

    @Autowired
    private FileService fileService;
    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> upload(MultipartFile file){
        String filePath = SessionUtil.get().getServletContext().getRealPath("/")+"WEB-INF/resources/upload/";
        UUID id = null;
        try {
            id = FileUtil.saveFile(file,filePath, uuid->{
                fileService.add(new File(uuid.toString(),file.getOriginalFilename(),getDeptId()),getDeptId());
                System.out.println(uuid.toString());
            });
        } catch (IOException e) {
            e.printStackTrace();
        }
        SessionUtil.removeAttribute(FileUploadProgressListener.SESSION_PROGRESS_KEY);
        Map<String,Object> ret = new HashMap<>();
        ret.put("uuid",id);
        return ret;
    }
    @RequestMapping(value = "/get/{uuid}",method = RequestMethod.GET)
    public File get(@PathVariable String uuid){
        return fileService.get(uuid,getDeptId());
    }
}