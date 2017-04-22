package net.app.service;



import java.util.Map;

import net.app.po.CFile;
import net.app.po.Page;

public interface FileService {

    public abstract Page getListForPage(Map<String, Object> params, int page, int rows);

    public abstract Page getListForPage(Map<String, Object> params, Page page);

    public abstract void save(CFile cFile);

    public abstract void update(CFile cFile);

    public abstract void delete(String id);

    public abstract CFile getById(String id);

}