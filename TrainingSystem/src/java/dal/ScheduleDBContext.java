/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Schedule;
import model.Class;
import model.Room;
import model.Slot;
import model.Subject;
import model.User;
import model.Week;
import utils.WeekContext;

/**
 *
 * @author duyng
 */
public class ScheduleDBContext extends DBContext<Schedule> {

    @Override
    public ArrayList<Schedule> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Schedule> listByWeek(Week week, int supporter_id, int pageIndex, int pageSize) {
        ArrayList<Schedule> list = new ArrayList<>();
        WeekContext wc = new WeekContext();

        try {
            String sql = "SELECT s.schedule_id, s.class_id, c.class_code, sj.subject_code, \n"
                    + "s.slot_id, sl.slot_name, sl.time_start, sl.time_end,\n"
                    + "s.title, s.training_date, s.room_id, r.room_code FROM swp391.schedule s\n"
                    + "LEFT JOIN swp391.class c ON s.class_id = c.class_id\n"
                    + "LEFT JOIN swp391.subject sj ON c.subject_id = sj.subject_id\n"
                    + "LEFT JOIN swp391.slot sl ON s.slot_id = sl.slot_id\n"
                    + "LEFT JOIN swp391.room r ON s.room_id = r.room_id\n"
                    + "WHERE c.supporter_id = ?\n"
                    + "AND c.status = 1\n"
                    + "AND s.training_date >= ?\n"
                    + "AND s.training_date <= ?\n"
                    + "LIMIT ?, ?";
            Connection connection = open();
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, supporter_id);
            stmt.setDate(2, week.getStart());
            stmt.setDate(3, week.getEnd());
            stmt.setInt(4, pageSize * (pageIndex - 1));
            stmt.setInt(5, pageSize);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Schedule schedule = new Schedule();
                // Schedule
                schedule.setSchedule_id(rs.getInt("schedule_id"));
                // Class
                Class c = new Class();
                c.setClass_id(rs.getInt("class_id"));
                c.setClass_code(rs.getString("class_code"));
                // Subject
                Subject s = new Subject();
                s.setCode(rs.getString("subject_code"));
                c.setSubject_id(s);
                schedule.setClassroom(c);
                // Slot 
                Slot slot = new Slot();
                slot.setSlot_id(rs.getInt("slot_id"));
                slot.setSlot_name(rs.getString("slot_name"));
                slot.setTime_start(rs.getTime("time_start"));
                slot.setTime_end(rs.getTime("time_end"));
                schedule.setSlot(slot);
                // Title
                schedule.setTitle(rs.getString("title"));
                schedule.setTraining_date(rs.getDate("training_date"));
                list.add(schedule);
                // Room
                Room r = new Room();
                r.setRoom_id(rs.getInt("room_id"));
                r.setRoom_code(rs.getString("room_code"));
                schedule.setRoom(r);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return list;
    }

    public int listCount(Week week, int supporter_id) {
        int total = 0;
        try {
            String sql = "SELECT COUNT(*) AS 'total' FROM swp391.schedule s\n"
                    + "LEFT JOIN swp391.class c ON s.class_id = c.class_id\n"
                    + "LEFT JOIN swp391.subject sj ON c.subject_id = sj.subject_id\n"
                    + "LEFT JOIN swp391.slot sl ON s.slot_id = sl.slot_id\n"
                    + "LEFT JOIN swp391.room r ON s.room_id = r.room_id\n"
                    + "WHERE c.supporter_id = ?\n"
                    + "AND c.status = 1\n"
                    + "AND s.training_date >= ?\n"
                    + "AND s.training_date <= ?\n";
            Connection connection = open();
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, supporter_id);
            stmt.setDate(2, week.getStart());
            stmt.setDate(3, week.getEnd());
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                total = rs.getInt("total");
            }
            connection.close();
        } catch (SQLException e) {
        }
        return total;
    }

    public ArrayList<Schedule> listScheduleInAClass(int classID) {
        ArrayList<Schedule> schedules = new ArrayList<>();
        try {
            String sql = "SELECT s.schedule_id, s.class_id, c.class_code, \n"
                    + "sj.subject_code, sj.subject_name, s.training_date,\n"
                    + "s.slot_id, sl.slot_name FROM swp391.schedule s\n"
                    + "JOIN swp391.class c ON s.class_id = c.class_id\n"
                    + "JOIN swp391.subject sj ON c.subject_id = sj.subject_id\n"
                    + "JOIN swp391.slot sl ON s.slot_id = sl.slot_id\n"
                    + "WHERE s.class_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, classID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Schedule s = new Schedule();
                s.setSchedule_id(rs.getInt("schedule_id"));

                Class c = new Class();
                c.setClass_id(rs.getInt("class_id"));
                c.setClass_code(rs.getString("class_code"));
                Subject sj = new Subject();
                sj.setCode(rs.getString("subject_code"));
                sj.setName(rs.getString("subject_name"));
                c.setSubject_id(sj);

                Slot slot = new Slot();
                slot.setSlot_id(rs.getInt("slot_id"));
                slot.setSlot_name(rs.getString("slot_name"));

                s.setSlot(slot);
                s.setClassroom(c);
                s.setTraining_date(rs.getDate("training_date"));
                schedules.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return schedules;
    }

    @Override
    public Schedule get(int id) {
        Schedule schedule = new Schedule();
        try {
            String sql = "SELECT s.schedule_id, s.class_id, c.class_code, c.trainer_id, sj.subject_code, \n"
                    + "sj.subject_name, s.slot_id, sl.slot_name, sl.time_start, sl.time_end,\n"
                    + "s.title, s.training_date, s.room_id, r.room_code FROM swp391.schedule s\n"
                    + "LEFT JOIN swp391.class c ON s.class_id = c.class_id\n"
                    + "LEFT JOIN swp391.subject sj ON c.subject_id = sj.subject_id\n"
                    + "LEFT JOIN swp391.slot sl ON s.slot_id = sl.slot_id\n"
                    + "LEFT JOIN swp391.room r ON s.room_id = r.room_id\n"
                    + "WHERE s.schedule_id = ?";
            Connection connection = open();
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                schedule.setSchedule_id(id);
                // Class
                Class c = new Class();
                c.setClass_id(rs.getInt("class_id"));
                c.setClass_code(rs.getString("class_code"));
                User trainer = new User();
                trainer.setId(rs.getInt("trainer_id"));
                c.setTrainer_id(trainer);
                // Subject
                Subject s = new Subject();
                s.setCode(rs.getString("subject_code"));
                s.setName(rs.getString("subject_name"));
                c.setSubject_id(s);
                schedule.setClassroom(c);
                // Slot 
                Slot slot = new Slot();
                slot.setSlot_id(rs.getInt("slot_id"));
                slot.setSlot_name(rs.getString("slot_name"));
                slot.setTime_start(rs.getTime("time_start"));
                slot.setTime_end(rs.getTime("time_end"));
                schedule.setSlot(slot);
                // Title
                schedule.setTitle(rs.getString("title"));
                schedule.setTraining_date(rs.getDate("training_date"));
                // Room
                Room r = new Room();
                r.setRoom_id(rs.getInt("room_id"));
                r.setRoom_code(rs.getString("room_code"));
                schedule.setRoom(r);
            }
            connection.close();
        } catch (SQLException e) {
        }
        return schedule;
    }

    public int getLastestId() {
        int id = 0;
        try {
            String sql = "SELECT MAX(schedule_id) AS 'id' FROM swp391.schedule;";
            Connection connection = open();
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
            }
            connection.close();
        } catch (SQLException e) {
        }
        return id;
    }

    @Override
    public void add(Schedule model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int addSchedule(Schedule model) {
        if (checkUniqueSchedule(model) == 0) {
            return 0;
        }
        int actionStatus = 0;
        try {
            Connection connection = open();
            String sql = "INSERT INTO `swp391`.`schedule`\n"
                    + "(`class_id`,\n"
                    + "`slot_id`,\n"
                    + "`title`,\n"
                    + "`training_date`,\n"
                    + "`room_id`)\n"
                    + "VALUES\n"
                    + "(?, ?, ?, ?, ?);";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, model.getClassroom().getClass_id());
            stmt.setInt(2, model.getSlot().getSlot_id());
            stmt.setString(3, model.getTitle());
            stmt.setDate(4, model.getTraining_date());
            stmt.setInt(5, model.getRoom().getRoom_id());
            actionStatus = stmt.executeUpdate();
            connection.close();
        } catch (SQLException e) {
        }
        return actionStatus;
    }

    @Override
    public void update(Schedule model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int updateSchedule(Schedule model) {
        if (checkUniqueSchedule(model) == 0) {
            return 0;
        }
        int status = 0;
        try {
            String sql = "UPDATE `swp391`.`schedule`\n"
                    + "SET\n"
                    + "`slot_id` = ?,\n"
                    + "`title` = ?,\n"
                    + "`training_date` = ?,\n"
                    + "`room_id` = ?\n"
                    + "WHERE `schedule_id` = ?;";
            Connection connection = open();
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, model.getSlot().getSlot_id());
            stmt.setString(2, model.getTitle());
            stmt.setDate(3, model.getTraining_date());
            stmt.setInt(4, model.getRoom().getRoom_id());
            stmt.setInt(5, model.getSchedule_id());
            status = stmt.executeUpdate();
            connection.close();
        } catch (SQLException e) {
        }
        return status;
    }

    public int checkUniqueSchedule(Schedule model) {
        int status = 0;
        try {
            String sql = "INSERT INTO swp391.unique_schedule \n"
                    + "VALUES (?, ?, ?, ?);";
            Connection connection = open();
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, model.getClassroom().getTrainer_id().getId());
            stmt.setDate(2, model.getTraining_date());
            stmt.setInt(3, model.getSlot().getSlot_id());
            stmt.setInt(4, model.getRoom().getRoom_id());
            status = stmt.executeUpdate();
            connection.close();
        } catch (SQLException e) {
        }
        return status;
    }

    @Override
    public void remove(Schedule model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public boolean attendanceTaken(int id) {
        boolean taken = false;
        try {
            String sql = "SELECT COUNT(schedule_id) AS 'total' \n"
                    + "FROM swp391.attendance\n"
                    + "WHERE schedule_id = ?";
            Connection connection = open();
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int total = rs.getInt("total");
                if (total > 0) {
                    taken = true;
                }
            }
            connection.close();
        } catch (SQLException e) {
        }
        return taken;
    }

}
