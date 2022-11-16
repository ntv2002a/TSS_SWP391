/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.trainer;

import dal.ClassEvalDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.ClassObj;
import model.User;
import model.trainer.Assignment1;
import model.trainer.EvalCriteria;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ClassEvalList", urlPatterns = {"/Trainer/ClassEvalList"})
public class ClassEvalList extends HttpServlet {

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
        ClassEvalDAO adao = new ClassEvalDAO();
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("/TrainingSystem/Login");
        } else {
            User u = (User) session.getAttribute("user");
            String listmid = adao.getMilestoneIdbByUid(u.getId());
            String status = request.getParameter("status") == null ? "" : request.getParameter("status");
            String cid = request.getParameter("cid") == null ? "" : request.getParameter("cid");
            String name = request.getParameter("name") == null ? "" : request.getParameter("name");
            String assId = request.getParameter("assId") == null ? "" : request.getParameter("assId");
            String success = request.getParameter("success");
            ArrayList<EvalCriteria> elist = adao.getAllEvalCriteriaByMilestone(status, name, assId, listmid, cid);
            ArrayList<Assignment1> alist = adao.getAllAssignment();
            //ArrayList<Assignment1> alist = adao.getAllAssignmentById(u.getId());
            ArrayList<ClassObj> clist = adao.getAllClass(u.getId());
            request.setAttribute("elist", elist);
            request.setAttribute("alist", alist);
            request.setAttribute("success", success);
            request.setAttribute("clist", clist);
            request.getRequestDispatcher("../../view/trainer/EvalList.jsp").forward(request, response);
        }

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
