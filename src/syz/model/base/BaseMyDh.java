package syz.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseMyDh<M extends BaseMyDh<M>> extends Model<M> implements IBean {

	public void setDid(java.lang.Integer did) {
		set("did", did);
	}

	public java.lang.Integer getDid() {
		return get("did");
	}

	public void setDname(java.lang.String dname) {
		set("dname", dname);
	}

	public java.lang.String getDname() {
		return get("dname");
	}

	public void setDSname(java.lang.String dSname) {
		set("d_sname", dSname);
	}

	public java.lang.String getDSname() {
		return get("d_sname");
	}

	public void setZtPhotoPath(java.lang.String ztPhotoPath) {
		set("zt_photo_path", ztPhotoPath);
	}

	public java.lang.String getZtPhotoPath() {
		return get("zt_photo_path");
	}

	public void setCreateMan(java.lang.String createMan) {
		set("create_man", createMan);
	}

	public java.lang.String getCreateMan() {
		return get("create_man");
	}

	public void setCreateTime(java.util.Date createTime) {
		set("create_time", createTime);
	}

	public java.util.Date getCreateTime() {
		return get("create_time");
	}

	public void setUpdateMan(java.lang.String updateMan) {
		set("update_man", updateMan);
	}

	public java.lang.String getUpdateMan() {
		return get("update_man");
	}

	public void setUpdateTime(java.util.Date updateTime) {
		set("update_time", updateTime);
	}

	public java.util.Date getUpdateTime() {
		return get("update_time");
	}

}
