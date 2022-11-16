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
import model.Slot;

/**
 *
 * @author duyng
 */
public class SlotDBContext extends DBContext<Slot> {

    @Override
    public ArrayList<Slot> list() {
        ArrayList<Slot> slots = new ArrayList<>();
        Connection connection = open();
        try {
            String sql = "SELECT slot_id, slot_name, time_start, time_end\n"
                    + "FROM swp391.slot;";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Slot slot = new Slot();
                slot.setSlot_id(rs.getInt("slot_id"));
                slot.setSlot_name(rs.getString("slot_name"));
                slot.setTime_start(rs.getTime("time_start"));
                slot.setTime_end(rs.getTime("time_end"));
                slots.add(slot);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return slots;
    }

    public ArrayList<Slot> listAvailable(Date date) {
        ArrayList<Slot> slots = new ArrayList<>();
        Connection connection = open();
        try {
            String sql = "SELECT slot_id, slot_name, time_start, time_end \n"
                    + "FROM swp391.slot WHERE slot_id NOT IN \n"
                    + "(SELECT slot_id FROM swp391.schedule\n"
                    + "WHERE training_date = ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setDate(1, date);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Slot slot = new Slot();
                slot.setSlot_id(rs.getInt("slot_id"));
                slot.setSlot_name(rs.getString("slot_name"));
                slot.setTime_start(rs.getTime("time_start"));
                slot.setTime_end(rs.getTime("time_end"));
                slots.add(slot);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return slots;
    }

    @Override
    public Slot get(int id) {
        Slot slot = new Slot();
        try {
            String sql = "SELECT slot_name, time_start, time_end\n"
                    + "FROM swp391.slot\n"
                    + "WHERE slot_id = ?;";
            Connection connection = open();
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                slot.setSlot_id(id);
                slot.setSlot_name(rs.getString("slot_name"));
                slot.setTime_start(rs.getTime("time_start"));
                slot.setTime_end(rs.getTime("time_end"));
            }
            connection.close();
        } catch (SQLException e) {
        }
        return slot;
    }

    @Override
    public void add(Slot model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Slot model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void remove(Slot model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
