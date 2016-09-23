package tt.controller;


import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tt.pageModel.Json;
import tt.timingTask.OnlineJob;


/**
 * @author zhangxh
 */
@Controller
@RequestMapping("/monitorController")
public class MonitorController extends BaseController
{

    /**
     * 更新页面最后一次ajax发请求的时间
     */
    @RequestMapping("/monitoronline")
    @ResponseBody
    public Json monitoronline(HttpSession session)
        throws Exception
    {
        Json j = new Json();
        if (getSessionInfo() != null)
        {
            String name = getSessionInfo().getName();
            if (!OnlineJob.getOperateMap().containsKey(name))
            {
                session.invalidate();
                j.setMsg("操作超时");
                return j;
            }
            OnlineJob.getMap().put(name, new Date());
            j.setMsg("成功");
            j.setSuccess(true);
            j.setObj("服务器正常");
        }
        else
        {
            j.setSuccess(false);
            j.setMsg("您还没有登录或登录已超时，请重新登录!");
        }

        return j;
    }

}
