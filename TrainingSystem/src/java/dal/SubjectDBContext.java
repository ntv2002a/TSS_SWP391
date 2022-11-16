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
import model.Subject;
import model.User;

/**
 *
 * @author duyng
 */
public class SubjectDBContext extends DBContext<Subject> {

    @Override
    public ArrayList<Subject> list() {
        ArrayList<Subject> subjects = new ArrayList<>();
        try {
            String sql = "SELECT s.subject_id, s.subject_code, s.subject_name,\n"
                    + "s.manager_id, u1.full_name AS manager_name,\n"
                    + "s.expert_id, u2.full_name AS expert_name,\n"
                    + "s.status, s.body \n"
                    + "FROM swp391.subject s\n"
                    + "LEFT JOIN swp391.user u1 ON s.manager_id = u1.user_id\n"
                    + "LEFT JOIN swp391.user u2 ON s.expert_id = u2.user_id;";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setId(rs.getInt("subject_id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                User manager = new User();
                manager.setId(rs.getInt("manager_id"));
                manager.setFullname(rs.getString("manager_name"));
                User expert = new User();
                expert.setId(rs.getInt("expert_id"));
                expert.setFullname(rs.getString("expert_name"));
                subject.setManager(manager);
                subject.setExpert(expert);
                subject.setStatus(rs.getBoolean("status"));
                subject.setBody(rs.getString("body"));
                subjects.add(subject);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return subjects;
    }

    public ArrayList<Subject> filter(int pageindex, int pagesize, Integer manager_id, Integer expert_id, Boolean status, String namepart) {
        ArrayList<Subject> subjects = new ArrayList<>();
        try {
            String sql = "SELECT s.subject_id, s.subject_code, s.subject_name, \n"
                    + "s.manager_id, u1.full_name AS manager_name, \n"
                    + "s.expert_id, u2.full_name AS expert_name,\n"
                    + "s.status, s.body FROM swp391.subject s\n"
                    + "LEFT JOIN swp391.user u1 ON s.manager_id = u1.user_id\n"
                    + "LEFT JOIN swp391.user u2 ON s.expert_id = u2.user_id\n"
                    + "WHERE (1=1)\n";
            int count = 0;
            HashMap<Integer, Object> params = new HashMap<>();

            if (manager_id != null) {
                count++;
                sql += "AND (s.manager_id = ?)\n";
                params.put(count, manager_id);
            }

            if (expert_id != null) {
                count++;
                sql += "AND (s.expert_id = ?)\n";
                params.put(count, expert_id);
            }

            if (status != null) {
                count++;
                sql += "AND (s.status = ?)\n";
                params.put(count, status);
            }

            if (namepart != null) {
                namepart = '%' + namepart + '%';
                sql += "AND (s.subject_code LIKE ? OR s.subject_name LIKE ?)";
                count++;
                params.put(count, namepart);
                count++;
                params.put(count, namepart);
            }

            sql += "ORDER BY s.subject_id ASC\n"
                    + "LIMIT ?, ?;";

            PreparedStatement stmt = connection.prepareStatement(sql);

            for (Map.Entry<Integer, Object> entry : params.entrySet()) {
                Integer key = entry.getKey();
                Object val = entry.getValue();
                stmt.setObject(key, val);
            }

            count++;
            stmt.setInt(count, (pageindex - 1) * pagesize);
            count++;
            stmt.setInt(count, pagesize);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                User manager = new User();
                User expert = new User();
                subject.setId(rs.getInt("subject_id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                manager.setId(rs.getInt("manager_id"));
                manager.setFullname(rs.getString("manager_name"));
                subject.setManager(manager);
                expert.setId(rs.getInt("expert_id"));
                expert.setFullname(rs.getString("expert_name"));
                subject.setExpert(expert);
                subject.setStatus(rs.getBoolean("status"));
                subject.setBody(rs.getString("body"));
                subjects.add(subject);
            }

        } catch (Exception e) {
        }
        return subjects;
    }

    public int countFilter(Integer manager_id, Integer expert_id, Boolean status, String namepart) {
        try {
            String sql = "SELECT COUNT(*) as total FROM swp391.subject\n"
                    + "WHERE (1=1) ";
            int count = 0;
            HashMap<Integer, Object> params = new HashMap<>();

            if (manager_id != null) {
                count++;
                sql += "AND (s.manager_id = ?)\n";
                params.put(count, manager_id);
            }
            if (expert_id != null) {
                count++;
                sql += "AND (s.expert_id = ?)\n";
                params.put(count, expert_id);
            }
            if (status != null) {
                count++;
                sql += "AND (s.status = ?)\n";
                params.put(count, status);
            }
            if (namepart != null) {
                namepart = '%' + namepart + '%';
                sql += "AND (s.subject_code LIKE ? OR s.subject_name LIKE ?)";
                count++;
                params.put(count, namepart);
                count++;
                params.put(count, namepart);
            }

            PreparedStatement stmt = connection.prepareStatement(sql);

            for (Map.Entry<Integer, Object> entry : params.entrySet()) {
                Integer key = entry.getKey();
                Object val = entry.getValue();
                stmt.setObject(key, val);
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
        }
        return -1;
    }

    public ArrayList<Subject> search(int pageindex, int pagesize, String namepart) {
        ArrayList<Subject> subjects = new ArrayList<>();
        try {
            String sql = "SELECT s.subject_id, s.subject_code, s.subject_name, \n"
                    + "s.manager_id, u1.full_name AS manager_name, \n"
                    + "s.expert_id, u2.full_name AS expert_name,\n"
                    + "s.status, s.body FROM swp391.subject s\n"
                    + "JOIN swp391.user u1 ON s.manager_id = u1.user_id\n"
                    + "JOIN swp391.user u2 ON s.expert_id = u2.user_id\n"
                    + "WHERE (s.subject_code LIKE '%" + namepart + "%'\n"
                    + "OR s.subject_name LIKE '%" + namepart + "%')\n"
                    + "ORDER BY s.subject_id ASC\n"
                    + "LIMIT ?, ?;";

            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, (pageindex - 1) * pagesize);
            stmt.setInt(2, pagesize);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                User manager = new User();
                User expert = new User();
                subject.setId(rs.getInt("subject_id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                manager.setId(rs.getInt("manager_id"));
                manager.setFullname(rs.getString("manager_name"));
                subject.setManager(manager);
                expert.setId(rs.getInt("expert_id"));
                expert.setFullname(rs.getString("expert_name"));
                subject.setExpert(expert);
                subject.setStatus(rs.getBoolean("status"));
                subject.setBody(rs.getString("body"));
                subjects.add(subject);
            }

        } catch (SQLException e) {
        }
        return subjects;
    }

    public int countSearch(String namepart) {
        try {
            String sql = "SELECT COUNT(*) AS total FROM swp391.subject\n"
                    + "WHERE (s.subject_code LIKE '%" + namepart + "%'\n"
                    + "OR s.subject_name LIKE '%" + namepart + "%')\n";

            PreparedStatement stmt = connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
        }
        return -1;
    }

    @Override
    public Subject get(int id) {
        Subject subject = null;
        try {
            String sql = "SELECT s.subject_code, s.subject_name,\n"
                    + "s.manager_id, u1.full_name AS manager_name,\n"
                    + "s.expert_id, u2.full_name AS expert_name,\n"
                    + "s.status, s.body \n"
                    + "FROM swp391.subject s\n"
                    + "LEFT JOIN swp391.user u1 ON s.manager_id = u1.user_id\n"
                    + "LEFT JOIN swp391.user u2 ON s.expert_id = u2.user_id\n"
                    + "WHERE subject_id = ?;";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String code = rs.getString("subject_code");
                String name = rs.getString("subject_name");
                int manager_id = rs.getInt("manager_id");
                String manager_name = rs.getString("manager_name");
                int expert_id = rs.getInt("expert_id");
                String expert_name = rs.getString("expert_name");
                Boolean status = rs.getBoolean("status");
                String body = rs.getString("body");
                User manager = new User();
                manager.setId(manager_id);
                manager.setFullname(manager_name);
                User expert = new User();
                expert.setId(expert_id);
                expert.setFullname(expert_name);
                subject = new Subject(id, code, name, manager, expert, status, body);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return subject;
    }

    @Override
    public void add(Subject model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Subject model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public int updateSubject(Subject model) {
        int ret = 0;
        try {
            String sql = "UPDATE swp391.subject SET\n"
                    + "subject_code = ?,\n"
                    + "subject_name = ?,\n"
                    + "manager_id = ?,\n"
                    + "expert_id = ?,\n"
                    + "status = ?, \n"
                    + "body = ?\n"
                    + "WHERE subject_id = ?;";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, model.getCode());
            stmt.setString(2, model.getName());
            stmt.setInt(3, model.getManager().getId());
            stmt.setInt(4, model.getExpert().getId());
            stmt.setBoolean(5, model.isStatus());
            stmt.setString(6, model.getBody());
            stmt.setInt(7, model.getId());
            ret = stmt.executeUpdate();
        } catch (SQLException e) {
        }
        return ret;
    }

    public int changeStatus(int id) {
        int ret = 0;
        try {
            String sql = "UPDATE swp391.subject SET\n"
                    + "status = (status = false)\n"
                    + "WHERE subject_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ret = stmt.executeUpdate();
            connection.close();
        } catch (SQLException e) {
        }
        return ret;
    }

    @Override
    public void remove(Subject model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        SubjectDBContext sdbc = new SubjectDBContext();
        ArrayList<Subject> subjects = sdbc.filter(1, 4, null, null, null, "software");
        for (Subject s : subjects) {
            System.out.println(s);
        }
    }
}
