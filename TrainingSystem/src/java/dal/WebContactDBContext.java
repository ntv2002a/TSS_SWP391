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
import model.User;
import model.WebContact;

/**
 *
 * @author trungvu
 */
public class WebContactDBContext extends DBContext<WebContact> {

    @Override
    public ArrayList<WebContact> list() {
        ArrayList<WebContact> webcontacts = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "web_contact.contact_id, \n"
                    + "web_contact.category_id, \n"
                    + "web_contact.staff_id, \n"
                    + "web_contact.full_name, \n"
                    + "web_contact.email, \n"
                    + "web_contact.mobile, \n"
                    + "web_contact.message, \n"
                    + "web_contact.response \n"
                    + "FROM swp391.web_contact";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                WebContact wc = new WebContact();
                wc.setId(rs.getInt("web_contact.contact_id"));
                wc.setCategoryid(rs.getInt("web_contact.category_id"));
                User user = new User();
                user.setId(rs.getInt("web_contact.staff_id"));
                wc.setSupportid(user);
                wc.setFullname(rs.getString("web_contact.full_name"));
                wc.setEmail(rs.getString("web_contact.email"));
                wc.setMobile(rs.getString("web_contact.mobile"));
                wc.setMessage(rs.getString("web_contact.message"));
                wc.setResponse(rs.getString("web_contact.response"));
                webcontacts.add(wc);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return webcontacts;
    }

    public ArrayList<WebContact> list(int id) {
        ArrayList<WebContact> webcontacts = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "web_contact.contact_id, \n"
                    + "web_contact.category_id, \n"
                    + "web_contact.staff_id, \n"
                    + "web_contact.full_name, \n"
                    + "web_contact.email, \n"
                    + "web_contact.mobile, \n"
                    + "web_contact.message, \n"
                    + "web_contact.response \n"
                    + "FROM swp391.web_contact \n"
                    + "WHERE web_contact.suppoter_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                WebContact wc = new WebContact();
                wc.setId(rs.getInt("web_contact.contact_id"));
                wc.setCategoryid(rs.getInt("web_contact.category_id"));
                User user = new User();
                user.setId(rs.getInt("web_contact.staff_id"));
                wc.setSupportid(user);
                wc.setFullname(rs.getString("web_contact.full_name"));
                wc.setEmail(rs.getString("web_contact.email"));
                wc.setMobile(rs.getString("web_contact.mobile"));
                wc.setMessage(rs.getString("web_contact.message"));
                wc.setResponse(rs.getString("web_contact.response"));
                webcontacts.add(wc);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return webcontacts;
    }

    @Override
    public WebContact get(int id) {
        WebContact wc = new WebContact();
        try {
            String sql = "SELECT\n"
                    + "web_contact.contact_id, \n"
                    + "web_contact.category_id, \n"
                    + "web_contact.staff_id, \n"
                    + "web_contact.full_name, \n"
                    + "web_contact.email, \n"
                    + "web_contact.mobile, \n"
                    + "web_contact.message, \n"
                    + "web_contact.response \n"
                    + "FROM swp391.web_contact \n"
                    + "WHERE web_contact.contact_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                wc.setId(rs.getInt("web_contact.contact_id"));
                wc.setCategoryid(rs.getInt("web_contact.category_id"));
                User user = new User();
                user.setId(rs.getInt("web_contact.staff_id"));
                wc.setSupportid(user);
                wc.setFullname(rs.getString("web_contact.full_name"));
                wc.setEmail(rs.getString("web_contact.email"));
                wc.setMobile(rs.getString("web_contact.mobile"));
                wc.setMessage(rs.getString("web_contact.message"));
                if (rs.getString("web_contact.response") != null && rs.getString("web_contact.response").trim().length() != 0) {
                    wc.setResponse(rs.getString("web_contact.response"));
                }
            }
            connection.close();
        } catch (SQLException e) {
        }
        return wc;
    }

    public WebContact getByCategoryId(int id) {
        WebContact wc = new WebContact();
        try {
            String sql = "SELECT\n"
                    + "web_contact.contact_id, \n"
                    + "web_contact.category_id, \n"
                    + "web_contact.staff_id, \n"
                    + "web_contact.full_name, \n"
                    + "web_contact.email, \n"
                    + "web_contact.mobile, \n"
                    + "web_contact.message, \n"
                    + "web_contact.response \n"
                    + "FROM swp391.web_contact \n"
                    + "WHERE web_contact.category_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                wc.setId(rs.getInt("web_contact.contact_id"));
                wc.setCategoryid(rs.getInt("web_contact.category_id"));
                User user = new User();
                user.setId(rs.getInt("web_contact.staff_id"));
                wc.setSupportid(user);
                wc.setFullname(rs.getString("web_contact.full_name"));
                wc.setEmail(rs.getString("web_contact.email"));
                wc.setMobile(rs.getString("web_contact.mobile"));
                wc.setMessage(rs.getString("web_contact.message"));
                wc.setResponse(rs.getString("web_contact.response"));
            }
            connection.close();
        } catch (SQLException e) {
        }
        return wc;
    }

    @Override
    public void add(WebContact model) {
        try {
            String sql = "INSERT INTO `swp391`.`web_contact`\n"
                    + "(`category_id`,\n"
                    + "`full_name`,\n"
                    + "`email`,\n"
                    + "`mobile`,\n"
                    + "`message`,\n"
                    + "`response`)\n"
                    + "VALUES\n"
                    + "(?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "?,\n"
                    + "null);";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getCategoryid());
            stm.setString(2, model.getFullname());
            stm.setString(3, model.getEmail());
            stm.setString(4, model.getMobile());
            stm.setString(5, model.getMessage());
            stm.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            System.out.println("Error!");
        }
    }

    public int count(Integer sid, Integer cid, Boolean res) {
        try {
            String sql = "SELECT COUNT(*) as total FROM swp391.web_contact \n"
                    + "WHERE (1=1) ";

            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (sid != null) {
                count++;
                sql += "AND web_contact.staff_id = ? OR web_contact.staff_id is null\n";
                params.put(count, sid);
            }

            if (cid != null) {
                count++;
                sql += "AND web_contact.category_id = ?\n";
                params.put(count, cid);
            }

            if (res != null) {
                if (res == true) {
                    sql += "AND web_contact.response is not null\n";
                } else {
                    sql += "AND web_contact.response is null\n";
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
        } catch (SQLException ex) {
            Logger.getLogger(WebContactDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public ArrayList<WebContact> pagging(int pagesize, int pageindex, int sid) {
        ArrayList<WebContact> webcontacts = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "web_contact.contact_id, \n"
                    + "web_contact.category_id, \n"
                    + "web_contact.staff_id, \n"
                    + "web_contact.full_name, \n"
                    + "web_contact.email, \n"
                    + "web_contact.mobile, \n"
                    + "web_contact.message, \n"
                    + "web_contact.response \n"
                    + "FROM swp391.web_contact \n"
                    + "WHERE web_contact.suppoter_id = ? \n"
                    + "ORDER BY web_contact.contact_id ASC \n"
                    + "LIMIT ?,?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            stm.setInt(2, (pageindex - 1) * pagesize);
            stm.setInt(3, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                WebContact wc = new WebContact();
                wc.setId(rs.getInt("web_contact.contact_id"));
                wc.setCategoryid(rs.getInt("web_contact.category_id"));
                User user = new User();
                user.setId(rs.getInt("web_contact.staff_id"));
                wc.setSupportid(user);
                wc.setFullname(rs.getString("web_contact.full_name"));
                wc.setEmail(rs.getString("web_contact.email"));
                wc.setMobile(rs.getString("web_contact.mobile"));
                wc.setMessage(rs.getString("web_contact.message"));
                wc.setResponse(rs.getString("web_contact.response"));
                webcontacts.add(wc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(WebContactDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return webcontacts;
    }

    public ArrayList<WebContact> filter(int pageindex, int pagesize, Integer sid, Integer categoryid, Boolean res) {
        ArrayList<WebContact> wcs = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "web_contact.contact_id, \n"
                    + "web_contact.category_id, \n"
                    + "web_contact.staff_id, \n"
                    + "web_contact.full_name, \n"
                    + "web_contact.email, \n"
                    + "web_contact.mobile, \n"
                    + "web_contact.message, \n"
                    + "web_contact.response \n"
                    + "FROM swp391.web_contact \n"
                    + "WHERE (1=1) ";
            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (sid != null) {
                count++;
                sql += "AND (web_contact.staff_id = ? OR web_contact.staff_id is null)\n";
                params.put(count, sid);
            }

            if (categoryid != null) {
                count++;
                sql += "AND web_contact.category_id = ?\n";
                params.put(count, categoryid);
            }

            if (res != null) {
                if (res == true) {
                    sql += "AND web_contact.response is not null\n";
                } else {
                    sql += "AND web_contact.response is null\n";
                }
            }

            sql += "ORDER BY web_contact.contact_id ASC \n"
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
                WebContact wc = new WebContact();
                wc.setId(rs.getInt("web_contact.contact_id"));
                wc.setCategoryid(rs.getInt("web_contact.category_id"));
                
                UserDBContext udc = new UserDBContext();
                User user = udc.get(rs.getInt("web_contact.staff_id"));
                wc.setSupportid(user);
                wc.setFullname(rs.getString("web_contact.full_name"));
                wc.setEmail(rs.getString("web_contact.email"));
                wc.setMobile(rs.getString("web_contact.mobile"));
                wc.setMessage(rs.getString("web_contact.message"));
                wc.setResponse(rs.getString("web_contact.response"));
                wcs.add(wc);
            }
            connection.close();
        } catch (SQLException e) {

        }
        return wcs;
    }

    public ArrayList<Integer> getCategoryID() {
        ArrayList<Integer> categories = new ArrayList<>();

        try {
            String sql = "SELECT distinct web_contact.category_id FROM swp391.web_contact;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int a = rs.getInt("web_contact.category_id");
                categories.add(a);
            }
            connection.close();
        } catch (SQLException e) {
            System.out.println("Error!");
        }

        return categories;
    }

    public HashMap<Integer, String> getListCategoryID() {
        HashMap<Integer, String> categories = new HashMap<>();
        try {
            String sql = "SELECT s.setting_id as category_id, s.setting_title as title from swp391.setting s\n"
                    + "where s.type_id  = 2";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                categories.put(rs.getInt("category_id"), rs.getString("title"));
            }
        } catch (SQLException e) {
            System.out.println("Error!");
        }
        return categories;
    }

    public String getCategoryName(int id) {
        String name = "";
        try {
            String sql = "SELECT s.setting_id as category_id, s.setting_title as title from swp391.setting s\n"
                    + "where s.setting_id = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                name = rs.getString("title");
                return name;
            }
        } catch (SQLException e) {
            System.out.println("Error!");
        }
        return name;
    }

    @Override
    public void update(WebContact model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void update(String res, int id, int spId) {
        try {
            String sql = "UPDATE swp391.web_contact \n"
                    + "SET web_contact.response = ? \n"
                    + ", web_contact.staff_id = ? \n"
                    + "WHERE (web_contact.contact_id = ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, res);
            stm.setInt(2, spId);
            stm.setInt(3, id);
            stm.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void remove(WebContact model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

//    public static void main(String[] args) {
//        WebContactDBContext wdc = new WebContactDBContext();
//        WebContactDBContext wcd = new WebContactDBContext();
//        HashMap<Integer, String> categoryList = wcd.getListCategoryID();
//        
//        for (Map.Entry<Integer, String> entry : categoryList.entrySet()) {
//            System.out.println(entry.getKey() + " " + entry.getValue());
//        }
//        
//        for (Map.Entry<Integer, String> entry : categoryList.entrySet()) {
//            Object key = entry.getKey();
//            Object val = entry.getValue();
//            
//        }
//    }
}
