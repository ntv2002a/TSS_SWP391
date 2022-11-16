/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Assignment;
import model.Subject;
import model.User;

/**
 *
 * @author tuand
 */
public class AssignmentDAO extends DBContext<Assignment> {

    public int ass_count(Integer subject_id, Integer status, String title) {
        try {
            String sql = "SELECT COUNT(distinct u.ass_id) as total FROM swp391.assignment u\n"
                    + "WHERE (1=1) ";
            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (subject_id != -1) {
                count++;
                sql += "AND u.subject_id = ?\n";
                params.put(count, subject_id);
            }

            if (status != -1) {
                count++;
                sql += "AND u.status = ?\n";
                params.put(count, status);
            }

            if (title != null) {
                sql += "AND (u.title like ?)\n";
                title = "%" + title + "%";
                for (int i = 0; i < 3; i++) {
                    count++;
                    params.put(count, title);
                }
            }

            PreparedStatement stm = connection.prepareStatement(sql);

            for (Map.Entry<Integer, Object> entry : params.entrySet()) {
                Integer key = entry.getKey();
                Object val = entry.getValue();
                stm.setObject(key, val);
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return -1;
    }

    public ArrayList<Assignment> list() {
        ArrayList<Assignment> assignments = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "ass_id, \n"
                    + "subject_id, \n"
                    + "title, \n"
                    + "ass_body, \n"
                    + "eval_weight, \n"
                    + "is_team_work, \n"
                    + "is_ongoing, \n"
                    + "status\n"
                    + "FROM swp391.assignment";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Assignment assignment = new Assignment();
                Subject subjects = new Subject();
                assignment.setAss_id(rs.getInt("ass_id"));
                //assignment.setSubject_id(rs.getInt("subject_id"));
                subjects.setId(rs.getInt("assignment.subject_id"));
                assignment.setSubject_id(subjects);
                assignment.setTitle(rs.getString("title"));
                assignment.setAss_body(rs.getString("ass_body"));
                assignment.setEval_weight(rs.getInt("eval_weight"));
                assignment.setIs_team_work(rs.getBoolean("is_team_work"));
                assignment.setIs_ongoing(rs.getBoolean("is_ongoing"));
                assignment.setStatus(rs.getBoolean("status"));

                assignments.add(assignment);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return assignments;
    }

    public ArrayList<Subject> getAssSubject(int mid) {
        ArrayList<Subject> subjects = new ArrayList<>();
        try {
            String sql = "select subject_code, subject_id from swp391.subject where manager_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, mid);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setCode(rs.getString("subject_code"));
                subject.setId(rs.getInt("subject_id"));

                subjects.add(subject);
            }
        } catch (SQLException e) {
        }
        return subjects;
    }

    public ArrayList<Assignment> getAssignmentListWithFilter(int pageindex, int pagesize, Integer subject, Integer status, String title) {
        ArrayList<Assignment> assignments = new ArrayList<>();
        try {
            String sql = "SELECT a.ass_id, a.title, s.subject_code as subject, s.subject_id as subject_id, a.ass_body, a.eval_weight, a.status  \n"
                    + "FROM swp391.assignment a \n"
                    + "join swp391.subject s \n"
                    + "on a.subject_id = s.subject_id \n"
                    + "where (1=1) \n";
            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (subject != -1) {
                count++;
                sql += "AND s.subject_id = ?\n";
                params.put(count, subject);
            }

            if (status != -1) {
                count++;
                sql += "AND a.status = ?\n";
                params.put(count, status);
            }

            if (title != null) {
                count++;
                sql += "AND a.title like ?\n";
                title = "%" + title + "%";
                params.put(count, title);
            }

            sql += "ORDER BY a.ass_id ASC\n"
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

                Assignment assignment = new Assignment();

                assignment.setAss_id(rs.getInt("ass_id"));
                assignment.setTitle(rs.getString("title"));
                assignment.setAss_body(rs.getString("ass_body"));
                assignment.setEval_weight(rs.getInt("eval_weight"));
                assignment.setStatus(rs.getBoolean("status"));

                assignment.setSubject_name(rs.getString("subject"));
                assignments.add(assignment);

            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return assignments;
    }

    public Assignment getAssbyId(int id) {
        Assignment ass = new Assignment();
        try {
            String sql = "SELECT ass_id, title, ass_body, eval_weight, subject_code,u.is_team_work,u.is_ongoing, u.status as status FROM swp391.assignment u left join swp391.subject s \n"
                    + "on u.subject_id = s.subject_id where ass_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ass.setAss_id(rs.getInt("ass_id"));
                ass.setTitle(rs.getString("title"));
                ass.setSubject_name(rs.getString("subject_code"));
                ass.setStatus(rs.getBoolean("status"));
                ass.setEval_weight(rs.getInt("eval_weight"));
                ass.setAss_body(rs.getString("ass_body"));
                ass.setIs_ongoing(rs.getBoolean("is_ongoing"));
                ass.setIs_team_work(rs.getBoolean("is_team_work"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return ass;
    }

    //SELECT subject_code FROM swp391.subject;
    public void addAssginment(int subject_id, String title, String body, int eval_weight, int status) {
        try {
            String sql = "insert into swp391.assignment (ass_id, subject_id, title, ass_body, eval_weight, status) values (null,?,?,?,?,?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, subject_id);
            stmt.setString(2, title);
            stmt.setString(3, body);
            stmt.setInt(4, eval_weight);
            stmt.setInt(5, status);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateAssginmentbyId(String title, int status, int is_ongoing, int is_team_work, int eval_weight, String body, int id) {
        try {
            String sql = "update swp391.assignment set title = ?, status = ?, is_ongoing = ?, is_team_work = ?,  eval_weight= ?, ass_body = ?\n"
                    + "where ass_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setInt(2, is_ongoing);
            stmt.setInt(3, is_team_work);
            stmt.setInt(4, status);
            stmt.setInt(5, eval_weight);
            stmt.setString(6, body);
            stmt.setInt(7, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void remove(Assignment model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        AssignmentDAO a = new AssignmentDAO();
        //a.getAssignmentListWithFilter(1, 1, Integer.SIZE, Integer.BYTES, "");
//        System.out.println(a.getAssSubject().size());
    }

    @Override
    public Assignment get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Assignment model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void add(Assignment model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
