package syz.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import syz.common.JsonResult;
import syz.model.Message;

/**
 * Created by 宋亚周 on 2016/9/16 0016 19:34.
 */
public class MessageController extends Controller {

    public void index() {
        render("message.jsp");
    }

    public void datagrid() {
        Page<Message> datagrid = Message.dao.datagrid(getParaToInt("page", 1), getParaToInt("rows", 10));
        renderJson(datagrid);
    }

    public void delete() {
        Integer id = getParaToInt(0);
        if (id != null && Message.dao.deleteById(id)) {
            renderJson(JsonResult.SUCCESS);
            return;
        }
        renderJson(JsonResult.FAIL);
    }
}
