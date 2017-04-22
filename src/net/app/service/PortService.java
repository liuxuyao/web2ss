package net.app.service;



import org.springframework.web.multipart.MultipartFile;

import net.app.po.CPort;
import net.app.po.Page;

import java.util.*;


public interface PortService {

    public abstract Page getListForPage(Map<String, Object> params, int page, int rows);

    public abstract Page getListForPage(Map<String, Object> params, Page page);

    public abstract void save(CPort cPort);

    public abstract void update(CPort cPort);

    public abstract void delete(int id);

    public abstract CPort getById(int id);

    public abstract List getPortList();

    public abstract String uploadLogo(CPort port, MultipartFile file, String dir, String userName)
            ;
    public abstract String uploadYard(CPort port, MultipartFile file, String dir, String userName);

    public abstract String getLogoUrl(int portId);

    public String getYardUrl(String portId);
}