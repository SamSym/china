package syz.model;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import syz.model.base.BaseMyInfo;

import java.util.ArrayList;
import java.util.List;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class MyInfo extends BaseMyInfo<MyInfo> {
    public static final MyInfo dao = new MyInfo();

    public Page<MyInfo> datagrid(int pageNumber, int pageSize, MyInfo model) {
        List<Object> params = new ArrayList<>();
        String select = "select *";
        String from = "from my_info where 1=1";
        if (StrKit.notBlank(model.getMsub())) {
            from += " and msub like ? ";
            params.add("%" + model.getMsub() + "%");
        }
        from += " order by sort desc";
        return dao.paginate(pageNumber, pageSize, select, from, params.toArray());
    }
}
