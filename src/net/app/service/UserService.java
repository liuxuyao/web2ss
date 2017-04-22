package net.app.service;

import java.util.Map;

import net.app.po.Page;
import net.app.po.User;

public interface UserService {
	//保存用户
     public void save(User user);
    //查询用户
     public User getById(String id);
     
     public User getByUsername(String username);
     
     public User validateNamePwd(Map<String,Object> params);

     public abstract Page getListForPage(Map<String, Object> params, int page, int rows);

    public abstract Page getListForPage(Map<String, Object> params, Page page);

    public void update(User user);
    
    public abstract void delete(String id);
}
