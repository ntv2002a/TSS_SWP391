/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.AssignmentDBContext;
import dal.EvalCriteriaDBContext;
import dal.SubjectDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Assignment;
import model.EvalCriteria;
import model.Milestone;
import model.Subject;
import model.User;

/**
 *
 * @author ACER
 */
public class EvalCriteriaListController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    Integer subject;
    Integer assignment; 
    Boolean status; 
    String criteria_name;
    EvalCriteriaDBContext ecdb;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        AssignmentDBContext adb = new AssignmentDBContext();
        SubjectDBContext sdb = new SubjectDBContext();
        ecdb = new EvalCriteriaDBContext();
        
        ArrayList<Assignment> assess = adb.list();
        ArrayList<Subject> subjects = sdb.list();
        
        int pagesize = Integer.parseInt(request.getServletContext().getInitParameter("pagesize"));
        String page = request.getParameter("page");
        if (page == null) {
            page = "1";
        }
        int pageindex = Integer.parseInt(page);
        int count = ecdb.count(subject,assignment,status,criteria_name);
        int totalpage = (count % pagesize == 0) ? (count / pagesize)
                : (count / pagesize) + 1;
        ArrayList<EvalCriteria> ecs = ecdb.getEvalCriteriaListWithFilter(pageindex, pagesize, subject,assignment,status,criteria_name);
        
        request.setAttribute("subject_id", subject);
        request.setAttribute("ass_id", assignment);
        request.setAttribute("status", status);
        request.setAttribute("criteria_name", criteria_name);
        request.setAttribute("eval_criterias", ecs);
        request.setAttribute("subjects", subjects);
        request.setAttribute("assess", assess);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalpage", totalpage);
        request.getRequestDispatcher("../../view/admin/EvalCriteriaList.jsp").forward(request, response);
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
        
        String subject_raw = request.getParameter("subject");
        String ass_raw = request.getParameter("assignment");
        String criteria_name_raw = request.getParameter("criteria_name");
        String status_raw = request.getParameter("status");
        String status_change_raw = request.getParameter("status_change");
        
        
        String[] status_change_split = (status_change_raw !=null && status_change_raw.length() >0) ? status_change_raw.split("_") :null;
        
        
        if(status_change_split != null){
            Boolean status_change = (status_change_split[0].equals("activate")) ? true:false;
            int criteria_id = Integer.parseInt(status_change_split[1]);
            EvalCriteria ec = new EvalCriteria();
            Assignment ass = new Assignment();
            ass.setAss_id(-1);
            Milestone m = new Milestone();
            m.setId(-1);
            
            ec.setCriteria_id(criteria_id);
            ec.setAss_id(ass);
            ec.setMilestone_id(m);
            ec.setEval_weight(-1);
            ec.setMax_loc(-1);
            ec.setStatus(status_change);
            
            HttpSession session = request.getSession();
            User u = (User) session.getAttribute("user");
            ecdb.saveSettingChange(u,ec);
        }
        
        subject = (subject_raw !=null && subject_raw.length() >0 && !subject_raw.equals("-1")) ? new Integer(subject_raw):null;
        assignment = (ass_raw !=null && ass_raw.length() >0 && !ass_raw.equals("-1")) ? new Integer(ass_raw):null;
        status = (status_raw !=null && status_raw.length() >0 && !status_raw.equals("both"))? status_raw.equals("active"):null;
        criteria_name = (criteria_name_raw !=null && criteria_name_raw.length() >0) ? criteria_name_raw:null;
        
        
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
