package net.app.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.coyote.http11.Http11AprProcessor;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.app.po.admin;
import net.app.service.AdminService;
import net.app.service.UserService;

@Controller
@RequestMapping(value="admin")
public class AdminController extends BaseController{
	
	@Autowired
	private AdminService adminservice;
	
	@RequestMapping(method=RequestMethod.GET,value="/login")
	public String getLogin(Model model,HttpServletRequest request){
		return "app/login";
	}
	@RequestMapping(method=RequestMethod.POST,value="/validateNamePwd")
    @ResponseBody
	public String select(Model model,HttpServletRequest request){
		Map<String,Object> map=super.getWebParams(request);
		admin ad=adminservice.validateNamePwd(map);
		if(ad!=null){
			HttpSession session=request.getSession();
			session.setAttribute("loginUser", ad);
			return "success";
		}else{
			return "usererror";
		}
	}
	@RequestMapping(method=RequestMethod.GET,value="/index")
	public String getIndex(){	
		return "app/index";	
	}
	@RequestMapping(method=RequestMethod.GET,value="/main")
	public String getMain(){
		return "app/main";	
	}

}
