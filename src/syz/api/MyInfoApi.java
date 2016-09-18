package syz.api;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import syz.common.JsonResult;
import syz.common.LoginInterceptor;
import syz.model.Collection;
import syz.model.MyInfo;

import java.util.Collections;

/**
 * Created by 宋亚周 on 2016/9/16 0016 19:34.
 * myinfoadvice
 */
@Clear(LoginInterceptor.class)
public class MyInfoApi extends Controller {

    public void getAlladvice() {
        String json = getPara("JSONDATA");
        JSONObject jsonObject = JSON.parseObject(json);
        Integer pageNumber = jsonObject.getInteger("PageNum");
        Integer pageSize = jsonObject.getInteger("PageSize");
        Page<MyInfo> datagrid = MyInfo.dao.datagrid(pageNumber, pageSize, new MyInfo());
        if (datagrid.getList().size() > 0) {
            renderJson(JsonResult.result(true, "200", "成功！", datagrid.getList()));
        } else {
            renderJson(JsonResult.result(false, "201", "未查询到数据！", Collections.emptyList()));
        }
    }

    public void detailsAdvice() {
        Integer id = getParaToInt("Itemid");
        MyInfo model = MyInfo.dao.findById(id);
        if (model != null) {
            renderJson(JsonResult.result(true, "200", "成功！", Collections.singletonList(model)));
        } else {
            renderJson(JsonResult.result(false, "201", "未查询到数据！", Collections.emptyList()));
        }
    }

}
