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
import model.Assignment;
import model.EvalCriteria;
import model.Milestone;
import model.Subject;
import model.User;

/**
 *
 * @author ACER
 */
public class EvalCriteriaDBContext extends DBContext<EvalCriteria> {

    public ArrayList<EvalCriteria> getEvalCriteriaListWithFilter(int pageindex, int pagesize, Integer subject, Integer assignment, Boolean status, String criteria_name) {
        ArrayList<EvalCriteria> ecs = new ArrayList<>();
        try {
            String sql = "SELECT ec.criteria_id,a.ass_id,a.title,ec.milestone_id,m.title as m_title,ec.criteria_name,ec.is_team_eval,ec.eval_weight,ec.max_loc,ec.status,ec.description,\n"
                    + "s.subject_id,s.subject_code,s.subject_name\n"
                    + "FROM swp391.eval_criteria ec JOIN swp391.assignment a ON ec.ass_id = a.ass_id\n"
                    + "JOIN swp391.subject s ON a.subject_id = s.subject_id\n"
                    + "JOIN swp391.milestone m ON ec.milestone_id = m.milestone_id\n";

            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (subject != null) {
                count++;
                sql += "AND s.subject_id = ?\n";
                params.put(count, subject);
            }

            if (status != null) {
                count++;
                sql += "AND ec.status = ?\n";
                params.put(count, status);
            }

            if (criteria_name != null) {
                count++;
                sql += "AND ec.criteria_name like ?\n";
                criteria_name = "%" + criteria_name + "%";
                params.put(count, criteria_name);
            }

            if (assignment != null) {
                count++;
                sql += "AND a.ass_id = ?\n";
                params.put(count, assignment);
            }

            sql += "ORDER BY ec.criteria_id ASC\n"
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
                EvalCriteria ec = new EvalCriteria();
                ec.setCriteria_id(rs.getInt("criteria_id"));
                Assignment a = new Assignment();
                a.setAss_id(rs.getInt("ass_id"));
                a.setTitle(rs.getString("title"));
                Milestone m = new Milestone();
                m.setId(rs.getInt("milestone_id"));
                m.setTitle(rs.getString("m_title"));
                ec.setMilestone_id(m);
                ec.setCriteria_name(rs.getString("criteria_name"));
                ec.setIs_team_eval(rs.getBoolean("is_team_eval"));
                ec.setEval_weight(rs.getInt("eval_weight"));
                ec.setMax_loc(rs.getInt("max_loc"));
                ec.setStatus(rs.getBoolean("status"));
                ec.setDescription(rs.getString("description"));
                Subject s = new Subject();
                s.setId(rs.getInt("subject_id"));
                s.setCode(rs.getString("subject_code"));
                s.setName(rs.getString("subject_name"));
                a.setSubject_id(s);
                ec.setAss_id(a);
                ecs.add(ec);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EvalCriteriaDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ecs;
    }

    public int count(Integer subject, Integer assignment, Boolean status, String criteria_name) {
        try {
            String sql = "SELECT COUNT(*) as total FROM swp391.eval_criteria ec JOIN swp391.assignment a ON ec.ass_id = a.ass_id\n"
                    + "JOIN swp391.subject s ON a.subject_id = s.subject_id\n"
                    + "WHERE (1=1) ";
            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (subject != null) {
                count++;
                sql += "AND s.subject_id = ?\n";
                params.put(count, subject);
            }

            if (status != null) {
                count++;
                sql += "AND ec.status = ?\n";
                params.put(count, status);
            }

            if (criteria_name != null) {
                count++;
                sql += "AND ec.criteria_name like ?\n";
                criteria_name = "%" + criteria_name + "%";
                params.put(count, criteria_name);
            }

            if (assignment != null) {
                count++;
                sql += "AND a.ass_id = ?\n";
                params.put(count, assignment);
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
            Logger.getLogger(EvalCriteriaDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public void saveSettingChange(User u, EvalCriteria ec) {
        try {
            String sql = "UPDATE swp391.eval_criteria\n"
                    + "SET ";

            int count = 0;

            HashMap<Integer, Object> params = new HashMap<>();

            if (ec.getAss_id().getAss_id() != -1) {
                count++;
                sql += "ass_id = ?,\n";
                params.put(count, ec.getAss_id().getAss_id());
            }

            if (ec.getMilestone_id().getId() != -1) {
                count++;
                sql += "milestone_id = ?,\n";
                params.put(count, ec.getMilestone_id().getId());
            }

            if (ec.getStatus() != null) {
                count++;
                sql += "status = ?,\n";
                params.put(count, ec.getStatus());
            }

            if (ec.getCriteria_name() != null) {
                count++;
                sql += "criteria_name = ?,\n";
                params.put(count, ec.getCriteria_name());
            }

            if (ec.getIs_team_eval() != null) {
                count++;
                sql += "is_team_eval = ?,\n";
                params.put(count, ec.getIs_team_eval());
            }

            if (ec.getEval_weight() != -1) {
                count++;
                sql += "eval_weight = ?,\n";
                params.put(count, ec.getEval_weight());
            }

            if (ec.getMax_loc() != -1) {
                count++;
                sql += "max_loc = ?,\n";
                params.put(count, ec.getMax_loc());
            }

            if (ec.getDescription() != null) {
                count++;
                sql += "description = ?,\n";
                params.put(count, ec.getDescription());
            }

            //sql = sql.substring(0, sql.length() - 2);
            sql += "modified_by = " + u.getId() + ", ";
            sql += "modified_at = NOW() ";
            sql += "WHERE criteria_id = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);

            for (Map.Entry<Integer, Object> entry : params.entrySet()) {
                Integer key = entry.getKey();
                Object val = entry.getValue();
                stm.setObject(key, val);
            }

            count++;
            stm.setInt(count, ec.getCriteria_id());

            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(EvalCriteria.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public ArrayList<EvalCriteria> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public EvalCriteria get(int id) {
        EvalCriteria ec = new EvalCriteria();
        try {
            String sql = "SELECT ec.criteria_id,a.ass_id,a.title,ec.milestone_id, m.title as m_title, "
                    + "ec.criteria_name,ec.is_team_eval,ec.eval_weight,ec.max_loc,ec.status,ec.description,\n"
                    + "s.subject_id,s.subject_code,s.subject_name\n"
                    + "FROM swp391.eval_criteria ec JOIN swp391.assignment a ON ec.ass_id = a.ass_id\n"
                    + "JOIN swp391.subject s ON a.subject_id = s.subject_id\n"
                    + "JOIN swp391.milestone m ON ec.milestone_id = m.milestone_id\n"
                    + "WHERE ec.criteria_id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ec.setCriteria_id(rs.getInt("criteria_id"));
                Assignment a = new Assignment();
                a.setAss_id(rs.getInt("ass_id"));
                a.setTitle(rs.getString("title"));
                Milestone m = new Milestone();
                m.setId(rs.getInt("milestone_id"));
                m.setTitle(rs.getString("m_title"));
                ec.setMilestone_id(m);
                ec.setCriteria_name(rs.getString("criteria_name"));
                ec.setIs_team_eval(rs.getBoolean("is_team_eval"));
                ec.setEval_weight(rs.getInt("eval_weight"));
                ec.setMax_loc(rs.getInt("max_loc"));
                ec.setStatus(rs.getBoolean("status"));
                ec.setDescription(rs.getString("description"));
                Subject s = new Subject();
                s.setId(rs.getInt("subject_id"));
                s.setCode(rs.getString("subject_code"));
                s.setName(rs.getString("subject_name"));
                a.setSubject_id(s);
                ec.setAss_id(a);
            }
        } catch (SQLException e) {
        }
        return ec;
    }

    @Override
    public void add(EvalCriteria model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int addEvalCriteria(EvalCriteria model) {
        int status = 0;
        try {
            String sql = "INSERT INTO `swp391`.`eval_criteria`\n"
                    + "(`ass_id`, `milestone_id`, `criteria_name`,\n"
                    + "`is_team_eval`, `eval_weight`, `max_loc`,\n"
                    + "`status`, `description`)\n"
                    + "VALUES\n"
                    + "(?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, model.getAss_id().getAss_id());
            stmt.setInt(2, model.getMilestone_id().getId());
            stmt.setString(3, model.getCriteria_name());
            stmt.setBoolean(4, model.getIs_team_eval());
            stmt.setInt(5, model.getEval_weight());
            stmt.setInt(6, model.getMax_loc());
            stmt.setBoolean(7, model.getStatus());
            stmt.setString(8, model.getDescription());

            status = stmt.executeUpdate();
        } catch (SQLException e) {
        }
        return status;
    }

    @Override
    public void update(EvalCriteria model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int updateEvalCriteria(EvalCriteria model) {
        int status = 0;
        try {
            String sql = "UPDATE `swp391`.`eval_criteria` SET\n"
                    + "`ass_id` = ?, `milestone_id` = ?, `criteria_name` = ?, \n"
                    + "`is_team_eval` = ?, `eval_weight` = ?, `max_loc` = ?,\n"
                    + "`status` = ?, `description` = ?\n"
                    + "WHERE `criteria_id` = ?;";
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setInt(1, model.getAss_id().getAss_id());
            stmt.setInt(2, model.getMilestone_id().getId());
            stmt.setString(3, model.getCriteria_name());
            stmt.setBoolean(4, model.getIs_team_eval());
            stmt.setInt(5, model.getEval_weight());
            stmt.setInt(6, model.getMax_loc());
            stmt.setBoolean(7, model.getStatus());
            stmt.setString(8, model.getDescription());
            stmt.setInt(9, model.getCriteria_id());
            
            status = stmt.executeUpdate();
        } catch (SQLException e) {
        }
        return status;
    }

    @Override
    public void remove(EvalCriteria model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        EvalCriteriaDBContext ecdbc = new EvalCriteriaDBContext();
        EvalCriteria ec = ecdbc.get(7);
        System.out.println(ec);
    }
}
