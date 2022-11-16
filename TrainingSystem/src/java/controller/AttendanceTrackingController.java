/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AttendanceDBContext;
import dal.ClassDBContext;
import dal.ScheduleDBContext;
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
public class AttendanceTrackingController extends HttpServlet {

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
        ClassDBContext cdb = new ClassDBContext();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        ArrayList<Class> listClassByUser = cdb.listClassByUser(u.getId());
        request.setAttribute("classes", listClassByUser);
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        processRequest(request, response);
        
        request.getRequestDispatcher("view/AttendanceTracking.jsp").forward(request, response);
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
        processRequest(request, response);
        int class_id = Integer.parseInt(request.getParameter("class"));
        UserDBContext udb = new UserDBContext();
        ArrayList<User> listTraieeInAClass = udb.listTraineeInAClass(class_id);
        ScheduleDBContext sdb = new ScheduleDBContext();
        ArrayList<Schedule> listScheduleInAClass = sdb.listScheduleInAClass(class_id);
        AttendanceDBContext adb = new AttendanceDBContext();
        ArrayList<Attendance> listAttendanceInAClass = adb.listAttendanceInAClass(class_id);

        request.setAttribute("attendances", listAttendanceInAClass);
        request.setAttribute("schedules", listScheduleInAClass);
        request.setAttribute("trainees", listTraieeInAClass);
        request.getRequestDispatcher("view/AttendanceTracking.jsp").forward(request, response);
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
