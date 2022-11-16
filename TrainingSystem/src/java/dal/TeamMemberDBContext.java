/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static dal.DBContext.open;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Team;
import model.TeamMember;
import model.User;

/**
 *
 * @author trung
 */
public class TeamMemberDBContext extends DBContext<TeamMember> {

    @Override
    public ArrayList<TeamMember> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public TeamMember get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void add(TeamMember model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(TeamMember model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void remove(TeamMember model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<User> getTeamMember(int id, int status) {
        Connection connection = open();
        ArrayList<User> teammembers = new ArrayList<>();
        try {
            String sql = "select u.user_id, u.full_name, u.email, u.status from swp391.user u\n"
                    + "join swp391.team_member tm on u.user_id = tm.user_id\n"
                    + "where tm.team_id = ?";
            
            int count = 0;
            
            if (status != -1) {
                count++;
                sql += " and u.status = ?;";
            }
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            
            if (count != 0) {
                stm.setInt(2, status);
            }
            
            ResultSet rs = stm.executeQuery();
            
            while (rs.next()) {
                User trainee = new User();
                trainee.setId(rs.getInt("user_id"));
                trainee.setFullname(rs.getString("full_name"));
                trainee.setEmail(rs.getString("email"));
                trainee.setStatus(rs.getInt("status"));
                
                teammembers.add(trainee);
            }
            connection.close();
        } catch (Exception e) {
        }
        return teammembers;
    }
    
//    public static void main(String[] args) {
//        TeamMemberDBContext tmdc = new TeamMemberDBContext();
//        ArrayList<User> users = tmdc.getTeamMember(1, 0);
//        for (User user : users) {
//            System.out.println(user);
//        }
//    }
}
