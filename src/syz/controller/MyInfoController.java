package syz.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;
import syz.common.JsonResult;
import syz.common.WebUtil;
import syz.model.MyInfo;

import java.io.File;
import java.util.Date;

/**
 * Created by 宋亚周 on 2016/9/16 0016 19:34.
 */
public class MyInfoController extends Controller {

    public void index() {
        render("myInfo.jsp");
    }

    public void datagrid() {
        MyInfo model = getModel(MyInfo.class, null, true);
        Page<MyInfo> datagrid = MyInfo.dao.datagrid(getParaToInt("page", 1), getParaToInt("rows", 10), model);
        renderJson(datagrid);
    }

    public void delete() {
        Integer id = getParaToInt(0);
        if (id != null && MyInfo.dao.deleteById(id)) {
            renderJson(JsonResult.SUCCESS);
            return;
        }
        renderJson(JsonResult.FAIL);
    }

    public void save() {
        UploadFile uploadFile = getFile("photo_path_file");
        MyInfo model = getModel(MyInfo.class, "");
        if (uploadFile != null) {
            String fileName = WebUtil.getRandomFileName(uploadFile.getFileName());
            if(uploadFile.getFile().renameTo(new File(uploadFile.getUploadPath(), fileName))) {
                model.setPhotoPath(WebUtil.getImageUrl(getRequest(), fileName));
            }
        }
        if (model.getMid() != null) {
            model.setUpdateTime(new Date());
            renderJson(JsonResult.result(model.update()));
        } else {
            model.setCreateTime(new Date());
            renderJson(JsonResult.result(model.save()));
        }
    }
}
