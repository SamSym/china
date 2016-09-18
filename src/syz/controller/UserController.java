package syz.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import syz.common.JsonResult;
import syz.model.User;

/**
 * Created by 宋亚周 on 2016/9/16 0016 19:34.
 */
public class UserController extends Controller {

    public void index() {
        render("user.jsp");
    }

    public void datagrid() {
        User model = getModel(User.class, null, true);
        Page<User> datagrid = User.dao.datagrid(getParaToInt("page", 1), getParaToInt("rows", 10), model);
        renderJson(datagrid);
    }

    public void delete() {
        Integer id = getParaToInt(0);
        if (id != null && User.dao.deleteById(id)) {
            renderJson(JsonResult.SUCCESS);
            return;
        }
        renderJson(JsonResult.FAIL);
    }
}
