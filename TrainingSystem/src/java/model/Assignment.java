/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
public class Assignment {
    private int ass_id;
    private Subject subject_id;
    private String title, Subject_name;
    private String ass_body;
    private int eval_weight;
    private Boolean is_team_work;
    private Boolean is_ongoing;
    private Boolean status;
    
    public int getAss_id() {
        return ass_id;
    }

    public Assignment(int ass_id, Subject subject_id, String title, String Subject_name, String ass_body, int eval_weight, Boolean is_team_work, Boolean is_ongoing, Boolean status) {
        this.ass_id = ass_id;
        this.subject_id = subject_id;
        this.title = title;
        this.Subject_name = Subject_name;
        this.ass_body = ass_body;
        this.eval_weight = eval_weight;
        this.is_team_work = is_team_work;
        this.is_ongoing = is_ongoing;
        this.status = status;
    }
    
    public void setAss_id(int ass_id) {
        this.ass_id = ass_id;
    }

    public Subject getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(Subject subject_id) {
        this.subject_id = subject_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAss_body() {
        return ass_body;
    }

    public void setAss_body(String ass_body) {
        this.ass_body = ass_body;
    }

    public int getEval_weight() {
        return eval_weight;
    }

    public void setEval_weight(int eval_weight) {
        this.eval_weight = eval_weight;
    }

    public Boolean getIs_team_work() {
        return is_team_work;
    }

    public void setIs_team_work(Boolean is_team_work) {
        this.is_team_work = is_team_work;
    }

    public Boolean getIs_ongoing() {
        return is_ongoing;
    }

    public void setIs_ongoing(Boolean is_ongoing) {
        this.is_ongoing = is_ongoing;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getSubject_name() {
        return Subject_name;
    }

    public void setSubject_name(String Subject_name) {
        this.Subject_name = Subject_name;
    }

    public Assignment() {
    }
    
    
}
