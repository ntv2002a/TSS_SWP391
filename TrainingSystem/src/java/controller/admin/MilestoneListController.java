/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.AssignmentDBContext;
import dal.ClassDBContext;
import dal.MilestoneDBContext;
import dal.UserDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import model.Assignment;
import model.Milestone;
import model.Class;
import model.User;

/**
 *
 * @author Lenovo
 */
public class MilestoneListController extends HttpServlet {
   
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
        MilestoneDBContext milestoneDBContext = new MilestoneDBContext();
        AssignmentDBContext assignmentDBContext = new AssignmentDBContext();
        ClassDBContext classDBContext = new ClassDBContext();

        String updateStatus = request.getParameter("updateStatus");
        String milestoneId = request.getParameter("milestoneId");
        if (milestoneId != null) {
            int id = 0;
            try {
                id = Integer.parseInt(milestoneId);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            if (updateStatus != null){
                if (updateStatus.equals("0")) {
                    milestoneDBContext.updateStatus(1, id);
                } else if (updateStatus.equals("1")) {
                    milestoneDBContext.updateStatus(2, id);
                } else if (updateStatus.equals("2")) {
                    milestoneDBContext.updateStatus(0, id);
                }
            }
        }

        int pagesize = Integer.parseInt(request.getServletContext().getInitParameter("pagesize"));
        String page = request.getParameter("page");
        String ass_raw = request.getParameter("ass");
        String class_raw = request.getParameter("class");
        String status_raw = request.getParameter("status");
        String search_raw = request.getParameter("search");

        int assId = -1;
        if (ass_raw != null) {
            assId = (!ass_raw.equals("-1")) ? new Integer(ass_raw) : -1;
        }
        int classId = -1;
        if (class_raw != null) {
            classId = (!class_raw.equals("-1")) ? new Integer(class_raw) : -1;
        }
        int status = -1;
        if (status_raw != null) {
            status = (!status_raw.equals("-1")) ? new Integer(status_raw) : -1;
        }
        String search = (search_raw != null && search_raw.length() > 0) ? search_raw : null;

        if (page == null) {
            page = "1";
        }
        int pageindex = Integer.parseInt(page);

        int count = milestoneDBContext.count(classId, assId, status, search, trainerId);
        int totalpage = (count % pagesize == 0) ? (count / pagesize)
                : (count / pagesize) + 1;
        ArrayList<Milestone> milestones = milestoneDBContext.listMilestoneWithFilter(pageindex, pagesize, classId, assId, status, search, trainerId);
        ArrayList<Class> classes = classDBContext.listClasses(trainerId);
        ArrayList<Assignment> assignments = new ArrayList<>();
        if(isAdmin){
            assignments = assignmentDBContext.listAssignments();
        }else{
            ArrayList<Integer> subjectId = new ArrayList<>();
            for (Class classe : classes) {
                subjectId.add(classe.getSubject_id().getId());
            }
            assignments = assignmentDBContext.listAssignments(subjectId);
        }
        

        request.setAttribute("milestones", milestones);
        request.setAttribute("assignments", assignments);
        request.setAttribute("classes", classes);
        
        request.setAttribute("assId", assId);
        request.setAttribute("classId", classId);
        request.setAttribute("status", status);
        request.setAttribute("search", search);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalpage", totalpage);
        
        String success = request.getParameter("success");
        request.setAttribute("success", success);
        request.getRequestDispatcher("../../view/admin/MilestoneList.jsp").forward(request, response);
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
