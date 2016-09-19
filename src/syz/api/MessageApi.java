package syz.api;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import syz.common.JsonResult;
import syz.common.LoginInterceptor;
import syz.model.Message;
import syz.model.User;

import java.util.Collections;
import java.util.Date;

/**
 * Created by 宋亚周 on 2016/9/16 0016 19:34.
 * mess
 */
@Clear(LoginInterceptor.class)
public class MessageApi extends Controller {

    public void addmessage() {
        Integer id = getParaToInt("Userid");
        if (id != null) {
            User user = User.dao.findById(id);
            if (user != null) {
                Message model = getModel(Message.class, null, true);
                model.setUserid(id);
                model.setSname(user.getUname());
                model.setPhoto(user.getUserPhotoPath());
                model.setCreateTime(new Date());
                if(model.save()){
                    renderJson(JsonResult.result(true, "200", "留言成功！", null));
                    return;
                }
            }
        }
        renderJson(JsonResult.result(false, "201", "留言失败！", null));
    }

    public void getAllmessage() {
        String json = getPara("JSONDATA");
        JSONObject jsonObject = JSON.parseObject(json);
        Integer pageNumber = jsonObject.getInteger("PageNum");
        Integer pageSize = jsonObject.getInteger("PageSize");
        Page<Message> datagrid = Message.dao.datagrid(pageNumber, pageSize);
        if (datagrid.getList().size() > 0) {
            renderJson(JsonResult.result(true, "200", "成功！", datagrid.getList()));
        } else {
            renderJson(JsonResult.result(false, "201", "未查询到数据！", Collections.emptyList()));
        }
    }

}
