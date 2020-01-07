package com.lds.tpms.pojo;

import java.io.Serializable;
import java.util.List;

public class Menu implements Serializable {
    private int id;
    private String text;
    private int pid;
    private String url;
    private List<Menu> children;

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", pid=" + pid +
                ", url='" + url + '\'' +
                ", children=" + children +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public List<Menu> getChildren() {
        return children;
    }

    public void setChildren(List<Menu> children) {
        this.children = children;
    }

    public Menu(int id, String text, int pid, String url, List<Menu> children) {
        this.id = id;
        this.text = text;
        this.pid = pid;
        this.url = url;
        this.children = children;
    }

    public Menu() {
    }
}
