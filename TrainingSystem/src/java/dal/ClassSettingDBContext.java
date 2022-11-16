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
import model.ClassSetting;
import model.Setting;
import model.User;

/**
 *
 * @author ACER
 */
public class ClassSettingDBContext extends DBContext<ClassSetting>{

    public ArrayList<ClassSetting> getClassSettingListWithFilter(int pageindex, int pagesize, Integer type, Boolean status, String title, String value) {
        ArrayList<ClassSetting> sets = new ArrayList<>();
        try {
            String sql = "SELECT s.setting_id,t.setting_title as type,t.setting_id as type_id,s.setting_title,s.setting_value,s.display_order,s.status\n"
                    + "FROM swp391.class_setting s LEFT JOIN swp391.setting t \n"
                    + "ON s.type_id = t.setting_id\n"
                    + "WHERE (1=1) ";

            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (type != null) {
                count++;
                sql += "AND t.setting_id = ?\n";
                params.put(count, type);
            }

            if (status != null) {
                count++;
                sql += "AND s.status = ?\n";
                params.put(count, status);
            }

            if (title != null) {
                count++;
                sql += "AND s.setting_title like ?\n";
                title = "%" + title + "%";
                params.put(count, title);
            }
            
            if (value != null) {
                count++;
                sql += "AND s.setting_value like ?\n";
                title = "%" + value + "%";
                params.put(count, value);
            }
            
            sql += "ORDER BY s.setting_id ASC\n"
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
                ClassSetting s = new ClassSetting();
                s.setSetting_id(rs.getInt("setting_id"));
                Setting t = new Setting();
                t.setSetting_title(rs.getString("type"));
                t.setSetting_id(rs.getInt("type_id"));
                s.setType_id(t);
                s.setSetting_title(rs.getString("setting_title"));
                s.setSetting_value(rs.getString("setting_value"));
                s.setDisplay_order(rs.getString("display_order"));
                s.setStatus(rs.getBoolean("status"));
                sets.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClassSettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return sets;
    }

    public int count(Integer type, Boolean status, String title, String value) {
        try {
            String sql = "SELECT COUNT(*) as total FROM swp391.class_setting\n"
                    + "WHERE (1=1) ";
            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (type != null) {
                count++;
                sql += "AND type_id = ?\n";
                params.put(count, type);
            }

            if (status != null) {
                count++;
                sql += "AND status = ?\n";
                params.put(count, status);
            }

            if (title != null) {
                count++;
                sql += "AND setting_title like ?\n";
                title = "%" + title + "%";
                params.put(count, title);
            }
            
            if (value != null) {
                count++;
                sql += "AND s.setting_value like ?\n";
                title = "%" + value + "%";
                params.put(count, value);
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
        } catch (SQLException ex) {
            Logger.getLogger(SettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    public void saveClassSettingChange(User u, ClassSetting cs) {
        try {
            String sql = "UPDATE swp391.class_setting\n"
                    + "SET ";

            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (cs.getType_id().getSetting_id() != -1) {
                count++;
                sql += "type_id = ?,\n";
                params.put(count, cs.getType_id().getSetting_id());
            }

            if (cs.getStatus() != null) {
                count++;
                sql += "status = ?,\n";
                params.put(count, cs.getStatus());
            }

            if (cs.getSetting_title() != null) {
                count++;
                sql += "setting_title = ?,\n";
                params.put(count, cs.getSetting_title());
            }

            if (cs.getSetting_value() != null) {
                count++;
                sql += "setting_value = ?,\n";
                params.put(count, cs.getSetting_value());
            }

            if (cs.getDisplay_order() != null) {
                count++;
                sql += "display_order = ?,\n";
                params.put(count, cs.getDisplay_order());
            }

            if (cs.getDescription() != null) {
                count++;
                sql += "description = ?,\n";
                params.put(count, cs.getDescription());
            }

            sql = sql.substring(0, sql.length() - 2);
            //sql += "modified_by = " + u.getId() + ", ";
            //sql += "modified_at = NOW() ";
            sql += " WHERE setting_id = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);

            for (Map.Entry<Integer, Object> entry : params.entrySet()) {
                Integer key = entry.getKey();
                Object val = entry.getValue();
                stm.setObject(key, val);
            }

            count++;
            stm.setInt(count, cs.getSetting_id());

            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(SettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    
    @Override
    public ArrayList<ClassSetting> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ClassSetting get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void add(ClassSetting model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(ClassSetting model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void remove(ClassSetting model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
