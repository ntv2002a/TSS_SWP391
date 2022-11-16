/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
public class Class {
    private int class_id;
    private Subject subject_id;
    private String class_code;
    private User trainter_id;
    private User supporter_id;
    private Setting term_id;
    private int status;
    private String description;

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public Subject getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(Subject subject_id) {
        this.subject_id = subject_id;
    }

    public String getClass_code() {
        return class_code;
    }

    public void setClass_code(String class_code) {
        this.class_code = class_code;
    }

    public User getTrainer_id() {
        return trainter_id;
    }

    public void setTrainer_id(User trainter_id) {
        this.trainter_id = trainter_id;
    }

    public User getSupporter_id() {
        return supporter_id;
    }

    public void setSupporter_id(User supporter_id) {
        this.supporter_id = supporter_id;
    }

    public Setting getTerm_id() {
        return term_id;
    }

    public void setTerm_id(Setting term_id) {
        this.term_id = term_id;
    }

     public int getStatus(){
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
