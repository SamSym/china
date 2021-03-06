package syz.model;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import syz.model.base.BaseMyDh;

import java.util.ArrayList;
import java.util.List;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class MyDh extends BaseMyDh<MyDh> {
	public static final MyDh dao = new MyDh();

	public Page<MyDh> datagrid(int pageNumber, int pageSize, MyDh model) {
		List<Object> params = new ArrayList<>();
		String select = "select *";
		String from = "from my_dh where 1=1";
		if (StrKit.notBlank(model.getDname())) {
			from += " and dname like ? ";
			params.add("%" + model.getDname() + "%");
		}
		if (StrKit.notBlank(model.getDSname())) {
			from += " and d_sname like ? ";
			params.add("%" + model.getDSname() + "%");
		}
//		from += " order by sort desc";
		return dao.paginate(pageNumber, pageSize, select, from, params.toArray());
	}
}
