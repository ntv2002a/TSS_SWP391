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
public class ClassUser {
    private User user_id;
    private Class class_id;
    private boolean status;
    private Date dropout_date;
    private int ongoing_eval;
    private int final_eval;
    private int topic_eval;

    public ClassUser() {
    }

    public ClassUser(User user_id, Class class_id, boolean status, Date dropout_date, int ongoing_eval, int final_eval, int topic_eval) {
        this.user_id = user_id;
        this.class_id = class_id;
        this.status = status;
        this.dropout_date = dropout_date;
        this.ongoing_eval = ongoing_eval;
        this.final_eval = final_eval;
        this.topic_eval = topic_eval;
    }

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    public Class getClass_id() {
        return class_id;
    }

    public void setClass_id(Class class_id) {
        this.class_id = class_id;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getDropout_date() {
        return dropout_date;
    }

    public void setDropout_date(Date dropout_date) {
        this.dropout_date = dropout_date;
    }

    public int getOngoing_eval() {
        return ongoing_eval;
    }

    public void setOngoing_eval(int ongoing_eval) {
        this.ongoing_eval = ongoing_eval;
    }

    public int getFinal_eval() {
        return final_eval;
    }

    public void setFinal_eval(int final_eval) {
        this.final_eval = final_eval;
    }

    public int getTopic_eval() {
        return topic_eval;
    }

    public void setTopic_eval(int topic_eval) {
        this.topic_eval = topic_eval;
    }

    @Override
    public String toString() {
        return "ClassUser{" + "user_id=" + user_id + ", class_id=" + class_id + ", status=" + status + ", dropout_date=" + dropout_date + ", ongoing_eval=" + ongoing_eval + ", final_eval=" + final_eval + ", topic_eval=" + topic_eval + '}';
    }
    
    
}
