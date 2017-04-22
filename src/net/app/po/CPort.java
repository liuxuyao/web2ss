package net.app.po;

import java.io.Serializable;
import java.util.Date;

public class CPort implements Serializable {

    private static final long serialVersionUID = 1L;

    private String update_user;
    private Date update_time;
    private int port_img_id;
    private int yard_img_id;
    private int id;
    private String port_cod;
    private String c_port_nam;
    private String e_port_nam;
    private String create_user;
    private Date create_time;

    public String getUpdate_user() {
        return this.update_user;
    }

    public void setUpdate_user(String updateUser) {
        this.update_user = updateUser;
    }

    public Date getUpdate_time() {
        return this.update_time;
    }

    public void setUpdate_time(Date updateTime) {
        this.update_time = updateTime;
    }

    public int getPort_img_id() {
        return this.port_img_id;
    }

    public void setPort_img_id(int portImgId) {
        this.port_img_id = portImgId;
    }

    public int getYard_img_id() {
        return this.yard_img_id;
    }

    public void setYard_img_id(int yardImgId) {
        this.yard_img_id = yardImgId;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPort_cod() {
        return this.port_cod;
    }

    public void setPort_cod(String portCod) {
        this.port_cod = portCod;
    }

    public String getC_port_nam() {
        return this.c_port_nam;
    }

    public void setC_port_nam(String cPortNam) {
        this.c_port_nam = cPortNam;
    }

    public String getE_port_nam() {
        return this.e_port_nam;
    }

    public void setE_port_nam(String ePortNam) {
        this.e_port_nam = ePortNam;
    }

    public String getCreate_user() {
        return this.create_user;
    }

    public void setCreate_user(String createUser) {
        this.create_user = createUser;
    }

    public Date getCreate_time() {
        return this.create_time;
    }

    public void setCreate_time(Date createTime) {
        this.create_time = createTime;
    }
}