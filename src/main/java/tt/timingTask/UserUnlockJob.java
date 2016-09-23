package tt.timingTask;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tt.service.UserServiceI;


/**
 * @author zhangxh
 */
@Component
public class UserUnlockJob
{

    @Autowired
    private UserServiceI userService;

    private Logger logger = Logger.getLogger(UserUnlockJob.class);

    /**
     * 每天定时的修改用户的账户状态为解锁和剩余登录次数
     */
    public void userUnlock()
    {
        try
        {
            userService.userUnlock();
            logger.info("定时修改账户状态为解锁");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

    }

}
