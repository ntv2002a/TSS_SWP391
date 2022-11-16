/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author duyng
 */
public class SubjectSetting extends Setting {
    Subject subject;

    public SubjectSetting() {
    }

    public SubjectSetting(int setting_id, Setting type_id, String setting_title, String setting_value, String display_order, boolean status, String description, Subject subject) {
        super(setting_id, type_id, setting_title, setting_value, display_order, status, description);
        this.subject = subject;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }
    
    public int getSettingValueInt() {
        return Integer.parseInt(this.getSetting_value());
    }
    
    public double getSettingValueDouble() {
        return Double.parseDouble(this.getSetting_value());
    }

    @Override
    public String toString() {
        return super.toString() + "SubjectSetting{" + "subject=" + subject + '}';
    }
    
}
