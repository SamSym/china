package syz.model;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import syz.model.base.BaseDistribution;

import java.util.ArrayList;
import java.util.List;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class Distribution extends BaseDistribution<Distribution> {
	public static final Distribution dao = new Distribution();

	public Page<Distribution> datagrid(int pageNumber, int pageSize, Distribution model) {
		List<Object> params = new ArrayList<>();
		String select = "select *";
		String from = "from distribution where 1=1";
		if (StrKit.notBlank(model.getDisname())) {
			from += " and disname like ? ";
			params.add("%" + model.getDisname() + "%");
		}
//		from += " order by sort desc";
		return dao.paginate(pageNumber, pageSize, select, from, params.toArray());
	}

	public List<Distribution> findAll(){
		return dao.find("select * from distribution");
	}
}