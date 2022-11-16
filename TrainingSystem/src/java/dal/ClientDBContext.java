/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Client;

/**
 *
 * @author Lenovo
 */
public class ClientDBContext extends DBContext<Client>{

    @Override
    public ArrayList<Client> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Client get(int id) {
        Client client = new Client();
        try {
            String sql = "SELECT\n"
                    + "client.client_id, \n"
                    + "client.user_id, \n"
                    + "client.mobile, \n"
                    + "client.address, \n"
                    + "client.position, \n"
                    + "client.company \n"
                    + "FROM swp391.client\n"
                    + "WHERE client.user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                client.setClient_id(rs.getInt("client.client_id"));
                client.setUser_id(rs.getInt("client.user_id"));
                client.setMobile(rs.getString("client.mobile"));
                client.setAddress(rs.getString("client.address"));
                client.setPosition(rs.getString("client.position"));
                client.setCompany(rs.getString("client.company"));
            }
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return client;
    }

    @Override
    public void add(Client model) {
        try {
            String sql = "INSERT INTO swp391.client VALUES (NULL, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, model.getUser_id());
            stmt.setString(2, model.getMobile());
            stmt.setString(3, model.getAddress());
            stmt.setString(4, model.getPosition());
            stmt.setString(5, model.getCompany());
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void update(Client model) {
        try {
            String sql = "UPDATE swp391.client SET\n"
                    + "client.mobile = ?, \n"
                    + "client.address = ?, \n"
                    + "client.position = ?, \n"
                    + "client.company = ?\n"
                    + "WHERE client.client_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, model.getMobile());
            stmt.setString(2, model.getAddress());
            stmt.setString(3, model.getPosition());
            stmt.setString(4, model.getCompany());
            stmt.setInt(5, model.getClient_id());
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void remove(Client model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
