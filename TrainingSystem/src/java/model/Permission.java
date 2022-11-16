/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
public class Permission {
    private int screen_id;
    private int role_id;
    private String url;
    private Boolean get_all_data;
    private Boolean can_delete;
    private Boolean can_add;
    private Boolean can_edit;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getScreen_id() {
        return screen_id;
    }

    public void setScreen_id(int screend_id) {
        this.screen_id = screend_id;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int setting_id) {
        this.role_id = setting_id;
    }

    public Boolean getGet_all_data() {
        return get_all_data;
    }

    public void setGet_all_data(Boolean get_all_data) {
        this.get_all_data = get_all_data;
    }

    public Boolean getCan_delete() {
        return can_delete;
    }

    public void setCan_delete(Boolean can_delete) {
        this.can_delete = can_delete;
    }

    public Boolean getCan_add() {
        return can_add;
    }

    public void setCan_add(Boolean can_add) {
        this.can_add = can_add;
    }

    public Boolean getCan_edit() {
        return can_edit;
    }

    public void setCan_edit(Boolean can_edit) {
        this.can_edit = can_edit;
    }
    
    
}
