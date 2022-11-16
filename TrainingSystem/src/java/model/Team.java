/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author trung
 */
public class Team {
    private int team_id;
    private Class class_id;
    private String team_code;
    private String topic_name;
    private Boolean status;
    private String description;
    private ArrayList<User> team_member;

    public Team() {
    }

    public Team(int team_id, Class class_id, String team_code, String topic_name, Boolean status, String description) {
        this.team_id = team_id;
        this.class_id = class_id;
        this.team_code = team_code;
        this.topic_name = topic_name;
        this.status = status;
        this.description = description;
    }

    public Team(Class class_id, String team_code, String topic_name, Boolean status, String description) {
        this.class_id = class_id;
        this.team_code = team_code;
        this.topic_name = topic_name;
        this.status = status;
        this.description = description;
    }
    
    

    public int getTeam_id() {
        return team_id;
    }

    public void setTeam_id(int team_id) {
        this.team_id = team_id;
    }

    public Class getClass_id() {
        return class_id;
    }

    public void setClass_id(Class class_id) {
        this.class_id = class_id;
    }

    public String getTeam_code() {
        return team_code;
    }

    public void setTeam_code(String team_code) {
        this.team_code = team_code;
    }

    public String getTopic_name() {
        return topic_name;
    }

    public void setTopic_name(String topic_name) {
        this.topic_name = topic_name;
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

    public ArrayList<User> getTeam_member() {
        return team_member;
    }

    public void setTeam_member(ArrayList<User> team_member) {
        this.team_member = team_member;
    }

    @Override
    public String toString() {
        return "Team{" + "team_id=" + team_id + ", class_id=" + class_id + ", team_code=" + team_code + ", topic_name=" + topic_name + ", status=" + status + ", description=" + description + ", team_member=" + team_member + '}';
    }
}
