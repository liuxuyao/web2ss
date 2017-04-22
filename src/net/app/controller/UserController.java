
	package net.app.controller;
	import net.app.po.Page;
	import net.app.po.User;
	import net.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.*;

	import javax.annotation.Resource;
	import javax.servlet.http.HttpServletRequest;
	import java.util.Date;
	import java.util.Map;

	/**
	 * @author wangsong
	 * @Title 用户管理
	 * @Package net.huadong.system.user.controller
	 * @ClassName: UserController
	 * @Description: TODO(这里用一句话描述这个类的作用)
	 * @date 2016年3月10日 下午3:34:24
	 * @verson
	 */
	@Controller
	@RequestMapping(value = "/user")
	public class UserController extends BaseController {
	    @Autowired
	    private UserService userService;

	    /**
	     * 跳转列表页
	     *
	     * @param model
	     * @param request
	     * @return
	     */
	    //@RequiresPermissions("system:user:view")
	    @RequestMapping(method = RequestMethod.GET, value = "/list")
	    public String forList(Model model, HttpServletRequest request) {
	        return "system/user/user_list";
	    }

	    /**
	     * 查询返回json
	     *
	     * @param model
	     * @param request
	     * @param page
	     * @return
	     */
	    @RequestMapping(method = RequestMethod.POST, value = "/list")
	    @ResponseBody
	    public Page list(Model model, HttpServletRequest request, Page page) {
	        Map<String, Object> params = super.getWebParams(request);
	        return userService.getListForPage(params, page);
	    }

	    /**
	     * 跳转新增页面
	     *
	     * @param model
	     * @return
	     */
	    @RequestMapping(method = RequestMethod.GET, value = "/add")
	    public String forAdd(Model model) {
	        model.addAttribute("method", "add");
	        return "system/user/user_edit";
	    }

	    /**
	     * 新增保存
	     *
	     * @param model
	     * @param user
	     * @return
	     */
	    @RequestMapping(method = RequestMethod.POST, value = "/add")
	    public String add(Model model, User user) {
	       // user.setPassword(new Md5Hash(user.getPassword()).toString());
	        user.setCreatetime(new Date());
	        this.userService.save(user);
	        model.addAttribute("user", user);
	        return "system/user/user_view";
	    }

	    /**
	     * 跳转修改页面
	     *
	     * @param model
	     * @param id
	     * @return
	     */
	    @RequestMapping(method = RequestMethod.GET, value = "/update/{id}")
	    public String forUpdate(Model model, @PathVariable("id") String id) {
	        model.addAttribute("user", this.userService.getById(id));
	        model.addAttribute("method", "update");
	        return "/system/user/user_edit";
	    }

	    /**
	     * 修改
	     *
	     * @param model
	     * @param user
	     * @return
	     */
	    @RequestMapping(method = RequestMethod.POST, value = "/update")
	    public String update(Model model, User user) {
	        this.userService.update(user);
	        model.addAttribute("user", user);
	        return "/system/user/user_view";
	    }

	    /**
	     * 查看
	     *
	     * @param model
	     * @param id
	     * @return
	     */
	    @RequestMapping(method = RequestMethod.GET, value = "/get/{id}")
	    public String view(Model model, @PathVariable("id") String id) {
	        User user = this.userService.getById(id);
	        model.addAttribute("user", user);
	        return "/system/user/user_view";
	    }

	    /**
	     * 删除
	     *
	     * @param id
	     * @return
	     */
	    @RequestMapping(method = RequestMethod.GET, value = "/delete/{id}")
	    @ResponseBody
	    public String forUpdate(@PathVariable("id") String id) {
	        this.userService.delete(id);
	        return "success";
	    }

	    /**
	     * 个人密码修改
	     *
	     * @param model
	     * @param request
	     * @return
	     */
	    @RequestMapping(method = RequestMethod.GET, value = "/forPassword")
	    public String forPasword(Model model, HttpServletRequest request) {
	        return "/system/user/user_password";
	    }

	    /**
	     * 个人密码修改
	     *
	     * @param model
	     * @param request
	     * @return
	     */
	    @RequestMapping(method = RequestMethod.POST, value = "/savePassword")
	    public String savePasword(Model model, @RequestParam("old_password") String old_password, @RequestParam("new_password") String new_password) {

	        User session_user =new User();

	        User user = this.userService.getById(session_user.getId());
			return new_password;

	     //   String md5_old_psw = new Md5Hash(old_password).toString();

	      /*  if (user.getPassword().equals(md5_old_psw)) {
	            User newUser = new User();
	            newUser.setPassword(new Md5Hash(new_password).toString());
	            newUser.setId(user.getId());
	            this.userService.update(newUser);
	            model.addAttribute("message", "修改成功！");
	            return "/jsp/system/user/user_password";
	        } else {
	            model.addAttribute("message", "旧密码不正确，修改失败！");
	            return "/system/user/user_password";
	        }*/
	    }
	}


