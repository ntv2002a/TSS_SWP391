/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.MilestoneDBContext;
import dal.TeamDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Milestone;
import model.Team;
import model.User;

/**
 *
 * @author trung
 */
public class TeamListController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    int milestone_id = 1;
    int status = -1;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {      
        MilestoneDBContext mdc = new MilestoneDBContext();
        ArrayList<Milestone> milestones = mdc.list();
        
        mdc = new MilestoneDBContext();
        
        int class_id = mdc.get(milestone_id).getClass_milestone().getClass_id();
        
        UserDBContext udc = new UserDBContext();
        ArrayList<User> wTrainee = udc.getWaitingTraineeList(class_id, status);
        
        TeamDBContext tdc = new TeamDBContext();
        ArrayList<Team> teams = tdc.getListTeamByMilestoneId(milestone_id, status); 
        
        request.setAttribute("milestone_id", milestone_id);
        request.setAttribute("milestones", milestones);
        request.setAttribute("wTrainee", wTrainee);
        request.setAttribute("teams", teams);
        request.setAttribute("status", status);
        
        request.getRequestDispatcher("../view/TeamList.jsp").forward(request, response);
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
        milestone_id = Integer.parseInt(request.getParameter("milestone_id"));
        status = Integer.parseInt(request.getParameter("status"));
        
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
