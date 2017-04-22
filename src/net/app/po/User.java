package net.app.po;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.apache.commons.lang.StringUtils;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {

	private static final long serialVersionUID = 3424554443863352532L;
	/**
	 * id
	 */
	private String id;
	/**
	 * username
	 */
	private String username;
	/**
	 * 性别 1男0女
	 */
	private String sex;
	/**
	 * password
	 */
	@JsonIgnore
	private String password;
	/**
	 * 手机号码
	 */
	private String mobile;
	/**
	 * email
	 */
	private String email;
	/**
	 * create_time
	 */
	private Date createtime;
	
	public void setId(String id) {

		this.id = id;
	}

	public String getId() {
		return this.id;
	}

	public void setUsername(String username) {

		if (StringUtils.isNotBlank(username)) {
			username = username.trim();
		}
		this.username = username;
	}

	public String getUsername() {
		return this.username;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public void setPassword(String password) {

		if (StringUtils.isNotBlank(password)) {
			password = password.trim();
		}
		this.password = password;
	}

	public String getPassword() {
		return this.password;
	}

	public void setMobile(String mobile) {

		if (StringUtils.isNotBlank(mobile)) {
			mobile = mobile.trim();
		}
		this.mobile = mobile;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setEmail(String email) {

		if (StringUtils.isNotBlank(email)) {
			email = email.trim();
		}
		this.email = email;
	}

	public String getEmail() {
		return this.email;
	}
	


	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}


}
