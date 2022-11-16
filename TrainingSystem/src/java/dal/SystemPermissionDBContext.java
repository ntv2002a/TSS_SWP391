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
import model.Permission;
import model.Setting;

/**
 *
 * @author ACER
 */
public class SystemPermissionDBContext extends DBContext<Permission> {
    
   
    public ArrayList<Permission> listPermissionByRole(ArrayList<Setting> roles) {
        ArrayList<Permission> perms = new ArrayList<>();
        try {
            String sql = "SELECT r.setting_id as role_id,r.setting_title as role_title,s.setting_id as screen_id,s.setting_title,s.setting_value as url,p.get_all_data,p.can_delete,p.can_add,p.can_edit FROM \n"
                    + "swp391.setting r LEFT JOIN swp391.permission p ON p.role_id = r.setting_id\n"
                    + "JOIN swp391.setting s ON s.setting_id = p.screen_id\n"
                    + "Where r.setting_id IN (";
            for (int i = 0; i < roles.size(); i++) {
                sql += "?,";
            }
            sql = sql.substring(0, sql.length() - 1);
            sql += ")";

            PreparedStatement stm = connection.prepareStatement(sql);
            for (int i = 0; i < roles.size(); i++) {
                stm.setInt(i + 1, roles.get(i).getSetting_id());
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Permission p = new Permission();
                p.setScreen_id(rs.getInt("screen_id"));
                p.setRole_id(rs.getInt("role_id"));
                p.setGet_all_data(rs.getBoolean("get_all_data"));
                p.setCan_delete(rs.getBoolean("can_delete"));
                p.setCan_add(rs.getBoolean("can_add"));
                p.setCan_edit(rs.getBoolean("can_edit"));
                p.setUrl(rs.getString("url"));
                perms.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SystemPermissionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return perms;
    }

    public ArrayList<Permission> listPermissionByScreens(ArrayList<Setting> screens) {
        ArrayList<Permission> perms = new ArrayList<>();
        try {
            String sql = "SELECT screen_id,role_id,get_all_data,can_delete,can_add,can_edit FROM swp391.permission WHERE screen_id in (";
            for (int i = 0; i < screens.size(); i++) {
                sql += "?,";
            }
            sql = sql.substring(0, sql.length() - 1);
            sql += ")";

            PreparedStatement stm = connection.prepareStatement(sql);
            for (int i = 0; i < screens.size(); i++) {
                stm.setInt(i + 1, screens.get(i).getSetting_id());
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Permission p = new Permission();
                p.setScreen_id(rs.getInt("screen_id"));
                p.setRole_id(rs.getInt("role_id"));
                p.setGet_all_data(rs.getBoolean("get_all_data"));
                p.setCan_delete(rs.getBoolean("can_delete"));
                p.setCan_add(rs.getBoolean("can_add"));
                p.setCan_edit(rs.getBoolean("can_edit"));
                perms.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SystemPermissionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return perms;
    }

    public void savePermissionsChange(ArrayList<Permission> permissions) {

        try {
            connection.setAutoCommit(false);

            for (Permission perm : permissions) {
                
                if(perm.getRole_id() == 11){
                    continue;
                }
                
                String sql = "UPDATE swp391.permission\n"
                        + "SET ";

                int count = 0;

                HashMap<Integer, Object> params = new HashMap<>();

                if (perm.getGet_all_data() != null) {
                    count++;
                    sql += "get_all_data = ?,\n";
                    params.put(count, perm.getGet_all_data());
                }

                if (perm.getCan_delete() != null) {
                    count++;
                    sql += "can_delete = ?,\n";
                    params.put(count, perm.getCan_delete());
                }

                if (perm.getCan_add() != null) {
                    count++;
                    sql += "can_add = ?,\n";
                    params.put(count, perm.getCan_add());
                }

                if (perm.getCan_edit() != null) {
                    count++;
                    sql += "can_edit = ?,\n";
                    params.put(count, perm.getCan_edit());
                }

                sql = sql.substring(0, sql.length() - 2);
                sql += " WHERE screen_id = ? AND role_id = ?";

                PreparedStatement stm = connection.prepareStatement(sql);

                for (Map.Entry<Integer, Object> entry : params.entrySet()) {
                    Integer key = entry.getKey();
                    Object val = entry.getValue();
                    stm.setObject(key, val);
                }

                count++;
                stm.setInt(count, perm.getScreen_id());
                count++;
                stm.setInt(count, perm.getRole_id());

                stm.executeUpdate();

            }
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(SystemPermissionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(SystemPermissionDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }

    }

    @Override
    public ArrayList<Permission> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Permission get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void add(Permission model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Permission model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void remove(Permission model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
