package net.app.controller;


import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;

import net.app.dao.MybatisDao;
import net.app.po.CPort;
import net.app.po.Page;
import net.app.po.User;
import net.app.po.admin;
import net.app.service.FileService;
import net.app.service.PortService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSpinnerUI;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping(value = "/port")
public class PortController extends BaseController {
    @Resource
    private PortService portService;
    @Resource
    private FileService fileService;

    @Resource
    private MybatisDao dao;
    /**
     * 页面跳转 新打开页面时
     *
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET, value = "/forList")
    public String list(Model model) {
        return "/system/port/port_list";
    }

    /**
     * 查询返回json
     *
     * @param model
     * @param request
     * @param page
     * @return
     */
    @RequestMapping(method = RequestMethod.POST, value = "/query")
    @ResponseBody
    public Page query(Model model, HttpServletRequest request, Page page) {
        Map<String, Object> params = super.getWebParams(request);
        return portService.getListForPage(params, page);
    }

    /**
     * 新增时用于页面跳转到添加页面
     *
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET, value = "/addPage")
    public String forAdd(Model model) {
        model.addAttribute("method", "save");
        return "/system/port/port_edit";
    }

    /**
     * 保存
     *
     * @param model
     * @param cPort
     * @return
     */
    @SuppressWarnings("null")
	@RequestMapping(method = RequestMethod.POST, value = "/save")
    @ResponseBody
    public String save(Model model,HttpServletRequest request, CPort cPort) {
    	HttpSession session=request.getSession();
        admin admin = (admin) session.getAttribute("loginUser");
        System.out.println(admin);
        Date currDate = new Date();
        int id=cPort.getId();
        if (id==0) {
            // 添加
                cPort.setCreate_user(admin.getAdminname());
                cPort.setCreate_time(currDate);
                cPort.setUpdate_user(admin.getAdminname());
                cPort.setUpdate_time(currDate);
                this.portService.save(cPort);
            } else {// 修改
                cPort.setUpdate_user(admin.getAdminname());
                cPort.setUpdate_time(currDate);
                this.portService.update(cPort);
            }
            model.addAttribute("cPort", cPort);
            System.out.println(222222);
            System.out.println(cPort.getC_port_nam());
            System.out.println(cPort.getId());
            return "success";
        }
    

    /**
     * 编辑时的，跳转方法，跳转到编辑页面
     *
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(method = RequestMethod.GET, value = "/update/{id}")
    public String forUpdate(Model model, @PathVariable("id") int id) {
        CPort cPort = portService.getById(id);
        model.addAttribute("cPort", cPort);
        model.addAttribute("method", "update");
        return "/system/port/port_edit";
    }

    /**
     * 编辑方法，提交update数据，跳转到查看页面
     *
     * @param model
     * @param cPort
     * @return
     */
    @RequestMapping(method = RequestMethod.POST, value = "/update")
    @ResponseBody
    public String update(Model model, CPort cPort) {
        this.portService.update(cPort);
        System.out.println(111111);
        System.out.println(cPort.getId());
        return "success";
    }

    /**
     * 删除方法
     *
     * @param id
     * @return
     */
    @RequestMapping(method = RequestMethod.GET, value = "/delete/{id}")
    @ResponseBody
    public String delete(@PathVariable("id") int id) {
        this.portService.delete(id);
        return "success";
    }

    /**
     * 跳转到LOGO图片上传页面
     *
     * @param model
     * @param portId
     * @return
     */
    @RequestMapping(method = RequestMethod.GET, value = "/upload/{portId}")
    public String forupload(Model model, @PathVariable("portId") int portId) {
    	System.out.println(33333);
    	System.out.println(portId);
        model.addAttribute("method", "upload");
        model.addAttribute("portId", portId);
        if (portId!=0) {
            String logoUrl = portService.getLogoUrl(portId);
            model.addAttribute("logoUrl", logoUrl);
        }
        return "system/port/port_logo";
    }
    /**
     * 跳转到堆场图片上传页面
     *
     * @param model
     * @param portId
     * @return
     */
    @RequestMapping(method = RequestMethod.GET, value = "/uploadYard/{portId}")
    public String foruploadYard(Model model, @PathVariable("portId") String portId) {
        model.addAttribute("method", "upload");
        model.addAttribute("portId", portId);
        if (StringUtils.isNotEmpty(portId)) {
            String YardUrl = portService.getYardUrl(portId);
            System.out.print(YardUrl);
            model.addAttribute("YardUrl", YardUrl);
        }
        return "system/port/port_yard";
    }

    /**
     * 跳转到堆场图片查看页面
     *
     * @param model
     * @param portId
     * @return
     */
    @RequestMapping(method = RequestMethod.GET, value = "/uploadYardLook/{portId}")
    public String uploadYardLook(Model model, @PathVariable("portId") String portId) {
        model.addAttribute("method", "upload");
        model.addAttribute("portId", portId);
        if (StringUtils.isNotEmpty(portId)) {
            String YardUrl = portService.getYardUrl(portId);
            model.addAttribute("YardUrl", YardUrl);
        }
        return "system/port/port_yardLook";
    }
    /**
     * 上传LoGo图片
     *
     * @param file
     * @param request
     * @return
     * @throws IOException 
     * @throws IllegalStateException 
     */
    @RequestMapping(method = RequestMethod.POST, value = "/uploadLogo")
    @ResponseBody
    public String uploadLogo(@RequestParam("inputFile") MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException {
    	HttpSession session=request.getSession();
        admin admin = (admin) session.getAttribute("loginUser");
        String portId = request.getParameter("portId").toString();
        int portId1=Integer.parseInt(portId);
        CPort port = portService.getById(portId1);//获取选择的码头
        if (port != null) {// 存在码头
            if (!file.isEmpty()) {// 上传文件是否为空
                String dir = "D:\\Program Files\\apache-tomcat-7.0.63-for-eclipse\\ss\\upfile\\";//request.getSession().getServletContext().getRealPath("/upfile");
                System.out.println(555555);
                System.out.println(dir);
                File dirFile = new File(dir);
                if (!dirFile.isDirectory()) {// 如果上传路径不存在，创建
                    dirFile.mkdirs();
                }
                // 上传logo
//                file.transferTo(dirFile);
                String s=portService.uploadLogo(port, file, dir,admin.getAdminname());
                ObjectMapper om=new ObjectMapper();
                s=om.writeValueAsString(s);
                System.out.println(s+"=======================");
                return s;
            } else {
                return "fileError";
            }
        } else {
            return "portError";
        }
    }
    /**
     * 上传堆场图片
     *
     * @param file
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST, value = "/uploadYard")
    @ResponseBody
    public String uploadYard(@RequestParam("inputFile") MultipartFile file, HttpServletRequest request) {
        User user =new User();
        String portId = request.getParameter("portId").toString();
        int portId1=Integer.parseInt(portId);
        CPort port = portService.getById(portId1);//获取选择的码头
        if (port != null) {// 存在码头
            if (!file.isEmpty()) {// 上传文件是否为空
                String dir = "D:\\Program Files\\apache-tomcat-7.0.63-for-eclipse\\ss\\upfile";//request.getSession().getServletContext().getRealPath("/upfile");
                File dirFile = new File(dir);
                if (!dirFile.isDirectory()) {// 如果上传路径不存在，创建
                    dirFile.mkdirs();
                }
                // 上传堆场图片
                return portService.uploadYard(port, file, dir, user.getUsername());
            } else {
                return "fileError";
            }
        } else {
            return "portError";
        }
    }
}
