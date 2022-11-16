/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Lenovo
 */
public class Setting {

    private int setting_id;
    private Setting type_id;
    private String setting_title;
    private String setting_value;
    private String display_order;
    private Boolean status;
    private String description;

    public Setting() {
    }

    public Setting(int setting_id, Setting type_id, String setting_title, String setting_value, String display_order, boolean status, String description) {
        this.setting_id = setting_id;
        this.type_id = type_id;
        this.setting_title = setting_title;
        this.setting_value = setting_value;
        this.display_order = display_order;
        this.status = status;
        this.description = description;
    }


    public int getSetting_id() {
        return setting_id;
    }

    public void setSetting_id(int setting_id) {
        this.setting_id = setting_id;
    }

    public Setting getType_id() {
        return type_id;
    }

    public void setType_id(Setting type_id) {
        this.type_id = type_id;
    }

    public String getSetting_title() {
        return setting_title;
    }

    public void setSetting_title(String setting_title) {
        this.setting_title = setting_title;
    }

    public String getSetting_value() {
        return setting_value;
    }

    public void setSetting_value(String setting_value) {
        this.setting_value = setting_value;
    }

    public String getDisplay_order() {
        return display_order;
    }

    public void setDisplay_order(String diplay_order) {
        this.display_order = diplay_order;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    @Override
    public String toString() {
        return "Setting{" + "setting_id=" + setting_id + ", type_id=" + type_id + ", setting_title=" + setting_title + ", setting_value=" + setting_value + ", display_order=" + display_order + ", status=" + status + ", description=" + description + '}';
    }
    
}
