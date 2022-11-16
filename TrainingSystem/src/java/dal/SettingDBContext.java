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
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ClassSetting;
import model.Setting;
import model.User;

/**
 *
 *
 * @author Lenovo
 */
public class SettingDBContext extends DBContext<Setting> {

    public ArrayList<Setting> listUserRole(User u) {
        Connection connection = open();
        ArrayList<Setting> settings = new ArrayList<>();
        try {
            String sql = "SELECT r.setting_id as role_id,r.setting_title as role_title FROM \n"
                    + "swp391.user u LEFT JOIN swp391.user_role ur ON u.user_id = ur.user_id\n"
                    + "LEFT JOIN swp391.setting r ON ur.role_id = r.setting_id\n"
                    + "Where u.user_id = ?;";
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, u.getId());

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                setting.setSetting_id(rs.getInt("role_id"));
                setting.setSetting_title(rs.getString("role_title"));
                settings.add(setting);
            }
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return settings;
    }

    public ArrayList<Setting> listRole() {
        ArrayList<Setting> settings = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT\n"
                    + "setting.setting_id, \n"
                    + "setting.setting_title\n"
                    + "FROM swp391.setting WHERE setting.type_id = 1 AND setting.status = 1";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                setting.setSetting_id(rs.getInt("setting.setting_id"));
                setting.setSetting_title(rs.getString("setting.setting_title"));
                settings.add(setting);
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return settings;
    }

    public ArrayList<Setting> listRoleAdminAndGuest() {
        ArrayList<Setting> settings = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT\n"
                    + "setting.setting_id, \n"
                    + "setting.setting_title\n"
                    + "FROM swp391.setting WHERE setting.type_id = 1 AND setting.status = 1 AND setting.setting_id NOT IN (11,17) ";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                setting.setSetting_id(rs.getInt("setting.setting_id"));
                setting.setSetting_title(rs.getString("setting.setting_title"));
                settings.add(setting);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return settings;
    }

    public ArrayList<Setting> listScreenWithPagination(int pageindex, int pagesize) {
        ArrayList<Setting> settings = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT\n"
                    + "setting.setting_id, \n"
                    + "setting.setting_title\n"
                    + "FROM swp391.setting WHERE setting.type_id = 5 AND setting.status = TRUE AND setting.setting_id >= 25\n"
                    + "ORDER BY setting_id ASC\n"
                    + "LIMIT ?,?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, (pageindex - 1) * pagesize);
            stm.setInt(2, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                setting.setSetting_id(rs.getInt("setting.setting_id"));
                setting.setSetting_title(rs.getString("setting.setting_title"));
                settings.add(setting);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return settings;
    }

    public ArrayList<Setting> getSettingListWithFilter(int pageindex, int pagesize, Integer type, Boolean status, String title) {
        ArrayList<Setting> sets = new ArrayList<>();
        try {
            String sql = "SELECT s.setting_id,t.setting_title as type,t.setting_id as type_id,s.setting_title,s.setting_value,s.display_order,s.status\n"
                    + "FROM swp391.setting s LEFT JOIN swp391.setting t \n"
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
                Setting s = new Setting();
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
            Logger.getLogger(SettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return sets;
    }
    
    public ArrayList<Setting> listByType(int typeID) {
        ArrayList<Setting> list = new ArrayList<>();
        try {
            String sql = "SELECT setting_id, setting_title, setting_value,\n"
                    + "display_order, status, description FROM swp391.setting\n"
                    + "WHERE type_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, typeID);
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                setting.setSetting_id(rs.getInt("setting_id"));
                setting.setSetting_title(rs.getString("setting_title"));
                setting.setSetting_value(rs.getString("setting_value"));
                setting.setDisplay_order(rs.getString("display_order"));
                setting.setStatus(rs.getBoolean("status"));
                setting.setDescription(rs.getString("description"));
                list.add(setting);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int count(Integer type, Boolean status, String title) {
        try {
            String sql = "SELECT COUNT(*) as total FROM swp391.setting\n"
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

    public int countScreen() {
        try {
            String sql = "SELECT COUNT(*) as total "
                    + "FROM swp391.setting WHERE setting.type_id = 5 AND setting.status = TRUE AND setting.setting_id >= 25";

            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public ArrayList<Setting> listType() {
        ArrayList<Setting> types = new ArrayList<>();
        String sql = "SELECT * FROM swp391.setting WHERE type_id is null";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Setting type = new Setting();
                type.setSetting_id(rs.getInt("setting_id"));
                type.setSetting_title(rs.getString("setting_title"));
                types.add(type);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return types;
    }

    public ArrayList<Setting> listClassSettingType() {
        ArrayList<Setting> types = new ArrayList<>();
        String sql = "SELECT * FROM swp391.setting WHERE type_id = 3";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Setting type = new Setting();
                type.setSetting_id(rs.getInt("setting_id"));
                type.setSetting_title(rs.getString("setting_title"));
                types.add(type);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return types;
    }

    public Setting getSettingByID(int id) {

        try {
            String sql = "SELECT s.setting_id,t.setting_title as type,\n"
                    + "CASE\n"
                    + "    WHEN t.setting_id IS NULL THEN -1\n"
                    + "    ELSE t.setting_id \n"
                    + "END\n"
                    + "as type_id ,s.setting_title,s.setting_value,s.display_order,s.status,s.description\n"
                    + "FROM swp391.setting s LEFT JOIN swp391.setting t \n"
                    + "ON s.type_id = t.setting_id \n"
                    + "WHERE s.setting_id = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Setting setting = new Setting();
                setting.setSetting_id(rs.getInt("setting_id"));
                setting.setSetting_title(rs.getString("setting_title"));
                setting.setSetting_value(rs.getString("setting_value"));
                setting.setDisplay_order(rs.getString("display_order"));
                setting.setStatus(rs.getBoolean("status"));
                setting.setDescription(rs.getString("description"));
                Setting type = new Setting();
                type.setSetting_title(rs.getString("type"));
                type.setSetting_id(rs.getInt("type_id"));
                setting.setType_id(type);

                return setting;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void saveSettingChange(User u, Setting s) {
        try {
            String sql = "UPDATE swp391.setting\n"
                    + "SET ";

            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (s.getType_id().getSetting_id() != -1) {
                count++;
                sql += "type_id = ?,\n";
                params.put(count, s.getType_id().getSetting_id());
            }

            if (s.getStatus() != null) {
                count++;
                sql += "status = ?,\n";
                params.put(count, s.getStatus());
            }

            if (s.getSetting_title() != null) {
                count++;
                sql += "setting_title = ?,\n";
                params.put(count, s.getSetting_title());
            }

            if (s.getSetting_value() != null) {
                count++;
                sql += "setting_value = ?,\n";
                params.put(count, s.getSetting_value());
            }

            if (s.getDisplay_order() != null) {
                count++;
                sql += "display_order = ?,\n";
                params.put(count, s.getDisplay_order());
            }

            if (s.getDescription() != null) {
                count++;
                sql += "description = ?,\n";
                params.put(count, s.getDescription());
            }

            //sql = sql.substring(0, sql.length() - 2);
            sql += "modified_by = " + u.getId() + ", ";
            sql += "modified_at = NOW() ";
            sql += "WHERE setting_id = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);

            for (Map.Entry<Integer, Object> entry : params.entrySet()) {
                Integer key = entry.getKey();
                Object val = entry.getValue();
                stm.setObject(key, val);
            }

            count++;
            stm.setInt(count, s.getSetting_id());

            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(SettingDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void add(User u, Setting s) {
        try {
            String sql = "INSERT INTO `swp391`.`setting`\n"
                    + "(`type_id`,`setting_title`,`setting_value`,`display_order`,`status`,`description`,`created_by`,`created_at`)\n"
                    + "VALUES\n"
                    + "(?,?,?,?,?,?,?,NOW());";
            PreparedStatement stmt = connection.prepareStatement(sql);
            Integer typeid = (s.getType_id().getSetting_id() == -1) ? null : s.getType_id().getSetting_id();
            stmt.setObject(1, typeid);
            stmt.setString(2, s.getSetting_title());
            stmt.setString(3, s.getSetting_value());
            stmt.setString(4, s.getDisplay_order());
            stmt.setBoolean(5, s.getStatus());
            stmt.setString(6, s.getDescription());
            stmt.setInt(7, u.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public ArrayList<Setting> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Setting get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void add(Setting model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Setting model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void remove(Setting model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
