/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.trainer;

/**
 *
 * @author Admin
 */
public class Subject {
    int id;
    String code;
    String name;
    int managerId;
    int expectId;
    boolean status;

    public Subject() {
    }

    public Subject(int id, String code, String name, int managerId, int expectId, boolean status) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.managerId = managerId;
        this.expectId = expectId;
        this.status = status;
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

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public int getExpectId() {
        return expectId;
    }

    public void setExpectId(int expectId) {
        this.expectId = expectId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
}
