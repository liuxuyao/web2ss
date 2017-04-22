package net.app.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.app.dao.MybatisDao;
import net.app.po.admin;
import net.app.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private MybatisDao dao;
	
	@Override
	public admin validateNamePwd(Map<String, Object> params) {
		return this.dao.get("admin.validateNamePwd", params); 
	}

}
