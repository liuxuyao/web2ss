package net.app.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.app.dao.MybatisDao;
import net.app.po.CFile;
import net.app.po.Page;
import net.app.service.FileService;

import java.util.HashMap;
import java.util.Map;

@Service
@Transactional(readOnly = false)
public class FileServiceImp implements FileService {

    @Autowired
    private MybatisDao dao;


    @Override
    public Page getListForPage(Map<String, Object> params, int page, int rows) {
        Page p = dao.getListByPage("file.select", params, page, rows);
        return p;
    }


    @Override
    public void save(CFile cFile) {
        dao.save("file.insert", cFile);

    }

    @Override
    public void update(CFile cFile) {
        dao.update("file.update", cFile);
    }


    @Override
    public void delete(String id) {
        dao.delete("file.delete", id);
    }


    @Override
    public CFile getById(String id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", id);
        return dao.get("file.selectByPrimaryKey", map);
    }

    @Override
    public Page getListForPage(Map<String, Object> params, Page page) {
        Page p = dao.getListByPage("file.select", params, page);
        return p;
    }
}
