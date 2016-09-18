package syz.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseDistribution<M extends BaseDistribution<M>> extends Model<M> implements IBean {

	public void setDisid(java.lang.Integer disid) {
		set("disid", disid);
	}

	public java.lang.Integer getDisid() {
		return get("disid");
	}

	public void setDisphotoPath(java.lang.String disphotoPath) {
		set("disphoto_path", disphotoPath);
	}

	public java.lang.String getDisphotoPath() {
		return get("disphoto_path");
	}

	public void setDescribes(java.lang.String describes) {
		set("describes", describes);
	}

	public java.lang.String getDescribes() {
		return get("describes");
	}

	public void setDisname(java.lang.String disname) {
		set("disname", disname);
	}

	public java.lang.String getDisname() {
		return get("disname");
	}

	public void setA(java.lang.Integer a) {
		set("a", a);
	}

	public java.lang.Integer getA() {
		return get("a");
	}

	public void setB(java.lang.String b) {
		set("b", b);
	}

	public java.lang.String getB() {
		return get("b");
	}

	public void setC(java.lang.String c) {
		set("c", c);
	}

	public java.lang.String getC() {
		return get("c");
	}

}