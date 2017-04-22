package net.app.service.impl;


import net.app.dao.MybatisDao;
import net.app.po.CFile;
import net.app.po.CPort;
import net.app.po.Page;
import net.app.service.PortService;
import net.app.util.HdUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.util.JSONPObject;

import jdk.nashorn.internal.parser.JSONParser;
import jdk.nashorn.internal.runtime.JSONFunctions;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional(readOnly = false)
public class PortServiceImp implements PortService {

	@Autowired	
	 MybatisDao dao;

    @Override
    public Page getListForPage(Map<String, Object> params, int page, int rows) {
        Page p = dao.getListByPage("port.select", params, page, rows);
        return p;
    }

    @Override
    public Page getListForPage(Map<String, Object> params, Page page) {
        Page p = dao.getListByPage("port.query", params, page);
        return p;
    }

    @Override
    public void save(CPort cPort) {
        dao.save("port.insert", cPort);
    }

    @Override
    public void update(CPort cPort) {
        dao.update("port.update", cPort);
    }

    @Override
    public void delete(int id) {
        dao.delete("port.delete", id);
    }

    @Override
    public CPort getById(int id) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        return dao.get("port.selectByPrimaryKey", map);
    }

    @Override
    public List getPortList() {
        return dao.getList("port.getPortList");
    }

    @Override
    @Transactional
    public String uploadLogo(CPort port, MultipartFile file, String dir, String userName) {
        try {
            if (port.getPort_img_id() != 0) {// 码头logo已存在
                Map<String, Object> map = new HashMap<>();
                map.put("id", port.getPort_img_id());
                // 获取之前上传的logo
                CFile oldFile = dao.get("file.selectByPrimaryKey", map);
                if (oldFile != null) {
                    // 删除之前上传的logo图片
                    File uploadFile = new File(oldFile.getFile_path());
                    if (uploadFile.exists()) {
                        uploadFile.delete();
                    }
                    dao.delete("file.delete", port.getPort_img_id());
                } else {
                    return "oldFileError";
                }
            }
            String fileName = file.getOriginalFilename();//得到上传时的文件名
            System.out.println(44444);
            System.out.println(fileName);
            String[] fNames = fileName.split("\\.");
            String saveFileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + "." + fNames[fNames.length - 1];
            FileUtils.writeByteArrayToFile(new File(dir, saveFileName), file.getBytes());
            Date currDate = new Date();
            CFile cFile = new CFile();
            cFile.setCreate_time(currDate);
            cFile.setCreate_user(userName);
            cFile.setUpdate_time(currDate);
            cFile.setUpdate_user(userName);
            cFile.setFile_name(fileName);
            cFile.setFile_path(dir + "/" + saveFileName);
            cFile.setSave_file_name(saveFileName);
            // 保存上传的文件
            dao.save("file.insert", cFile);
            // 更新码头logo
            port.setPort_img_id(cFile.getId());
            dao.update("port.update", port);
            return "success;" + saveFileName;
        } catch (Exception e) {
            return "uploadError";
        }
    }

    @Override
    public String uploadYard(CPort port, MultipartFile file, String dir, String userName) {
        try{
            if(port.getYard_img_id()!=0){// 堆场图片已存在
                Map<String,Object> map=new HashMap<>();
                map.put("id",port.getYard_img_id());
                // 获取之前上传的堆场图片
                CFile oldFile=dao.get("file.selectByPrimaryKey",map);
                if(oldFile!=null){
                    // 删除之前上传的堆场图片
                    File uploadFile = new File(oldFile.getFile_path());
                    if(uploadFile.exists()){
                        uploadFile.delete();
                    }
                    dao.delete("file.delete",port.getYard_img_id());
                }else{
                    return "oldFileError";
                }
            }
            String fileName = file.getOriginalFilename();
            String[] fNames = fileName.split("\\.");
            String saveFileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + "." + fNames[fNames.length - 1];
            FileUtils.writeByteArrayToFile(new File(dir, saveFileName), file.getBytes());
            Date currDate = new Date();
            String fileId = HdUtil.generateUUIDByOracle();
            CFile cFile = new CFile();
            cFile.setCreate_time(currDate);
            cFile.setCreate_user(userName);
            cFile.setUpdate_time(currDate);
            cFile.setUpdate_user(userName);
            cFile.setFile_name(fileName);
            cFile.setFile_path(dir + "/" + saveFileName);
            cFile.setSave_file_name(saveFileName);
            // 保存上传的文件
            dao.save("file.insert", cFile);
            // 更新码头堆场图片
            port.setYard_img_id(cFile.getId());
            dao.update("port.update", port);
            return "success;" + saveFileName;
        }catch(Exception e){

        }
        return "uploadError";
    }

    @Override
    public String getLogoUrl(int portId) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", portId);
        List list = dao.getList("port.getLogoUrl", map);
        if (list != null && list.size() > 0) {
            return list.get(0) + "";
        } else {
            return "";
        }
    }
    @Override
    public String getYardUrl(String portId) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", portId);
        List list = dao.getList("port.getYardUrl", map);
        if (list != null && list.size() > 0) {
            return list.get(0) + "";
        } else {
            return "";
        }
    }
public static void main(String[] args) {
	String s=JSONParser.quote("liu;2");
	System.out.println(JSONFunctions.quote("liu;2"));
	System.out.println(s);
	System.out.println("liu:12");
}
}
