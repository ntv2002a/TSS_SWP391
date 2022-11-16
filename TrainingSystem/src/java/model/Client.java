/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Lenovo
 */
public class Client {
    private int client_id;
    private int user_id;
    private String mobile;
    private String address;
    private String position;
    private String company;

    public Client() {
    }

    public Client(int client_id, int user_id, String mobile, String address, String position, String company) {
        this.client_id = client_id;
        this.user_id = user_id;
        this.mobile = mobile;
        this.address = address;
        this.position = position;
        this.company = company;
    }

    public int getClient_id() {
        return client_id;
    }

    public void setClient_id(int client_id) {
        this.client_id = client_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    @Override
    public String toString() {
        return "Client{" + "client_id=" + client_id + ", user_id=" + user_id + ", mobile=" + mobile + ", address=" + address + ", position=" + position + ", company=" + company + '}';
    }
    
    
}
