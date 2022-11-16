/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AttendanceDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Attendance;
import model.Schedule;
import model.User;
import model.Class;

/**
 *
 * @author ACER
 */
public class AttendanceDetailsController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public int schedule_id;
    public int classID;
    public String action;
    ArrayList<Attendance> AttendancesInASchedule;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        action = request.getParameter("action");
        String schedule_id_raw = request.getParameter("schedule");
        schedule_id = Integer.parseInt(schedule_id_raw);
        String classID_raw = request.getParameter("class");
        classID = Integer.parseInt(classID_raw);

        if (action.equalsIgnoreCase("add")) {
            UserDBContext udb = new UserDBContext();

            ArrayList<User> listTraineeInAClass = udb.listTraineeInAClass(classID);
            request.setAttribute("action", action);
            request.setAttribute("trainees", listTraineeInAClass);
        }

        if (action.equalsIgnoreCase("edit")) {
            AttendanceDBContext adb = new AttendanceDBContext();

            ArrayList<Attendance> listAttendanceInASchedule = adb.listAttendanceInASchedule(schedule_id);
            AttendancesInASchedule = listAttendanceInASchedule;
            request.setAttribute("action", action);
            request.setAttribute("attendances", listAttendanceInASchedule);
        }

        request.getRequestDispatcher("view/AttendanceDetail.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Schedule s = new Schedule();
        s.setSchedule_id(schedule_id);
        String[] indexes = request.getParameterValues("indexes");

        ArrayList<Attendance> attendances = new ArrayList<>();

        for (String index : indexes) {
            Attendance a = new Attendance();
            a.setSchedule_id(s);
            Class c = new Class();
            c.setClass_id(classID);
            a.setClass_id(c);
            User trainee = new User();
            trainee.setId(Integer.parseInt(request.getParameter("traineeID" + index)));
            a.setTrainee_id(trainee);
            a.setStatus(Boolean.parseBoolean(request.getParameter("status" + index)));
            a.setComment(request.getParameter("comment" + index));
            attendances.add(a);
        }

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");

        if (action.equalsIgnoreCase("add")) {
            AttendanceDBContext adb = new AttendanceDBContext();
            adb.takeAttendances(attendances, u);
        }

        if (action.equalsIgnoreCase("edit")) {
            ArrayList<Attendance> attendances_change = new ArrayList<>();

            for (int i = 0; i < attendances.size(); i++) {
                Boolean check = false;
                Attendance attendance_change = new Attendance();

                Boolean status = attendances.get(i).getStatus();
                String comment = attendances.get(i).getComment();

                if (status != AttendancesInASchedule.get(i).getStatus()) {
                    attendance_change.setStatus(status);
                    check = true;
                }

                if (!comment.equals(AttendancesInASchedule.get(i).getComment())) {
                    attendance_change.setComment(comment);
                    check = true;
                }

                if (check) {
                    Class class_change = new Class();
                    Schedule schedule_change = new Schedule();
                    User trainee_change = new User();

                    class_change.setClass_id(classID);
                    schedule_change.setSchedule_id(attendances.get(i).getSchedule_id().getSchedule_id());
                    trainee_change.setId(attendances.get(i).getTrainee_id().getId());

                    attendance_change.setClass_id(class_change);
                    attendance_change.setSchedule_id(schedule_change);
                    attendance_change.setTrainee_id(trainee_change);

                    attendances_change.add(attendance_change);
                }
            }
            AttendanceDBContext adb = new AttendanceDBContext();
            adb.updateAttendances(attendances_change, u);
        }

        //request.getRequestDispatcher("view/attendance/action_confirm.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
