/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ClassDBContext;
import dal.TraineeDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import model.User;
import model.Class;
import model.Trainee;

/**
 *
 * @author Lenovo
 */
public class TraineeListController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession ses = request.getSession();
        User user_sess = (User) ses.getAttribute("user");
        int user_id = user_sess.getId();
        UserDBContext userDBContext = new UserDBContext();
        HashMap<String,Integer> userRoles = userDBContext.getUserRole(user_id);
        
        Boolean isAdmin = false;
        for (Map.Entry<String, Integer> entry : userRoles.entrySet()) {
            Object key = entry.getKey();
            Integer val = entry.getValue();
            if(val == 11){
                isAdmin = true;
                break;
            }
        }
        
        int trainerId = -1;
        if(isAdmin == false) trainerId = user_id;
        TraineeDBContext traineeDBContext = new TraineeDBContext();
        ClassDBContext classDBContext = new ClassDBContext();

        String updateStatus = request.getParameter("updateStatus");
        String traineeTemp = request.getParameter("traineeId");
        String classTemp = request.getParameter("class");
        
        int classId = -1;
        if (classTemp != null) {
            classId = (!classTemp.equals("-1")) ? new Integer(classTemp) : -1;
        }
        ArrayList<Class> classes = classDBContext.listClasses(trainerId);
        
        request.setAttribute("classes", classes);
        request.setAttribute("classId", classId);
        if(classTemp == null){
            request.getRequestDispatcher("../../view/TraineeList.jsp").forward(request, response);
            return;
        }
        if (traineeTemp != null) {
            int traineeId = 0;
            try {
                traineeId = Integer.parseInt(traineeTemp);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            if (updateStatus != null){
                if (updateStatus.equals("0")) {
                    traineeDBContext.updateStatus(1, classId, traineeId);
                } else if (updateStatus.equals("1")) {
                    traineeDBContext.updateStatus(0, classId, traineeId);
                }
            }
        }

        int pagesize = Integer.parseInt(request.getServletContext().getInitParameter("pagesize"));
        String page = request.getParameter("page");
        String status_raw = request.getParameter("status");

        int status = -1;
        if (status_raw != null) {
            status = (!status_raw.equals("-1")) ? new Integer(status_raw) : -1;
        }

        if (page == null) {
            page = "1";
        }
        int pageindex = Integer.parseInt(page);

        int count = traineeDBContext.count(classId, status);
        int totalpage = (count % pagesize == 0) ? (count / pagesize)
                : (count / pagesize) + 1;
        ArrayList<Trainee> trainees = traineeDBContext.listTraineeWithFilter(pageindex, pagesize, classId, status);
        
        request.setAttribute("trainees", trainees);
        
        request.setAttribute("status", status);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalpage", totalpage);
        
        String success = request.getParameter("success");
        request.setAttribute("success", success);
        request.getRequestDispatcher("../../view/TraineeList.jsp").forward(request, response);
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
