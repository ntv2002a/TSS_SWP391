/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Room;

/**
 *
 * @author duyng
 */
public class RoomDBContext extends DBContext<Room> {

    @Override
    public ArrayList<Room> list() {
        ArrayList<Room> rooms = new ArrayList<>();
        try {
            String sql = "SELECT room_id, room_code FROM swp391.room;";
            Connection connection = open();
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setRoom_id(rs.getInt("room_id"));
                room.setRoom_code(rs.getString("room_code"));
                rooms.add(room);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return rooms;
    }

    public ArrayList<Room> listAvailable(Date date) {
        ArrayList<Room> rooms = new ArrayList<>();
        try {
            String sql = "SELECT room_id, room_code FROM swp391.room\n"
                    + "WHERE room_id NOT IN\n"
                    + "(SELECT room_id FROM swp391.schedule\n"
                    + "WHERE training_date = ?);";
            Connection connection = open();
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setDate(1, date);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setRoom_id(rs.getInt("room_id"));
                room.setRoom_code(rs.getString("room_code"));
                rooms.add(room);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return rooms;
    }

    @Override
    public Room get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void add(Room model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Room model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void remove(Room model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
