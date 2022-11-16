/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ScheduleDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Schedule;
import model.User;
import model.Week;
import utils.WeekContext;

/**
 *
 * @author duyng
 */
public class ScheduleListController extends HttpServlet { 

    int chosenYear;
    int chosenWeekIndex;
    Week chosenWeek;
    ArrayList<Week> weeks;
    Date today;
    int pageIndex;
    int pageSize = 7;
    int totalPage;
    
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Get session
        User user = (User)request.getSession().getAttribute("user");
        
        // Get schedule
        ScheduleDBContext scdbc = new ScheduleDBContext();
        ArrayList<Schedule> schedules = scdbc.listByWeek(chosenWeek, 8, pageIndex, pageSize);
        
        request.setAttribute("today", today);
        request.setAttribute("chosenWeek", chosenWeek);
        request.setAttribute("chosenWeekIndex", chosenWeekIndex);
        request.setAttribute("weeks", weeks);
        request.setAttribute("chosenYear", chosenYear);
        request.setAttribute("schedules", schedules);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("totalPage", totalPage);
        request.getRequestDispatcher("view/ScheduleList.jsp").forward(request, response);
    } 
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Get system day
        today = new Date(System.currentTimeMillis());
        //today = Date.valueOf("2022-10-28");
        // Get week list
        WeekContext wctx = new WeekContext();
        LocalDate ld = today.toLocalDate();
        chosenYear = ld.getYear();
        weeks = wctx.list(chosenYear);
        // Get current week
        chosenWeekIndex = 0;
        chosenWeek = weeks.get(chosenWeekIndex);
        for (int i = 0; i < weeks.size(); i++) {
            if (weeks.get(i).getStart().toString().compareTo(today.toString()) <= 0
                    && weeks.get(i).getEnd().toString().compareTo(today.toString()) >= 0) {
                chosenWeekIndex = i;
                chosenWeek = weeks.get(i);
            }
        }
        pageIndex = 1;
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        chosenYear = Integer.parseInt(request.getParameter("year"));
        chosenWeekIndex = Integer.parseInt(request.getParameter("week"));
        chosenWeek = weeks.get(chosenWeekIndex);
        String page = request.getParameter("page");
        if (page == null || page.equals(""))
            page = "1";
        pageIndex = Integer.parseInt(page);
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
