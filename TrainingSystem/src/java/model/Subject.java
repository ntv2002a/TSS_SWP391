/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Lenovo
 */
public class Subject {
    int id;
    String code;
    String name;
    User manager;
    User expert;
    boolean status;
    String body;

    public Subject() {
    }

    public Subject(int id, String code, String name, User manager, User expert, boolean status, String body) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.manager = manager;
        this.expert = expert;
        this.status = status;
        this.body = body;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User getManager() {
        return manager;
    }

    public void setManager(User manager) {
        this.manager = manager;
    }

    public User getExpert() {
        return expert;
    }

    public void setExpert(User expert) {
        this.expert = expert;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    @Override
    public String toString() {
        return "Subject{" + "id=" + id + ", code=" + code + ", name=" + name + ", manager=" + manager + ", expert=" + expert + ", status=" + status + ", body=" + body + '}';
    }
    
}
