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
public class TeamMember {
    private Team team_id;
    private User user_id;
    private boolean is_leader;
    private boolean is_active;
    private int created_by;
    private Date created_at;
    private int modified_by;
    private Date modified_at;

    public TeamMember(Team team_id, User user_id, boolean is_leader, boolean is_active, int created_by, Date created_at, int modified_by, Date modified_at) {
        this.team_id = team_id;
        this.user_id = user_id;
        this.is_leader = is_leader;
        this.is_active = is_active;
        this.created_by = created_by;
        this.created_at = created_at;
        this.modified_by = modified_by;
        this.modified_at = modified_at;
    }

    public TeamMember(Team team_id, User user_id, boolean is_leader, boolean is_active) {
        this.team_id = team_id;
        this.user_id = user_id;
        this.is_leader = is_leader;
        this.is_active = is_active;
    }

    
    
    public TeamMember() {
    }

    public Team getTeam_id() {
        return team_id;
    }

    public void setTeam_id(Team team_id) {
        this.team_id = team_id;
    }

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    public boolean isIs_leader() {
        return is_leader;
    }

    public void setIs_leader(boolean is_leader) {
        this.is_leader = is_leader;
    }

    public boolean isIs_active() {
        return is_active;
    }

    public void setIs_active(boolean is_active) {
        this.is_active = is_active;
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
        return "TeamMember{" + "team_id=" + team_id + ", user_id=" + user_id + ", is_leader=" + is_leader + ", is_active=" + is_active + ", created_by=" + created_by + ", created_at=" + created_at + ", modified_by=" + modified_by + ", modified_at=" + modified_at + '}';
    }
    
    
}
