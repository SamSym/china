package syz.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseUser<M extends BaseUser<M>> extends Model<M> implements IBean {

	public void setUserid(java.lang.Integer userid) {
		set("userid", userid);
	}

	public java.lang.Integer getUserid() {
		return get("userid");
	}

	public void setAge(java.lang.String age) {
		set("age", age);
	}

	public java.lang.String getAge() {
		return get("age");
	}

	public void setUsername(java.lang.String username) {
		set("username", username);
	}

	public java.lang.String getUsername() {
		return get("username");
	}

	public void setPasswords(java.lang.String passwords) {
		set("passwords", passwords);
	}

	public java.lang.String getPasswords() {
		return get("passwords");
	}

	public void setUserPhotoPath(java.lang.String userPhotoPath) {
		set("User_photo_path", userPhotoPath);
	}

	public java.lang.String getUserPhotoPath() {
		return get("User_photo_path");
	}

	public void setUname(java.lang.String uname) {
		set("uname", uname);
	}

	public java.lang.String getUname() {
		return get("uname");
	}

	public void setSex(java.lang.String sex) {
		set("sex", sex);
	}

	public java.lang.String getSex() {
		return get("sex");
	}

	public void setTel(java.lang.String tel) {
		set("tel", tel);
	}

	public java.lang.String getTel() {
		return get("tel");
	}

	public void setRole(java.lang.String role) {
		set("role", role);
	}

	public java.lang.String getRole() {
		return get("role");
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

	public void setDsname(java.lang.String dsname) {
		set("dsname", dsname);
	}

	public java.lang.String getDsname() {
		return get("dsname");
	}

	public void setTime(java.util.Date time) {
		set("time", time);
	}

	public java.util.Date getTime() {
		return get("time");
	}

}