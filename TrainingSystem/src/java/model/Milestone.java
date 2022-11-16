/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Lenovo
 */
public class Milestone {
    private int id;
    private Assignment ass;
    private Class class_milestone;
    private Date from_date;
    private Date to_date;
    private String title;
    private String body;
    private String description;
    private int status;

    public Milestone() {
    }

    public Milestone(int id, Assignment ass, Class class_milestone, Date from_date, Date to_date, String title, String body, String description, int status) {
        this.id = id;
        this.ass = ass;
        this.class_milestone = class_milestone;
        this.from_date = from_date;
        this.to_date = to_date;
        this.title = title;
        this.body = body;
        this.description = description;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Assignment getAss() {
        return ass;
    }

    public void setAss(Assignment ass) {
        this.ass = ass;
    }

    public Class getClass_milestone() {
        return class_milestone;
    }

    public void setClass_milestone(Class class_milestone) {
        this.class_milestone = class_milestone;
    }

    public Date getFrom_date() {
        return from_date;
    }

    public void setFrom_date(Date from_date) {
        this.from_date = from_date;
    }

    public Date getTo_date() {
        return to_date;
    }

    public void setTo_date(Date to_date) {
        this.to_date = to_date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Milestone{" + "id=" + id + ", ass=" + ass + ", class_milestone=" + class_milestone + ", from_date=" + from_date + ", to_date=" + to_date + ", title=" + title + ", body=" + body + ", description=" + description + ", status=" + status + '}';
    }

    public void setFrom_date(String startDate) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
    
}
