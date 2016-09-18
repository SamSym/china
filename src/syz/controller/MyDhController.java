package syz.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;
import syz.common.JsonResult;
import syz.common.WebUtil;
import syz.model.MyDh;

import java.util.Date;

/**
 * Created by 宋亚周 on 2016/9/16 0016 19:34.
 */
public class MyDhController extends Controller {

    public void index() {
        render("myDh.jsp");
    }

    public void datagrid() {
        MyDh model = getModel(MyDh.class, null, true);
        Page<MyDh> datagrid = MyDh.dao.datagrid(getParaToInt("page", 1), getParaToInt("rows", 10), model);
        renderJson(datagrid);
    }

    public void delete() {
        Integer id = getParaToInt(0);
        if (id != null && MyDh.dao.deleteById(id)) {
            renderJson(JsonResult.SUCCESS);
            return;
        }
        renderJson(JsonResult.FAIL);
    }

    public void save() {
        Boolean result;
        UploadFile uploadFile = getFile("zt_photo_path_file");
        MyDh model = getModel(MyDh.class, "");
        if (uploadFile != null) {
            model.setZtPhotoPath(WebUtil.getUploadUrl(getRequest()) + uploadFile.getFileName());
        }
        if (model.getDid() != null) {
            model.setUpdateTime(new Date());
            result = model.update();
        } else {
            model.setCreateTime(new Date());
            result = model.save();
        }
        renderJson(JsonResult.result(result));
    }
}
