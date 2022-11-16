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
import java.util.ArrayList;
import model.trainer.Assignment1;
import model.trainer.EvalCriteria;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateClassEval", urlPatterns = {"/Trainer/EditEval"})
public class UpdateClassEval extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String eid = request.getParameter("eid");
        ClassEvalDAO adao = new ClassEvalDAO();
        EvalCriteria e = adao.getEvalCriteria(eid);
        request.setAttribute("e", e);
        ArrayList<Assignment1> alist = adao.getAllAssignment();
        request.setAttribute("alist", alist);
        request.getRequestDispatcher("../view/trainer/EditEval.jsp").forward(request, response);
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
        String eid = request.getParameter("eid");
        ClassEvalDAO adao = new ClassEvalDAO();
        EvalCriteria e = adao.getEvalCriteria(eid);
        request.setAttribute("e", e);
        ArrayList<Assignment1> alist = adao.getAllAssignment();
        request.setAttribute("alist", alist);
        request.getRequestDispatcher("../view/trainer/EditEval.jsp").forward(request, response);
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
        String id = request.getParameter("id").trim();
        String mid = request.getParameter("mid").trim();
        String name = request.getParameter("name").trim();
        String assId = request.getParameter("assId").trim();
        String evalWeight = request.getParameter("evalWeight").trim();
        String maxLoc = request.getParameter("maxLoc");
        String isTeamEval = request.getParameter("isTeamEval").trim();
        String status = request.getParameter("status").trim();
        String description = request.getParameter("description").trim();
        ClassEvalDAO adao = new ClassEvalDAO();
        
        if(Integer.parseInt(evalWeight) <100){
        adao.editEval(id, name, assId, evalWeight, maxLoc, isTeamEval, status, description);
        
        response.sendRedirect("/TrainingSystem/manage/classevalcriteria/list?success=utrue");
        String success = request.getParameter("success");
        request.setAttribute("success", success);
        }
        else {
            String success = request.getParameter("success");
        request.setAttribute("success", success);
                //response.sendRedirect("/TrainingSystem/manage/classevalcriteria/list?success=ufalse");
                response.sendRedirect("/TrainingSystem/Trainer/EditEval?eid="+id+"&success=ufalse");
        }
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
