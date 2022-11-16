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
import model.Subject;
import model.User;
import model.Class;
import model.Subject;

/**
 *
 * @author duyng
 */
public class UserDBContext extends DBContext<User> {

    public void update(User model, int userId) {
        try {
            String sql = "UPDATE swp391.user SET \n"
                    + "user.full_name = ?, \n"
                    + "user.email = ?, \n"
                    + "user.mobile = ?, \n"
                    + "user.password = ?, \n"
                    + "user.avatar_url = ?, \n"
                    + "user.status = ?, \n"
                    + "user.note = ?, \n"
                    + "user.modified_by = ?,\n"
                    + "user.modified_at = ?\n"
                    + "WHERE user.user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, model.getFullname());
            stmt.setString(2, model.getEmail());
            stmt.setString(3, model.getMobile());
            stmt.setString(4, model.getPassword());
            stmt.setString(5, model.getAvatarurl());
            stmt.setInt(6, model.getStatus());
            stmt.setString(7, model.getNote());
            stmt.setInt(8, userId);
            stmt.setObject(9, LocalDateTime.now());
            stmt.setInt(10, model.getId());
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<User> listByRole(int roleid) {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "SELECT user_id, full_name, email, mobile, avatar_url, status, note FROM swp391.user\n"
                    + "WHERE user_id IN (SELECT user_id FROM swp391.user_role WHERE role_id = ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, roleid);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("user_id"));
                user.setFullname(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setMobile(rs.getString("mobile"));
                user.setAvatarurl(rs.getString("avatar_url"));
                user.setStatus(rs.getInt("status"));
                user.setNote(rs.getString("note"));
                users.add(user);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return users;
    }

    public void deleteById(int id) {
        try {
            String sql = "DELETE FROM swp391.user WHERE user.user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateStatus(int status, int id, int userId) {
        try {
            String sql = "UPDATE swp391.user SET \n"
                    + "user.status = ?, \n"
                    + "user.modified_by = ?, \n"
                    + "user.modified_at = ?"
                    + "WHERE user.user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, status);
            stmt.setInt(2, userId);
            stmt.setObject(3, LocalDateTime.now());
            stmt.setInt(4, id);
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void addUserRole(int userId, int settingId, int adminId) {
        try {
            String sql = "INSERT INTO swp391.user_role (user_role.user_id, user_role.setting_id, user_role.created_by, user_role.created_at)\n"
                    + "VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setInt(2, settingId);
            stmt.setInt(3, adminId);
            stmt.setObject(4, LocalDateTime.now());
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void deleteUserRole(int id) {
        try {
            String sql = "DELETE FROM swp391.user_role WHERE user_role.user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<User> listUserWithFilter(int pageindex, int pagesize, Integer role, Integer status, String title) {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "SELECT u.user_id, u.full_name, u.email, u.mobile, u.status, group_concat(s.setting_title) AS role FROM swp391.user u\n"
                    + "join swp391.user_role ur on ur.user_id = u.user_id\n"
                    + "join swp391.setting s on ur.role_id = s.setting_id\n"
                    + "WHERE (1=1)\n";
            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (role != -1) {
                count++;
                sql += "AND ur.role_id = ?\n";
                params.put(count, role);
            }

            if (status != -1) {
                count++;
                sql += "AND u.status = ?\n";
                params.put(count, status);
            }

            if (title != null) {
                sql += "AND (u.full_name like ? OR u.email like ? OR u.mobile like ?)\n";
                title = "%" + title + "%";
                for (int i = 0; i < 3; i++) {
                    count++;
                    params.put(count, title);
                }
            }
            sql += "group by u.user_id, u.full_name, u.email, u.mobile, u.status\n"
                    + "ORDER BY u.user_id ASC\n"
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
                User user = new User();
                user.setId(rs.getInt("u.user_id"));
                user.setFullname(rs.getString("u.full_name"));
                user.setEmail(rs.getString("u.email"));
                user.setMobile(rs.getString("u.mobile"));
                user.setStatus(rs.getInt("u.status"));
                user.setRole(rs.getString("role"));
                users.add(user);
            }
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return users;
    }

    public int count(Integer role, Integer status, String title) {
        try {
            String sql = "SELECT COUNT(distinct u.user_id) as total FROM swp391.user u JOIN swp391.user_role ur on ur.user_id = u.user_id\n"
                    + "WHERE (1=1) ";
            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (role != -1) {
                count++;
                sql += "AND ur.role_id = ?\n";
                params.put(count, role);
            }

            if (status != -1) {
                count++;
                sql += "AND u.status = ?\n";
                params.put(count, status);
            }

            if (title != null) {
                sql += "AND (u.full_name like ? OR u.email like ? OR u.moblie like ?)\n";
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

    public HashMap<String, Integer> getUserRole(int id) {
        HashMap<String, Integer> userRoles = new HashMap<>();
        try {
            String sql = "SELECT\n"
                    + "user_role.user_id, \n"
                    + "user_role.role_id \n"
                    + "FROM swp391.user_role WHERE user_role.user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("user_role.user_id");
                int settingId = rs.getInt("user_role.role_id");
                userRoles.put(userId + settingId + "", settingId);
            }
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return userRoles;
    }

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
            System.out.println(e.getMessage());
        }
        return users;
    }
    
    public ArrayList<User> listTraineeInAClass(int classid) {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "SELECT u.user_id,u.full_name,u.email,u.mobile,u.avatar_url,u.address,u.position,u.company,\n"
                    + "c.class_id,c.class_code,c.subject_id,s.subject_code,c.trainer_id,t.full_name as trainer_name\n"
                    + "FROM \n"
                    + "swp391.user u JOIN swp391.class_user cu ON u.user_id = cu.user_id\n"
                    + "JOIN swp391.class c ON cu.class_id = c.class_id\n"
                    + "JOIN swp391.subject s ON s.subject_id = c.subject_id\n"
                    + "JOIN swp391.user t ON t.user_id = c.trainer_id\n"
                    + "Where c.class_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, classid);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("user_id"));
                user.setFullname(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setMobile(rs.getString("mobile"));
                user.setAvatarurl(rs.getString("avatar_url"));
                user.setAddress(rs.getString("address"));
                user.setPosition(rs.getString("position"));
                user.setCompany(rs.getString("company"));
                model.Class c = new model.Class();
                c.setClass_id(rs.getInt("class_id"));
                c.setClass_code(rs.getString("class_code"));
                Subject s = new Subject();
                s.setId(rs.getInt("subject_id"));
                s.setCode(rs.getString("subject_code"));
                c.setSubject_id(s);
                User trainer = new User();
                trainer.setId(rs.getInt("trainer_id"));
                trainer.setFullname(rs.getString("trainer_name"));
                users.add(user);
            }
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return users;
    }

    @Override
    public User get(int id) {
        User user = new User();
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
                    + "FROM swp391.user\n"
                    + "WHERE user.user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                user.setId(rs.getInt("user.user_id"));
                user.setFullname(rs.getString("user.full_name"));
                user.setEmail(rs.getString("user.email"));
                user.setMobile(rs.getString("user.mobile"));
                user.setPassword(rs.getString("user.password"));
                user.setAvatarurl(rs.getString("user.avatar_url"));
                user.setStatus(rs.getInt("user.status"));
                user.setNote(rs.getString("user.note"));
            }
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return user;
    }

    @Override
    public void add(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(User model) {
        try {
            String sql = "UPDATE swp391.user SET \n"
                    + "user.full_name = ?, \n"
                    + "user.email = ?, \n"
                    + "user.mobile = ?, \n"
                    + "user.password = ?, \n"
                    + "user.avatar_url = ?, \n"
                    + "user.status = ?, \n"
                    + "user.note = ?\n"
                    + "WHERE user.user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, model.getFullname());
            stmt.setString(2, model.getEmail());
            stmt.setString(3, model.getMobile());
            stmt.setString(4, model.getPassword());
            stmt.setString(5, model.getAvatarurl());
            stmt.setInt(6, model.getStatus());
            stmt.setString(7, model.getNote());
            stmt.setInt(8, model.getId());
            stmt.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<User> listTraieeInAClass(int classid) {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "SELECT u.user_id,u.full_name,u.email,u.mobile,u.avatar_url,u.address,u.position,u.company,\n"
                    + "c.class_id,c.class_code,c.subject_id,s.subject_code,c.trainer_id,t.full_name as trainer_name\n"
                    + "FROM \n"
                    + "swp391.user u JOIN swp391.class_user cu ON u.user_id = cu.user_id\n"
                    + "JOIN swp391.class c ON cu.class_id = c.class_id\n"
                    + "JOIN swp391.subject s ON s.subject_id = c.subject_id\n"
                    + "JOIN swp391.user t ON t.user_id = c.trainer_id\n"
                    + "Where c.class_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, classid);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("user_id"));
                user.setFullname(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setMobile(rs.getString("mobile"));
                user.setAvatarurl(rs.getString("avatar_url"));
                user.setAddress(rs.getString("address"));
                user.setPosition(rs.getString("position"));
                user.setCompany(rs.getString("company"));
                Class c = new Class();
                c.setClass_id(rs.getInt("class_id"));
                c.setClass_code(rs.getString("class_code"));
                Subject s = new Subject();
                s.setId(rs.getInt("subject_id"));
                s.setCode(rs.getString("subject_code"));
                c.setSubject_id(s);
                User trainer = new User();
                trainer.setId(rs.getInt("trainer_id"));
                trainer.setFullname(rs.getString("trainer_name"));
                users.add(user);
            }
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return users;
    }

    @Override
    public void remove(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<User> getWaitingTraineeList(int class_id, int status) {
        ArrayList<User> trainees = new ArrayList<>();
        try {
            String sql1 = "select u.user_id, u.full_name, u.email, u.status from swp391.user u \n"
                    + "join swp391.user_role ur on u.user_id = ur.user_id\n"
                    + "join swp391.class_user cu on u.user_id = cu.user_id\n"
                    + "where ur.role_id = 53 ";
            
            int count = 0;
            HashMap<Integer, Object> params = new HashMap<>();
            
            if (class_id != -1) {
                count++;
                sql1 += "and cu.class_id = ? ";
                params.put(count, class_id);
            }
            
            if (status != -1) {
                count++;
                sql1 += "and u.status = ? ";
                params.put(count, status);
            }

            String sql2 = "and u.user_id not in\n"
                    + "(select u.user_id from swp391.user u \n"
                    + "join swp391.team_member tm on u.user_id = tm.user_id\n"
                    + "join swp391.user_role ur on u.user_id = ur.user_id\n"
                    + "where ur.role_id = 53);";
            
            String sql = sql1 + sql2;
            
            PreparedStatement stm = connection.prepareStatement(sql);
            
            for (Map.Entry<Integer, Object> entry : params.entrySet()) {
                Integer key = entry.getKey();
                Object val = entry.getValue();
                stm.setObject(key, val);
            }
            
            ResultSet rs = stm.executeQuery();
            
            while (rs.next()) {
                User trainee = new User();
                trainee.setId(rs.getInt("user_id"));
                trainee.setFullname(rs.getString("full_name"));
                trainee.setEmail(rs.getString("email"));
                trainee.setStatus(rs.getInt("status"));
                
                trainees.add(trainee);
            }
            connection.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return trainees;
    }
}
