package syz.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import syz.common.JsonResult;
import syz.model.MyOrder;

/**
 * Created by 宋亚周 on 2016/9/16 0016 19:34.
 */
public class MyOrderController extends Controller {

    public void index() {
        render("myOrder.jsp");
    }

    public void datagrid() {
        Page<MyOrder> datagrid = MyOrder.dao.datagrid(getParaToInt("page", 1), getParaToInt("rows", 10));
        renderJson(datagrid);
    }

    public void delete() {
        Integer id = getParaToInt(0);
        if (id != null && MyOrder.dao.deleteById(id)) {
            renderJson(JsonResult.SUCCESS);
            return;
        }
        renderJson(JsonResult.FAIL);
    }
}
