/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.AssignmentDBContext;
import dal.EvalCriteriaDBContext;
import dal.MilestoneDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Assignment;
import model.EvalCriteria;
import model.Milestone;

/**
 *
 * @author duyng
 */
public class EvalCriteriaDetailController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        String action = request.getParameter("action");
        request.setAttribute("action", action);
        
        EvalCriteria ec = new EvalCriteria();
        if (!action.equals("add")) {
            int id = Integer.parseInt(request.getParameter("id"));
            EvalCriteriaDBContext ecdbc = new EvalCriteriaDBContext();
            ec = ecdbc.get(id);
            request.setAttribute("ec", ec);
        }
        
        MilestoneDBContext mdbc = new MilestoneDBContext();
        ArrayList<Milestone> milestones = mdbc.listMilestone();
        request.setAttribute("milestones", milestones);
        
        AssignmentDBContext adbc = new AssignmentDBContext();
        ArrayList<Assignment> assignments = new ArrayList<>();
        if (action.equals("add"))
            assignments = adbc.listAssignments();
        else
            if (action.equals("edit"))
                assignments = adbc.listBySubject(ec.getAss_id().getSubject_id().getId());
        request.setAttribute("assignments", assignments);
        
        request.getRequestDispatcher("../../view/admin/EvalCriteriaDetail.jsp").forward(request, response);
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
        int id;
        EvalCriteria ec = new EvalCriteria();
        String action = request.getParameter("action");
        EvalCriteriaDBContext ecdbc = new EvalCriteriaDBContext();
        
        try {
            // Action: edit
            id = Integer.parseInt(request.getParameter("id"));
            ec = ecdbc.get(id);
        } catch (Exception e) {
        }
        
        AssignmentDBContext adbc = new AssignmentDBContext();
        Assignment a = adbc.get(Integer.parseInt(request.getParameter("assignment")));
        ec.setAss_id(a);

        Milestone m = new Milestone();
        m.setId(Integer.parseInt(request.getParameter("milestone")));
        ec.setMilestone_id(m);
        
        ec.setCriteria_name(request.getParameter("criteria_name"));
        
        boolean is_team_eval;
        try {
            is_team_eval = request.getParameter("is_team_eval").equals("true");
        } catch (NullPointerException e) {
            is_team_eval = false;
        }
                
        ec.setIs_team_eval(is_team_eval);
        
        ec.setEval_weight(Integer.parseInt(request.getParameter("eval_weight")));
        
        ec.setMax_loc(Integer.parseInt(request.getParameter("max_loc")));
        
        ec.setStatus(request.getParameter("status").equals("true"));
        
        ec.setDescription(request.getParameter("description"));
        
        request.setAttribute("ec", ec);
        
        int actionStatus = 0;
        if (action.equals("add")) {
            actionStatus = ecdbc.addEvalCriteria(ec);
        } else
            if (action.equals("edit"))
                actionStatus = ecdbc.updateEvalCriteria(ec);
        
        request.setAttribute("action", action);
        request.setAttribute("actionStatus", actionStatus);
        
        MilestoneDBContext mdbc = new MilestoneDBContext();
        ArrayList<Milestone> milestones = mdbc.listMilestone();
        request.setAttribute("milestones", milestones);
        
        ArrayList<Assignment> assignments = new ArrayList<>();
        if (action.equals("add"))
            assignments = adbc.listAssignments();
        else
            if (action.equals("edit"))
                assignments = adbc.listBySubject(ec.getAss_id().getSubject_id().getId());
        request.setAttribute("assignments", assignments);
        
        request.getRequestDispatcher("../../view/admin/EvalCriteriaDetail.jsp").forward(request, response);
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
