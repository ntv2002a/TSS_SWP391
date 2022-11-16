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
public class Trainee {
    private User userId;
    private Class classId;
    private int status;
    private String note;
    private int ongoing_eval;
    private int final_eval;
    private int topic_eval;
    private Date dropout_date;

    public Trainee() {
    }

    public Trainee(User userId, Class classId, int status, String note, int ongoing_eval, int final_eval, int topic_eval, Date dropout_date) {
        this.userId = userId;
        this.classId = classId;
        this.status = status;
        this.note = note;
        this.ongoing_eval = ongoing_eval;
        this.final_eval = final_eval;
        this.topic_eval = topic_eval;
        this.dropout_date = dropout_date;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Class getClassId() {
        return classId;
    }

    public void setClassId(Class classId) {
        this.classId = classId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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

    public Date getDropout_date() {
        return dropout_date;
    }

    public void setDropout_date(Date dropout_date) {
        this.dropout_date = dropout_date;
    }

    @Override
    public String toString() {
        return "Trainee{" + "userId=" + userId + ", classId=" + classId + ", status=" + status + ", note=" + note + ", ongoing_eval=" + ongoing_eval + ", final_eval=" + final_eval + ", topic_eval=" + topic_eval + ", dropout_date=" + dropout_date + '}';
    }
    
    
}
