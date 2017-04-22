package net.app.po;

import java.io.Serializable;

import org.apache.commons.lang.StringUtils;

public class admin implements Serializable{
	
	private static final long serialVersionUID = 342455444386335253L;
	
	private String id;
	private String adminname;
	private String password;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getAdminname() {
		
		return adminname;
	}
	public void setAdminname(String adminname) {
		if (StringUtils.isNotBlank(adminname)) {
			adminname = adminname.trim();
		}
		this.adminname = adminname;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		if (StringUtils.isNotBlank(password)) {
			password = password.trim();
		}
		this.password = password;
	}
	
}
