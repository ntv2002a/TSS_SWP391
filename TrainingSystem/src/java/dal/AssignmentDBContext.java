/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Assignment;
import model.Subject;

/**
 *
 * @author ACER
 */
public class AssignmentDBContext extends DBContext<Assignment> {

    public void updateBody(String ass_body, int ass_id){
        try {
            String sql = "UPDATE swp391.assignment SET \n"
                    + "assignment.ass_body = ? \n"
                    + "WHERE assignment.ass_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, ass_body);
            stmt.setInt(2, ass_id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    @Override
    public ArrayList<Assignment> list() {
        ArrayList<Assignment> asses = new ArrayList<>();
        try {
            String sql = "SELECT ass_id,subject_id,title,ass_body,eval_weight,is_team_work,is_ongoing,status FROM swp391.assignment";
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Assignment a = new Assignment();
                a.setAss_id(rs.getInt("ass_id"));
                Subject s = new Subject();
                s.setId(rs.getInt("subject_id"));
                a.setSubject_id(s);
                a.setTitle(rs.getString("title"));
                a.setAss_body(rs.getString("ass_body"));
                a.setEval_weight(rs.getInt("eval_weight"));
                a.setIs_team_work(rs.getBoolean("is_team_work"));
                a.setIs_ongoing(rs.getBoolean("is_ongoing"));
                a.setStatus(rs.getBoolean("status"));
                asses.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssignmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return asses;
    }

    public ArrayList<Assignment> listAssignments(ArrayList<Integer> subjectId) {
        ArrayList<Assignment> assignments = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT a.ass_id, a.title, s.subject_id,\n"
                    + "s.subject_code, s.subject_name FROM swp391.assignment a \n"
                    + "LEFT JOIN swp391.subject s ON a.subject_id = s.subject_id\n";
            int count = 0;
            HashMap<Integer, Object> params = new HashMap<>();
            if(!subjectId.isEmpty()){
                for (Integer integer : subjectId) {
                    if(count == 0){
                        sql+= "WHERE a.subject_id = ? \n";
                        count++;
                        params.put(count, integer);
                        continue;
                    }
                    sql+= "OR a.subject_id = ? \n";
                    count++;
                    params.put(count, integer);
                }
            }
            PreparedStatement stmt = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : params.entrySet()) {
                Integer key = entry.getKey();
                Object val = entry.getValue();
                stmt.setObject(key, val);
            }
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Assignment assignment = new Assignment();
                assignment.setAss_id(rs.getInt("ass_id"));
                assignment.setTitle(rs.getString("title"));
                Subject s = new Subject();
                s.setId(rs.getInt("subject_id"));
                s.setCode(rs.getString("subject_code"));
                s.setName(rs.getString("subject_name"));
                assignment.setSubject_id(s);
                assignments.add(assignment);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return assignments;
    }
    
    public ArrayList<Assignment> listAssignments() {
        ArrayList<Assignment> assignments = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT a.ass_id, a.title, s.subject_id,\n"
                    + "s.subject_code, s.subject_name FROM swp391.assignment a \n"
                    + "LEFT JOIN swp391.subject s ON a.subject_id = s.subject_id";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Assignment assignment = new Assignment();
                assignment.setAss_id(rs.getInt("ass_id"));
                assignment.setTitle(rs.getString("title"));
                Subject s = new Subject();
                s.setId(rs.getInt("subject_id"));
                s.setCode(rs.getString("subject_code"));
                s.setName(rs.getString("subject_name"));
                assignment.setSubject_id(s);
                assignments.add(assignment);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return assignments;
    }

    public ArrayList<Assignment> listBySubject(int subjectID) {
        ArrayList<Assignment> list = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT a.ass_id, a.title, s.subject_code,\n"
                    + "s.subject_name FROM swp391.assignment a \n"
                    + "LEFT JOIN swp391.subject s ON a.subject_id = s.subject_id\n"
                    + "WHERE a.subject_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, subjectID);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Assignment a = new Assignment();
                a.setAss_id(rs.getInt("ass_id"));
                a.setTitle(rs.getString("title"));
                Subject s = new Subject();
                s.setId(subjectID);
                s.setCode(rs.getString("subject_code"));
                s.setName(rs.getString("subject_name"));
                a.setSubject_id(s);
                list.add(a);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    @Override
    public Assignment get(int id) {
        Assignment assignment = new Assignment();
        try {
            String sql = "SELECT DISTINCT a.ass_id, a.title, s.subject_id,\n"
                    + "s.subject_code, s.subject_name FROM swp391.assignment a \n"
                    + "LEFT JOIN swp391.subject s ON a.subject_id = s.subject_id \n"
                    + "WHERE a.ass_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                assignment.setAss_id(rs.getInt("ass_id"));
                assignment.setTitle(rs.getString("title"));
                Subject s = new Subject();
                s.setId(rs.getInt("subject_id"));
                s.setCode(rs.getString("subject_code"));
                s.setName(rs.getString("subject_name"));
                assignment.setSubject_id(s);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return assignment;
    }

    @Override
    public void add(Assignment model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Assignment model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void remove(Assignment model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
