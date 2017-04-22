package net.app.service;

import java.util.Map;

import net.app.po.admin;

public interface AdminService {
	public admin validateNamePwd(Map<String,Object> params);
}
