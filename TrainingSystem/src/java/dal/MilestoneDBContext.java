/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import model.Assignment;
import model.Milestone;
import model.Class;

/**
 *
 * @author Lenovo
 */
public class MilestoneDBContext extends DBContext<Milestone> {

    public void updateStatus(int status, int id) {
        try {
            String sql = "UPDATE swp391.milestone SET \n"
                    + "milestone.status = ? \n"
                    + "WHERE milestone.milestone_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, status);
            stmt.setInt(2, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<Milestone> listMilestoneWithFilter(int pageindex, int pagesize, Integer classId, Integer assId, Integer status, String title, int trainerId) {
        ArrayList<Milestone> milestones = new ArrayList<>();
        try {
            String sql = "SELECT m.milestone_id, m.ass_id, a.title, m.class_id, c.class_code, m.from_date, m.to_date, m.title, m.status FROM swp391.milestone m\n"
                    + "join swp391.class c on c.class_id = m.class_id\n"
                    + "join swp391.assignment a on a.ass_id = m.ass_id\n"
                    + "WHERE (1=1) \n";
            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (classId != -1) {
                count++;
                sql += "AND m.class_id = ?\n";
                params.put(count, classId);
            }

            if (assId != -1) {
                count++;
                sql += "AND m.ass_id = ?\n";
                params.put(count, assId);
            }

            if (status != -1) {
                count++;
                sql += "AND m.status = ?\n";
                params.put(count, status);
            }
            
            if (trainerId != -1) {
                count++;
                sql += "AND c.trainer_id = ?\n";
                params.put(count, trainerId);
            }

            if (title != null) {
                sql += "AND (m.title like ? OR c.class_code like ? OR a.title like ?)\n";
                title = "%" + title + "%";
                for (int i = 0; i < 3; i++) {
                    count++;
                    params.put(count, title);
                }
            }
            sql += "group by m.milestone_id, m.ass_id, a.title, m.class_id, c.class_code, m.from_date, m.to_date, m.title, m.status\n"
                    + "ORDER BY m.milestone_id ASC\n"
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
                Milestone milestone = new Milestone();
                milestone.setId(rs.getInt("m.milestone_id"));

                Class classMilestone = new Class();
                classMilestone.setClass_id(rs.getInt("m.class_id"));
                classMilestone.setClass_code(rs.getString("c.class_code"));
                milestone.setClass_milestone(classMilestone);

                Assignment assignment = new Assignment();
                assignment.setAss_id(rs.getInt("m.ass_id"));
                assignment.setTitle(rs.getString("a.title"));
                milestone.setAss(assignment);

                milestone.setFrom_date(rs.getDate("m.from_date"));
                milestone.setTo_date(rs.getDate("m.to_date"));
                milestone.setTitle(rs.getString("m.title"));
                milestone.setStatus(rs.getInt("m.status"));
                milestones.add(milestone);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return milestones;
    }

    public int count(Integer classId, Integer assId, Integer status, String title, Integer trainerId) {
        try {
            String sql = "SELECT COUNT(distinct m.milestone_id) as total FROM swp391.milestone m \n"
                    + "JOIN swp391.class c on c.class_id = m.class_id\n"
                    + "join swp391.assignment a on a.ass_id = m.ass_id\n"
                    + "WHERE (1=1) ";
            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (classId != -1) {
                count++;
                sql += "AND m.class_id = ?\n";
                params.put(count, classId);
            }

            if (assId != -1) {
                count++;
                sql += "AND m.ass_id = ?\n";
                params.put(count, assId);
            }

            if (status != -1) {
                count++;
                sql += "AND m.status = ?\n";
                params.put(count, status);
            }

            if (trainerId != -1) {
                count++;
                sql += "AND c.trainer_id = ?\n";
                params.put(count, trainerId);
            }
            
            if (title != null) {
                sql += "AND (m.title like ? OR c.class_code like ? OR a.title like ?)\n";
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
                System.out.println(rs.getInt("total"));
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return -1;
    }

    @Override
    public ArrayList<Milestone> list() {
        ArrayList<Milestone> milestones = new ArrayList<>();
        try {
            String sql = "SELECT milestone.milestone_id, milestone.title \n"
                    + "FROM swp391.milestone\n"
                    + "WHERE milestone.status = 1;";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Milestone m = new Milestone();
                m.setId(rs.getInt("milestone_id"));
                m.setTitle(rs.getString("title"));
                
                milestones.add(m);
            }
        } catch (SQLException e) {
        }
        return milestones;
    }

    public ArrayList<Milestone> listMilestone() {
        ArrayList<Milestone> milestones = new ArrayList<>();
        try {
            String sql = "SELECT milestone_id, title, \n"
                    + "from_date, to_date FROM swp391.milestone\n"
                    + "WHERE status IS TRUE;";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Milestone m = new Milestone();
                m.setId(rs.getInt("milestone_id"));
                m.setTitle(rs.getString("title"));
                m.setFrom_date(rs.getDate("from_date"));
                m.setTo_date(rs.getDate("to_date"));
                milestones.add(m);
            }
        } catch (SQLException e) {
        }
        return milestones;
    }

    @Override
    public Milestone get(int id) {
        Milestone milestone = new Milestone();
        try {
            String sql = "SELECT\n"
                    + "milestone.milestone_id, \n"
                    + "milestone.ass_id, assignment.title, \n"
                    + "milestone.class_id, class.class_code, \n"
                    + "milestone.from_date, \n"
                    + "milestone.to_date, \n"
                    + "milestone.title, \n"
                    + "assignment.ass_body, \n"
                    + "milestone.description, \n"
                    + "milestone.status\n"
                    + "FROM swp391.milestone JOIN swp391.assignment ON milestone.ass_id=assignment.ass_id JOIN swp391.class ON class.class_id = milestone.class_id\n"
                    + "WHERE milestone.milestone_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                milestone.setId(rs.getInt("milestone.milestone_id"));
                milestone.setTitle(rs.getString("milestone.title"));
                milestone.setBody(rs.getString("assignment.ass_body"));
                milestone.setDescription(rs.getString("milestone.description"));
                milestone.setStatus(rs.getInt("milestone.status"));
                milestone.setFrom_date(rs.getDate("milestone.from_date"));
                milestone.setTo_date(rs.getDate("milestone.to_date"));

                Class class_milestone = new Class();
                class_milestone.setClass_id(rs.getInt("milestone.class_id"));
                class_milestone.setClass_code(rs.getString("class.class_code"));
                Assignment assignment = new Assignment();
                assignment.setAss_id(rs.getInt("milestone.ass_id"));
                assignment.setTitle(rs.getString("assignment.title"));

                milestone.setAss(assignment);
                milestone.setClass_milestone(class_milestone);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return milestone;
    }

    @Override
    public void add(Milestone model) {
        try {
            String sql = "INSERT INTO swp391.milestone (milestone.ass_id, milestone.class_id, milestone.from_date, milestone.to_date, milestone.title, milestone.ass_body, milestone.description, milestone.status)\n"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, model.getAss().getAss_id());
            stmt.setInt(2, model.getClass_milestone().getClass_id());
            stmt.setDate(3, new Date(model.getFrom_date().getTime()));
            stmt.setDate(4, new Date(model.getTo_date().getTime()));
            stmt.setString(5, model.getTitle());
            stmt.setString(6, model.getBody());
            stmt.setString(7, model.getDescription());
            stmt.setInt(8, model.getStatus());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void update(Milestone model) {
        try {
            String sql = "UPDATE swp391.milestone SET \n"
                    + "milestone.title = ?, \n"
                    + "milestone.from_date = ?, \n"
                    + "milestone.to_date = ?, \n"
                    + "milestone.description = ?, \n"
                    + "milestone.status = ? \n"
                    + "WHERE milestone.milestone_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, model.getTitle());
            stmt.setDate(2, new Date(model.getFrom_date().getTime()));
            stmt.setDate(3, new Date(model.getTo_date().getTime()));
            stmt.setString(4, model.getDescription());
            stmt.setInt(5, model.getStatus());
            stmt.setInt(6, model.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void remove(Milestone model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
