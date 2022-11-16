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
import model.Setting;
import model.Subject;
import model.SubjectSetting;

/**
 *
 * @author duyng
 */
public class SubjectSettingDBContext extends DBContext<SubjectSetting> {

    @Override
    public ArrayList<SubjectSetting> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<SubjectSetting> filter(Integer typeID, String namepart, int pageindex, int pagesize) {
        ArrayList<SubjectSetting> list = new ArrayList<>();
        try {
            String sql = "SELECT s1.setting_id, s1.type_id AS 'subject_setting_type_id', \n"
                    + "s2.setting_title AS 'subject_setting_type_title', s2.type_id, \n"
                    + "s4.setting_title AS 'type_title', s2.setting_value, s1.status, \n"
                    + "s1.subject_id, s3.subject_code, s3.subject_name, s1.description FROM swp391.subject_setting s1\n"
                    + "LEFT JOIN swp391.setting s2 ON s1.type_id = s2.setting_id\n"
                    + "LEFT JOIN swp391.subject s3 ON s1.subject_id = s3.subject_id\n"
                    + "LEFT JOIN swp391.setting s4 ON s2.type_id = s4.setting_id\n"
                    + "WHERE s1.status = 1 \n"
                    + "AND s3.subject_name LIKE '%" + namepart + "%'";
            connection = open();

            HashMap<Integer, Object> params = new HashMap<>();
            int count = 0;
            if (typeID != null) {
                count++;
                params.put(count, typeID);
                sql += "\nAND s2.type_id = ?";
            }

            sql += "\nORDER BY s1.setting_id ASC"
                    + "\nLIMIT ?, ?;";

            PreparedStatement stmt = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : params.entrySet()) {
                stmt.setObject(entry.getKey(), entry.getValue());
            }
            count++;
            stmt.setInt(count, (pageindex - 1) * pagesize);
            count++;
            stmt.setInt(count, pagesize);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                SubjectSetting ss = new SubjectSetting();
                ss.setSetting_id(rs.getInt("setting_id"));

                Setting type = new Setting();
                type.setSetting_id(rs.getInt("subject_setting_type_id"));
                type.setType_id(new Setting(rs.getInt("type_id"), null, rs.getString("type_title"), null, null, true, null));
                ss.setType_id(type);

                ss.setSetting_title(rs.getString("subject_setting_type_title"));
                ss.setSetting_value(rs.getString("setting_value"));
                ss.setStatus(rs.getBoolean("status"));
                ss.setDescription(rs.getString("description"));

                Subject subject = new Subject();
                subject.setId(rs.getInt("subject_id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                ss.setSubject(subject);

                list.add(ss);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return list;
    }

    public int countFilter(Integer typeID, String namepart) {
        int result = 0;
        try {
            String sql = "SELECT COUNT(*) AS 'total' FROM swp391.subject_setting s1\n"
                    + "LEFT JOIN swp391.setting s2 ON s1.type_id = s2.setting_id\n"
                    + "LEFT JOIN swp391.subject s3 ON s1.subject_id = s3.subject_id\n"
                    + "WHERE s1.status = 1 \n"
                    + "AND s3.subject_name LIKE '%" + namepart + "%'";
            connection = open();

            HashMap<Integer, Object> params = new HashMap<>();
            int count = 0;
            if (typeID != null) {
                count++;
                params.put(count, typeID);
                sql += "\nAND s2.type_id = ?";
            }

            PreparedStatement stmt = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object> entry : params.entrySet()) {
                stmt.setObject(entry.getKey(), entry.getValue());
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                result = rs.getInt("total");
            }
            connection.close();
        } catch (SQLException e) {
        }
        return result;
    }

    @Override
    public SubjectSetting get(int id) {
        connection = open();
        SubjectSetting ss = new SubjectSetting();
        try {
            String sql = "SELECT s1.setting_id, s1.type_id AS 'subject_setting_type_id', \n"
                    + "s2.setting_title AS 'subject_setting_type_title', s2.type_id, \n"
                    + "s4.setting_title AS 'type_title', s2.setting_value, s1.status, \n"
                    + "s1.subject_id, s3.subject_code, s3.subject_name, s1.description FROM swp391.subject_setting s1\n"
                    + "LEFT JOIN swp391.setting s2 ON s1.type_id = s2.setting_id\n"
                    + "LEFT JOIN swp391.subject s3 ON s1.subject_id = s3.subject_id\n"
                    + "LEFT JOIN swp391.setting s4 ON s2.type_id = s4.setting_id\n"
                    + "WHERE s1.setting_id = ?;";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ss.setSetting_id(rs.getInt("setting_id"));

                Setting type = new Setting();
                type.setSetting_id(rs.getInt("subject_setting_type_id"));
                type.setType_id(new Setting(rs.getInt("type_id"), null, rs.getString("type_title"), null, null, true, null));
                ss.setType_id(type);

                ss.setSetting_title(rs.getString("subject_setting_type_title"));
                ss.setSetting_value(rs.getString("setting_value"));
                ss.setStatus(rs.getBoolean("status"));
                ss.setDescription(rs.getString("description"));

                Subject subject = new Subject();
                subject.setId(rs.getInt("subject_id"));
                subject.setCode(rs.getString("subject_code"));
                subject.setName(rs.getString("subject_name"));
                ss.setSubject(subject);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return ss;
    }

    @Override
    public void add(SubjectSetting model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(SubjectSetting model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int updateSubjectSetting(SubjectSetting model) {
        int state = 0;
        connection = open();
        try {
            String sql = "UPDATE swp391.subject_setting SET \n"
                    + "type_id = ?,\n"
                    + "description = ?\n"
                    + "WHERE setting_id = ?;";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, model.getType_id().getSetting_id());
            stmt.setString(2, model.getDescription());
            stmt.setInt(3, model.getSetting_id());

            state = stmt.executeUpdate();
            connection.close();
        } catch (SQLException e) {
        }
        return state;
    }

    public int changeStatus(int id) {
        int actionStatus = 0;
        connection = open();
        try {
            String sql = "UPDATE swp391.subject_setting SET\n"
                    + "status = (status = false)\n"
                    + "WHERE setting_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            actionStatus = stmt.executeUpdate();
        } catch (SQLException e) {
        }
        return actionStatus;
    }

    public ArrayList<Integer> getSettingIdsOfSubject(int subjectID) {
        ArrayList<Integer> list = new ArrayList<>();
        connection = open();
        try {
            String sql = "SELECT setting_id FROM swp391.subject_setting\n"
                    + "WHERE subject_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, subjectID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("setting_id");
                list.add(id);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public void remove(SubjectSetting model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        SubjectSettingDBContext ssdb = new SubjectSettingDBContext();
        ArrayList<SubjectSetting> list = ssdb.filter(null, "", 1, 20);
        for (SubjectSetting ss : list) {
            System.out.println(ss);
        }
    }
}
