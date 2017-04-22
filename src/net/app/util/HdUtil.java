package net.app.util;

import net.app.dao.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

/**
 * Created by wuph on 2016-7-21.
 * Description
 */
@Service
public class HdUtil {

    private static MybatisDao dao;

    public MybatisDao getDao() {
        return dao;
    }

    @Autowired
    public void setDao(MybatisDao dao) {
        HdUtil.dao = dao;
    }

    /**
     * 获取访问IP地址
     *
     * @param request
     * @return
     */
    public static String getRemortIP(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;
    }

    /**
     * 生成32位UUID主键
     *
     * @return
     */
    public static String generateUUIDByOracle() {
        return dao.get("hdutils.getUUID", null);
    }

    /**
     * 校验系统代码
     *
     * @param sysCod
     * @return
     */
    public static boolean validateSysCod(String sysCod) {
        if (StringUtils.isEmpty(sysCod)) {
            return false;
        } else {
            int i = dao.get("hdutils.validateSysCod", sysCod);
            if (i == 1) {
                return true;
            } else {
                return false;
            }
        }
    }

    public static void fileIsExit(String filePath) {
        File file = new File(filePath);
        if (!file.exists()) {
            file.mkdirs();
        }
    }
}
