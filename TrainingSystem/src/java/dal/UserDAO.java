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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;
import model.RoleList;
import model.User;

/**
 *
 * @author duyng
 */
public class UserDAO extends DBContext<User> {

    PreparedStatement stmt;
    ResultSet rs;

    @Override
    public ArrayList<User> list() {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "user.user_id, \n"
                    + "user.full_name, \n"
                    + "user.email, \n"
                    + "user.mobile, \n"
                    + "user.password, \n"
                    + "user.avatar_url, \n"
                    + "user.status, \n"
                    + "user.note\n"
                    + "FROM swp391.user";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("user.user_id"));
                user.setFullname(rs.getString("user.full_name"));
                user.setEmail(rs.getString("user.email"));
                user.setMobile(rs.getString("user.mobile"));
                user.setPassword(rs.getString("user.password"));
                user.setAvatarurl(rs.getString("user.avatar_url"));
                user.setStatus(rs.getInt("user.status"));
                user.setNote(rs.getString("user.note"));
                users.add(user);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return users;
    }

    public User getAccount(String email, String password) {
        User user = new User();
        try {
            connection = DBContext.open();
            String sql = "select * from swp391.user where email=? and password = ?;";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);
            rs = stmt.executeQuery();
            while (rs.next()) {

                user.setId(rs.getInt("user_id"));
                user.setFullname(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setMobile(rs.getString("mobile"));
                user.setPassword(rs.getString("password"));
                user.setAvatarurl(rs.getString("avatar_url"));
                user.setStatus(rs.getInt("status"));
                user.setNote(rs.getString("note"));

                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBContext.close(connection, stmt);
        }
        return null;
    }

    public User getAccountemail(String email) {
        User user = new User();
        try {
            connection = DBContext.open();
            String sql = "select * from swp391.user where email=?;";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, email);
            rs = stmt.executeQuery();
            while (rs.next()) {

                user.setId(rs.getInt("user_id"));
                user.setFullname(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setMobile(rs.getString("mobile"));
                user.setPassword(rs.getString("password"));
                user.setAvatarurl(rs.getString("avatar_url"));
                user.setStatus(rs.getInt("status"));
                user.setNote(rs.getString("note"));

                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBContext.close(connection, stmt);
        }
        return null;
    }

    public User checkEmail(String email) {
        User user = new User();
        try {
            connection = DBContext.open();
            String sql = "select * from swp391.user where email=?";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, email);
            rs = stmt.executeQuery();
            while (rs.next()) {
                user.setId(rs.getInt("user_id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBContext.close(connection, stmt);
        }
        return null;
    }

    public User checkUid(String uid) {
        User user = new User();
        try {
            connection = DBContext.open();
            String sql = "select * from swp391.user where user_id=?;";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, uid);
            rs = stmt.executeQuery();
            while (rs.next()) {
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBContext.close(connection, stmt);
        }
        return null;
    }

    public User addUser(String name, String email, String password) {
        try {
            connection = DBContext.open();
            String sql = "INSERT INTO swp391.user (user.full_name, user.email, user.password, user.avatar_url, user.status) VALUES(?, ?, ?, ?, ?);";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, "");
            stmt.setInt(5, 1);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBContext.close(connection, stmt);
        }
        return null;
    }

    public User addUserGoogle(String name, String email, String password, String avatar) {
        try {
            connection = DBContext.open();
            String sql = "INSERT INTO swp391.user VALUES(NULL,?,?,'',?,'', NULL, NULL, NULL,1,'', NULL, NULL, NULL, NULL);";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBContext.close(connection, stmt);
        }
        return null;
    }

    public User updatePass(String pass, String uid) {
        try {
            connection = DBContext.open();
            String sql = "Update swp391.user set password=?, modified_by=?, modified_at=? where user_id = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, pass);
            stmt.setString(2, uid);
            stmt.setObject(3, LocalDateTime.now());
            stmt.setString(4, uid);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBContext.close(connection, stmt);
        }
        return null;
    }

    public User updatePassMail(String pass, String mail) {
        try {
            connection = DBContext.open();
            String sql = "update swp391.user set password = ?, modified_at=? where user_id in (select * from (select DISTINCT user_id from swp391.user where email = ?) as t)";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, pass);
            stmt.setObject(2, LocalDateTime.now());
            stmt.setString(3, mail);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DBContext.close(connection, stmt);
        }
        return null;
    }

    //INSERT INTO `user` VALUES (Null,'Nguyen The Duy','duynthe164001@fpt.edu.vn','','12345','','', '','');
    public RoleList listRole(int user_id) {
        RoleList roles = new RoleList();
        try {
            connection = DBContext.open();
            String sql = "SELECT s.setting_id, s.setting_title\n"
                    + "FROM swp391.user_role u \n"
                    + "LEFT JOIN swp391.setting s \n"
                    + "ON u.role_id = s.setting_id\n"
                    + "WHERE u.user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, user_id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("setting_id");
                String title = rs.getString("setting_title");
                roles.add(new Role(id, title));
            }
            connection.close();
        } catch (SQLException e) {
        }
        return roles;
    }

    @Override
    public User get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void add(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void remove(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
