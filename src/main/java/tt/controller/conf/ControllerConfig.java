package tt.controller.conf;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import tt.exception.*;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by tt on 2016/11/22.
 */
@ControllerAdvice
public class ControllerConfig {
    @ExceptionHandler(value = AddFailedException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Map<String, String> addException(){
        return getMsgMap("添加失败!请重新尝试或联系管理员!");
    }
    
    @ExceptionHandler(value = DeleteException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Map<String, String> deleteException(){
        return getMsgMap("删除失败!请重新尝试或联系管理员!");
    }
    
    @ExceptionHandler(value = UpdateException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Map<String, String> updateException(){
        return getMsgMap("更新失败!请重新尝试或联系管理员!");
    }
    
    @ExceptionHandler(value = QueryException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Map<String, String> queryException(){
        return getMsgMap("查询失败!请重新尝试或联系管理员!");
    }
    
    @ExceptionHandler(value = NotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ResponseBody
    public Map<String, String> notFoundException(){
        return getMsgMap("没有相关记录!");
    }
    



    private Map<String,String> getMsgMap(String msg){
        Map<String,String> ret = new HashMap<>();
        ret.put("msg",msg);
        return ret;
    }
}
