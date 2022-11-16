/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import model.Trainee;
import model.Class;
import model.User;
/**
 *
 * @author Lenovo
 */
public class TraineeDBContext extends DBContext<Trainee>{

    public Trainee get(int classId, int traineeId) {
        Trainee trainee = new Trainee();
        try {
            String sql = "SELECT\n"
                    + "cu.class_id, \n"
                    + "cu.user_id, \n"
                    + "u.full_name, \n"
                    + "u.email, \n"
                    + "cu.note, \n"
                    + "cu.status, \n"
                    + "cu.dropout_date, \n"
                    + "cu.topic_eval, \n"
                    + "cu.ongoing_eval, \n"
                    + "cu.final_eval \n"
                    + "FROM swp391.class_user cu JOIN swp391.class c ON c.class_id = cu.class_id\n"
                    + "JOIN swp391.user u ON u.user_id = cu.user_id\n"
                    + "WHERE cu.class_id = ? AND cu.user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, classId);
            stmt.setInt(2, traineeId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("cu.user_id"));
                user.setFullname(rs.getString("u.full_name"));
                user.setEmail(rs.getString("u.email"));
                trainee.setUserId(user);
                
                Class classTemp = new Class();
                classTemp.setClass_id(rs.getInt("cu.class_id"));
                trainee.setClassId(classTemp);
                
                trainee.setNote(rs.getString("cu.note"));
                trainee.setOngoing_eval(rs.getInt("cu.ongoing_eval"));
                trainee.setTopic_eval(rs.getInt("cu.topic_eval"));
                trainee.setFinal_eval(rs.getInt("cu.final_eval"));
                trainee.setStatus(rs.getInt("cu.status"));
                trainee.setDropout_date(rs.getDate("cu.dropout_date"));

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return trainee;
    }
    
    public void updateStatus(int status, int classId, int traineeId) {
        try {
            if(status == 0){
                String sql = "UPDATE swp391.class_user SET \n"
                        + "class_user.status = ?, \n"
                        + "class_user.dropout_date = ? \n"
                        + "WHERE class_user.class_id = ? AND class_user.user_id = ?";
                PreparedStatement stmt = connection.prepareStatement(sql);
                stmt.setInt(1, status);
                stmt.setDate(2, new java.sql.Date(new Date().getTime()));
                stmt.setInt(3, classId);
                stmt.setInt(4, traineeId);
                stmt.executeUpdate();
            }else{
                String sql = "UPDATE swp391.class_user SET \n"
                        + "class_user.status = ? \n"
                        + "WHERE class_user.class_id = ? AND class_user.user_id = ?";
                PreparedStatement stmt = connection.prepareStatement(sql);
                stmt.setInt(1, status);
                stmt.setInt(2, classId);
                stmt.setInt(3, traineeId);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<Trainee> listTraineeWithFilter(int pageindex, int pagesize, Integer classId, Integer status) {
        ArrayList<Trainee> trainees = new ArrayList<>();
        try {
            String sql = "SELECT cu.user_id, u.avatar_url, u.full_name, cu.status, cu.class_id, cu.ongoing_eval, cu.topic_eval, cu.final_eval FROM swp391.class_user cu\n"
                    + "join swp391.class c on c.class_id = cu.class_id\n"
                    + "join swp391.user u on u.user_id = cu.user_id\n"
                    + "WHERE (1=1) \n";
            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (classId != -1) {
                count++;
                sql += "AND cu.class_id = ?\n";
                params.put(count, classId);
            }

            if (status != -1) {
                count++;
                sql += "AND cu.status = ?\n";
                params.put(count, status);
            }
            
            sql += "group by cu.user_id, u.avatar_url, u.full_name, cu.status, cu.class_id, cu.ongoing_eval, cu.topic_eval, cu.final_eval\n"
                    + "ORDER BY cu.user_id ASC\n"
                    + "LIMIT ?,?";

            PreparedStatement stm = connection.prepareStatement(sql);

            for (Map.Entry<Integer, Object> entry : params.entrySet()) {
                Integer key = entry.getKey();
                Object val = entry.getValue();
                stm.setObject(key, val);
            }

            count++;
            stm.setInt(count, (pageindex - 1) * pagesize);
            count++;
            stm.setInt(count, pagesize);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Trainee trainee = new Trainee();
                trainee.setStatus(rs.getInt("cu.status"));
                trainee.setOngoing_eval(rs.getInt("cu.ongoing_eval"));
                trainee.setTopic_eval(rs.getInt("cu.topic_eval"));
                trainee.setFinal_eval(rs.getInt("cu.final_eval"));

                Class classTemp = new Class();
                classTemp.setClass_id(rs.getInt("cu.class_id"));
                trainee.setClassId(classTemp);

                User user = new User();
                user.setId(rs.getInt("cu.user_id"));
                user.setFullname(rs.getString("u.full_name"));
                user.setAvatarurl(rs.getString("u.avatar_url"));
                trainee.setUserId(user);

                trainees.add(trainee);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return trainees;
    }

    public int count(Integer classId, Integer status) {
        try {
            String sql = "SELECT COUNT(distinct cu.user_id) as total FROM swp391.class_user cu \n"
                    + "JOIN swp391.class c on c.class_id = cu.class_id\n"
                    + "join swp391.user u on u.user_id = cu.user_id\n"
                    + "WHERE (1=1) ";
            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (classId != -1) {
                count++;
                sql += "AND cu.class_id = ?\n";
                params.put(count, classId);
            }

            if (status != -1) {
                count++;
                sql += "AND cu.status = ?\n";
                params.put(count, status);
            }

            PreparedStatement stm = connection.prepareStatement(sql);

            for (Map.Entry<Integer, Object> entry : params.entrySet()) {
                Integer key = entry.getKey();
                Object val = entry.getValue();
                stm.setObject(key, val);
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getInt("total"));
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return -1;
    }
    
    @Override
    public ArrayList<Trainee> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Trainee get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void add(Trainee model) {
        try {
            String sql = "INSERT INTO swp391.class_user (class_user.user_id, class_user.class_id, class_user.status, class_user.ongoing_eval, class_user.final_eval, class_user.topic_eval)\n"
                    + "VALUES (?, ?, ?, 0, 0, 0)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, model.getUserId().getId());
            stmt.setInt(2, model.getClassId().getClass_id());
            stmt.setInt(3, 1);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void update(Trainee model) {
        try {
            String sql = "UPDATE swp391.class_user SET \n"
                    + "class_user.dropout_date = ?, \n"
                    + "class_user.note = ?, \n"
                    + "class_user.status = ? \n"
                    + "WHERE class_user.class_id = ? AND class_user.user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            if(model.getDropout_date() == null || model.getDropout_date().toString().length() < 1){
                stmt.setNull(1, Types.NULL);
            }else{
                stmt.setDate(1, new java.sql.Date(model.getDropout_date().getTime()));
            }
            stmt.setString(2, model.getNote());
            stmt.setInt(3, model.getStatus());
            stmt.setInt(5, model.getUserId().getId());
            stmt.setInt(4, model.getClassId().getClass_id());
            stmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void remove(Trainee model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
