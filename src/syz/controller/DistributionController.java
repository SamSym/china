package syz.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;
import syz.common.JsonResult;
import syz.common.WebUtil;
import syz.model.Distribution;

import java.io.File;

/**
 * Created by 宋亚周 on 2016/9/16 0016 19:34.
 */
public class DistributionController extends Controller {

    public void index() {
        render("distribution.jsp");
    }

    public void datagrid() {
        Distribution model = getModel(Distribution.class, null, true);
        Page<Distribution> datagrid = Distribution.dao.datagrid(getParaToInt("page", 1), getParaToInt("rows", 10), model);
        renderJson(datagrid);
    }

    public void delete() {
        Integer id = getParaToInt(0);
        if (id != null && Distribution.dao.deleteById(id)) {
            renderJson(JsonResult.SUCCESS);
            return;
        }
        renderJson(JsonResult.FAIL);
    }

    public void save() {
        UploadFile uploadFile = getFile("disphoto_path_file");
        Distribution model = getModel(Distribution.class, "");
        if (uploadFile != null) {
            String fileName = WebUtil.getRandomFileName(uploadFile.getFileName());
            if (uploadFile.getFile().renameTo(new File(uploadFile.getUploadPath(), fileName))) {
                model.setDisphotoPath(WebUtil.getImageUrl(getRequest(), fileName));
            }
        }
        if (model.getDisid() != null) {
            renderJson(JsonResult.result(model.update()));
        } else {
            renderJson(JsonResult.result(model.save()));
        }
    }
}
