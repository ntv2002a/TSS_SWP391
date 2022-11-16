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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.ClassUser;
import model.Milestone;
import model.Team;
import model.User;
import model.Class;

/**
 *
 * @author trung
 */
public class TeamDBContext extends DBContext<Team> {

    @Override
    public ArrayList<Team> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Team get(int id) {
        Connection connection = open();
        try {
            String sql = "SELECT team.team_id,\n"
                    + "team.class_id,\n"
                    + "team.team_code,\n"
                    + "team.topic_name,\n"
                    + "team.status,\n"
                    + "team.description \n"
                    + "FROM swp391.team where team.team_id = ?;";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Team t = new Team();
                t.setTeam_id(rs.getInt("team.team_id"));

                Class c = new Class();
                c.setClass_id(rs.getInt("team.class_id"));

                t.setClass_id(c);
                t.setTeam_code(rs.getString("team.team_code"));
                t.setTopic_name(rs.getString("team.topic_name"));
                t.setStatus(rs.getBoolean("team.status"));
                t.setDescription(rs.getString("team.description"));

                return t;
            }
            connection.close();
        } catch (SQLException e) {
            System.out.println("Errol!");
        }
        return null;
    }

    @Override
    public void add(Team model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int adds(Team model) {
        Connection connection = open();
        int status = 0;
        try {
            String sql1 = "INSERT INTO `swp391`.`team` (`class_id`, `team_code`, `topic_name`, `status`";
            String sql2 = " VALUES (?, ?, ?, ?";
            int flag = 0;
            if (model.getDescription() != null) {
                flag = 1;
                sql1 += ", `description`)";
                sql2 += ", ?)";
            } else {
                sql1 += ")";
                sql2 += ")";
            }

            String sql = sql1 + sql2;
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, model.getClass_id().getClass_id());
            stm.setString(2, model.getTeam_code());
            stm.setString(3, model.getTopic_name());
            stm.setBoolean(4, model.getStatus());
            if (flag == 1) {
                stm.setString(5, model.getDescription());
            }

            status = stm.executeUpdate();
            if (status > 0) {
                ResultSet rs = stm.getGeneratedKeys();
                if (rs.next()) {
                    status = rs.getInt(1);
                }
            }
            connection.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    @Override
    public void update(Team model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int updates(Team model) {
        Connection connection = open();
        int status = 0;
        try {
            String sql = "UPDATE swp391.team \n"
                    + "SET ";

            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (model.getTeam_code() != null) {
                count++;
                sql += "team_code = ?,\n";
                params.put(count, model.getTeam_code());
            }

            if (model.getTopic_name() != null) {
                count++;
                sql += "topic_name = ?,\n";
                params.put(count, model.getTopic_name());
            }

            if (model.getStatus() != null) {
                count++;
                sql += "status = ?,\n";
                params.put(count, model.getStatus());
            }

            if (model.getDescription() != null) {
                count++;
                sql += "description = ?,\n";
                params.put(count, model.getDescription());
            }

            sql = sql.substring(0, sql.length() - 2);
            sql += " WHERE team.team_id = ?;";

            PreparedStatement stm = connection.prepareStatement(sql);

            for (Map.Entry<Integer, Object> entry : params.entrySet()) {
                Integer key = entry.getKey();
                Object val = entry.getValue();
                stm.setObject(key, val);
            }

            count++;
            stm.setInt(count, model.getTeam_id());

            status = stm.executeUpdate();

            connection.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    @Override
    public void remove(Team model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<Milestone> getMilestoneSubmit() {
        Connection connection = open();
        List<Milestone> listMilestone = new ArrayList<>();
        String sql = "select distinct submit.milestone_id from swp391.submit";
        MilestoneDBContext mileDAO = new MilestoneDBContext();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Milestone m = mileDAO.get(rs.getInt(1));
                listMilestone.add(m);
            }
            connection.close();
        } catch (SQLException ex) {
        }
        return listMilestone;
    }

    public ArrayList<Team> getListTeamByMilestoneId(int id, int status) {
        Connection connection = open();
        ArrayList<Team> teams = new ArrayList<>();
        try {
            String sql = "select t.team_id, t.team_code, t.topic_name, t.status from swp391.team t\n"
                    + "join swp391.submit s on t.team_id = s.team_id\n"
                    + "join swp391.milestone m on s.milestone_id = m.milestone_id\n";

            int count = 0;

            if (id != -1) {
                count++;
                sql += " where m.milestone_id = ?;";
            }

            PreparedStatement stm = connection.prepareStatement(sql);

            if (count != 0) {
                stm.setInt(1, id);
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Team team = new Team();
                team.setTeam_id(rs.getInt("team_id"));
                team.setTeam_code(rs.getString("team_code"));
                team.setTopic_name(rs.getString("topic_name"));
                team.setStatus(rs.getBoolean("status"));

                TeamMemberDBContext tmdc = new TeamMemberDBContext();
                team.setTeam_member(tmdc.getTeamMember(rs.getInt("team_id"), status));

                teams.add(team);
            }
            connection.close();
        } catch (Exception e) {
        }
        return teams;
    }

//    public static void main(String[] args) {
//        TeamDBContext tdc = new TeamDBContext();
//        ArrayList<Team> teams = tdc.getListTeamByMilestoneId(1, 0);
//        for (Team team : teams) {
//            System.out.println(team);
//            System.out.println("");
//            for (User user : team.getTeam_member()) {
//                System.out.println(user);
//            }
//        }
//    }
}
