/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static dal.DBContext.open;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Submit;

/**
 *
 * @author trung
 */
public class SubmitDBContext extends DBContext<Submit>{

    @Override
    public ArrayList<Submit> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Submit get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void add(Submit model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int adds(Submit model) {
        Connection connection = open();
        int status = 0;
        try {
            String sql = "INSERT INTO `swp391`.`submit` (`milestone_id`, `class_id`, `team_id`, `user_id`) "
                    + "VALUES (?, ?, ?, ?)";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            
            stm.setInt(1, model.getMilestone_id().getId());
            stm.setInt(2, model.getClass_id().getClass_id());
            stm.setInt(3, model.getTeam_id().getTeam_id());
            stm.setInt(4, model.getUser_id().getId());
            
            status = stm.executeUpdate();
            
            connection.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }
    
    @Override
    public void update(Submit model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void remove(Submit model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
