package syz.api;

import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import syz.common.JsonResult;
import syz.common.LoginInterceptor;
import syz.model.User;

import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 宋亚周 on 2016/9/16 0016 19:34.
 * myuser
 */
@Clear(LoginInterceptor.class)
public class UserApi extends Controller {

    public void getAllUser() {
        Integer id = getParaToInt("userId");
        User model = User.dao.findById(id);
        if (model != null) {
            renderJson(JsonResult.result(true, "200", "成功！", Collections.singletonList(model)));
        } else {
            renderJson(JsonResult.result(false, "201", "未查询到数据！", Collections.emptyList()));
        }
    }

    public void addorder() {

    }

    public void addUser() {
        User model = new User();
        model.setDsname(getPara("ThreeId"));
        model.setUname(getPara("ThreeName"));
        model.setUserPhotoPath(getPara("ThreeImg"));
        model.setCreateTime(new Date());
        model.save();
        Map<String, Object> map = new HashMap<>();
        map.put("code", 200);
        map.put("Userid", model.getUserid());
        renderJson(map);
    }
}
