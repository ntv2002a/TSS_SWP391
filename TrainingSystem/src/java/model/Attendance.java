/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
public class Attendance {
    private Class class_id;
    private User trainee_id;
    private Schedule schedule_id;
    private Boolean status;
    private String comment;

    public Class getClass_id() {
        return class_id;
    }

    public void setClass_id(Class class_id) {
        this.class_id = class_id;
    }

    public User getTrainee_id() {
        return trainee_id;
    }

    public void setTrainee_id(User trainee_id) {
        this.trainee_id = trainee_id;
    }

    public Schedule getSchedule_id() {
        return schedule_id;
    }

    public void setSchedule_id(Schedule schedule_id) {
        this.schedule_id = schedule_id;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
    
}
