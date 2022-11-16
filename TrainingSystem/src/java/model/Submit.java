/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author trung
 */
public class Submit {
    private int submit_id;
    private Milestone milestone_id;
    private Class class_id;
    private Team team_id;
    private String submit_file_url;
    private Date submit_time;
    private Boolean status;
    private User user_id;
    private int created_by;
    private Date created_at;
    private int modified_by;
    private Date modified_at;

    public Submit() {
    }

    public Submit(int submit_id, Milestone milestone_id, Class class_id, Team team_id, String submit_file_url, Date submit_time, Boolean status, User user_id, int created_by, Date created_at, int modified_by, Date modified_at) {
        this.submit_id = submit_id;
        this.milestone_id = milestone_id;
        this.class_id = class_id;
        this.team_id = team_id;
        this.submit_file_url = submit_file_url;
        this.submit_time = submit_time;
        this.status = status;
        this.user_id = user_id;
        this.created_by = created_by;
        this.created_at = created_at;
        this.modified_by = modified_by;
        this.modified_at = modified_at;
    }

    public Submit(Milestone milestone_id, Class class_id, Team team_id, User user_id) {
        this.milestone_id = milestone_id;
        this.class_id = class_id;
        this.team_id = team_id;
        this.user_id = user_id;
    }
    
    

    public int getSubmit_id() {
        return submit_id;
    }

    public void setSubmit_id(int submit_id) {
        this.submit_id = submit_id;
    }

    public Milestone getMilestone_id() {
        return milestone_id;
    }

    public void setMilestone_id(Milestone milestone_id) {
        this.milestone_id = milestone_id;
    }

    public Class getClass_id() {
        return class_id;
    }

    public void setClass_id(Class class_id) {
        this.class_id = class_id;
    }

    public Team getTeam_id() {
        return team_id;
    }

    public void setTeam_id(Team team_id) {
        this.team_id = team_id;
    }

    public String getSubmit_file_url() {
        return submit_file_url;
    }

    public void setSubmit_file_url(String submit_file_url) {
        this.submit_file_url = submit_file_url;
    }

    public Date getSubmit_time() {
        return submit_time;
    }

    public void setSubmit_time(Date submit_time) {
        this.submit_time = submit_time;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public int getModified_by() {
        return modified_by;
    }

    public void setModified_by(int modified_by) {
        this.modified_by = modified_by;
    }

    public Date getModified_at() {
        return modified_at;
    }

    public void setModified_at(Date modified_at) {
        this.modified_at = modified_at;
    }

    @Override
    public String toString() {
        return "Submit{" + "submit_id=" + submit_id + ", milestone_id=" + milestone_id + ", class_id=" + class_id + ", team_id=" + team_id + ", submit_file_url=" + submit_file_url + ", submit_time=" + submit_time + ", status=" + status + ", user_id=" + user_id + ", created_by=" + created_by + ", created_at=" + created_at + ", modified_by=" + modified_by + ", modified_at=" + modified_at + '}';
    }
    
    
}
