/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.TraineeDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Trainee;
import model.User;

/**
 *
 * @author Lenovo
 */
public class TraineeDetailController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TraineeDetailController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TraineeDetailController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        //processRequest(request, response);
        String classTemp = request.getParameter("classId");
        String traineeTemp = request.getParameter("traineeId");
        String success = request.getParameter("success");

        TraineeDBContext traineeDBContext = new TraineeDBContext();

        int classId = 0, traineeId = 0;
        try {
            classId = Integer.parseInt(classTemp);
            traineeId = Integer.parseInt(traineeTemp);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        Trainee trainee = traineeDBContext.get(classId, traineeId);
        request.setAttribute("trainee", trainee);
        request.setAttribute("success", success);
        request.getRequestDispatcher("../../view/TraineeDetail.jsp").forward(request, response);
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
        //processRequest(request, response);
        String classTemp = request.getParameter("classId");
        String traineeTemp = request.getParameter("traineeId");
        String dropoutDate = request.getParameter("dropoutdate");
        String note = request.getParameter("note");
        String status = request.getParameter("status");

        int classId = 0;
        int traineeId = 0;
        int statusNumber = 0;
        try {
            classId = Integer.parseInt(classTemp);
            traineeId = Integer.parseInt(traineeTemp);
            statusNumber = Integer.parseInt(status);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        TraineeDBContext traineeDBContext = new TraineeDBContext();
        
        Trainee trainee = traineeDBContext.get(classId, traineeId);
        trainee.setStatus(statusNumber);
        trainee.setNote(note);
        if(dropoutDate != null && dropoutDate != ""){
            try {
                trainee.setDropout_date(new SimpleDateFormat("yyyy-MM-dd").parse(dropoutDate));
            } catch (ParseException ex) {
                Logger.getLogger(TraineeDetailController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        traineeDBContext.update(trainee);
        response.sendRedirect("detail?classId=" + classId + "&traineeId="+traineeId+"&success=true");
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
