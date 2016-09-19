package syz.model;

import com.jfinal.plugin.activerecord.Page;
import syz.model.base.BaseMyOrder;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class MyOrder extends BaseMyOrder<MyOrder> {
	public static final MyOrder dao = new MyOrder();

	public Page<MyOrder> datagrid(int pageNumber, int pageSize) {
		String select = "select *";
		String from = "from my_order order by create_time desc";
		return dao.paginate(pageNumber, pageSize, select, from);
	}
}
