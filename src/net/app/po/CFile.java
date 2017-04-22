package net.app.po;

import java.io.Serializable;
import java.util.Date;

public class CFile implements Serializable {

    private static final long serialVersionUID = 1L;

    private int id;
    private String file_name;
    private String file_path;
    private String create_user;
    private Date create_time;
    private String update_user;
    private Date update_time;
    private String save_file_name;

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFile_name() {
        return this.file_name;
    }

    public void setFile_name(String fileName) {
        this.file_name = fileName;
    }

    public String getFile_path() {
        return this.file_path;
    }

    public void setFile_path(String filePath) {
        this.file_path = filePath;
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

    public String getSave_file_name() {
        return save_file_name;
    }

    public void setSave_file_name(String save_file_name) {
        this.save_file_name = save_file_name;
    }
}