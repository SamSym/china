package syz.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;
import syz.common.JsonResult;
import syz.model.Collection;

import java.util.Date;

/**
 * Created by 宋亚周 on 2016/9/16 0016 19:34.
 */
public class CollectionController extends Controller {

    public void index(){
        render("collection.jsp");
    }

    public void datagrid() {
        Collection model = getModel(Collection.class, null, true);
        Page<Collection> datagrid = Collection.dao.datagrid(getParaToInt("page", 1), getParaToInt("rows", 10), model);
        renderJson(datagrid);
    }

    public void delete() {
        Integer id = getParaToInt(0);
        if (id != null && Collection.dao.deleteById(id)) {
            renderJson(JsonResult.SUCCESS);
            return;
        }
        renderJson(JsonResult.FAIL);
    }

    public void save() {
        Boolean result;
        UploadFile uploadFile = getFile("collection_photo_path_file");
        Collection model = getModel(Collection.class, "");
        if (uploadFile != null) {
            model.setCollectionPhotoPath(uploadFile.getFileName());
        }
        if (model.getCid() != null) {
            model.setUpdateTime(new Date());
            result = model.update();
        } else {
            model.setCreateTime(new Date());
            result = model.save();
        }
        renderJson(JsonResult.result(result));
    }
}
