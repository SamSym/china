package syz.model;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import syz.model.base.BaseUser;

import java.util.ArrayList;
import java.util.List;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class User extends BaseUser<User> {
    public static final User dao = new User();

    public Page<User> datagrid(int pageNumber, int pageSize, User model) {
        List<Object> params = new ArrayList<>();
        String select = "select *";
        String from = "from user where 1=1";
        if(StrKit.notBlank(model.getUname())){
            from += " and uname like ? ";
            params.add("%" + model.getUname() + "%");
        }
        from += " order by create_time desc";
        return dao.paginate(pageNumber, pageSize, select, from, params.toArray());
    }

}