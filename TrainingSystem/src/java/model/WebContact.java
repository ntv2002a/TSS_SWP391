/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Lenovo
 */
public class WebContact {
    private int id;
    private int categoryid;
    private User supportid;
    private String fullname;
    private String email;
    private String mobile;
    private String message;
    private String response;

    public WebContact() {
    }

    public WebContact(int id, int categoryid, User supportid, String fullname, String email, String mobile, String message, String response) {
        this.id = id;
        this.categoryid = categoryid;
        this.supportid = supportid;
        this.fullname = fullname;
        this.email = email;
        this.mobile = mobile;
        this.message = message;
        this.response = response;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public User getSupportid() {
        return supportid;
    }

    public void setSupportid(User supportid) {
        this.supportid = supportid;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    @Override
    public String toString() {
        return "WebContact{" + "id=" + id + ", categoryid=" + categoryid + ", supportid=" + supportid + ", fullname=" + fullname + ", email=" + email + ", mobile=" + mobile + ", message=" + message + ", response=" + response + '}';
    }
}
