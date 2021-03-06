package syz.api;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.jfinal.json.JFinalJson;
import syz.common.JsonResult;
import syz.common.LoginInterceptor;
import syz.model.MyOrder;
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
        Integer id = getParaToInt("Userid");
        User model = User.dao.findById(id);
        if (model != null) {
            renderJson(JsonResult.result(true, "200", "成功！", Collections.singletonList(model)));
        } else {
            renderJson(JsonResult.result(false, "201", "未查询到数据！", Collections.emptyList()));
        }
    }

    public void addUser() {
        Map<String, Object> map = new HashMap<>();
        String dsname = getPara("ThreeId");
        User user = User.dao.findFirst("select * from user where dsname = ?", dsname);
        if (user == null) {
            User model = new User();
            model.setDsname(dsname);
            model.setUname(getPara("ThreeName"));
            model.setUserPhotoPath(getPara("ThreeImg"));
            model.setCreateTime(new Date());
            model.save();
            map.put("Userid", model.getUserid());
        } else
            map.put("Userid", user.getUserid());
        map.put("code", 200);
        renderJson(map);
    }

    public void addorder() {
        String json = getPara("JSONDATA");
        JSONObject jsonObject = JSON.parseObject(json);
        MyOrder model = new MyOrder();
        model.setUserId(jsonObject.getInteger("userId"));
        model.setOrderDate(jsonObject.getString("order_date"));
        model.setOrderTime(jsonObject.getString("order_time"));
        model.setName(jsonObject.getString("name"));
        model.setCard(jsonObject.getString("card"));
        model.setTel(jsonObject.getString("tel"));
        model.setEmail(jsonObject.getString("email"));
        model.setCreateTime(new Date());
        model.setStatus(0);
        if(model.save()) {
            renderJson(JsonResult.result(true, "200", "预约成功", null));
        }else
            renderJson(JsonResult.result(false, "201", "服务器繁忙，请稍后重试。", null));
    }
}
