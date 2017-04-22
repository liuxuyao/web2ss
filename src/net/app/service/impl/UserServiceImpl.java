package net.app.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.app.dao.MybatisDao;
import net.app.po.Page;
import net.app.po.User;
import net.app.service.UserService;


@Service
@Transactional(readOnly = false)
public class UserServiceImpl implements UserService {
 
@Autowired	
private MybatisDao dao;
  

@Override
public void save(User user) {
   dao.save("user.insert", user);
	
}

@Override
public User getById(String id) {
    Map<String,Object> map=new HashMap<String,Object>();
    map.put("id", id);
	return dao.get("user.select", map);
}

@Override
public User getByUsername(String username) {
    Map<String,Object> params=new HashMap<String,Object>();
    params.put("username", username);
	return this.dao.get("selectByUsername", params);
}

@Override
public User validateNamePwd(Map<String, Object> params) {
	return this.dao.get("user.validateNamePwd", params);
}

@Override
public Page getListForPage(Map<String, Object> params, int page, int rows) {
	  Page p = dao.getListByPage("user.select", params, page, rows);
      return p;
}

@Override
public Page getListForPage(Map<String, Object> params, Page page) {
	   Page p = dao.getListByPage("user.select", params, page);
       return p;
}

@Override
public void update(User user) {
	dao.update("user.update", user);
	
}

@Override
public void delete(String id) {
	   dao.delete("user.delete", id);
	
}
  
}
