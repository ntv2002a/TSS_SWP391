/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.AssignmentDAO;
import dal.SettingDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

import model.Assignment;
import model.Subject;
import model.User;

public class AssignmentList extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    AssignmentDAO assdb = new AssignmentDAO();
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
//        assdb = new AssignmentDAO();
        int pagesize = Integer.parseInt(request.getServletContext().getInitParameter("pagesize"));
        String page = request.getParameter("page");
        
        HttpSession ses = request.getSession();
        User user_sess = (User) ses.getAttribute("user");
        int user_id = user_sess.getId();
        String subject_raw = request.getParameter("subject");
        String status_raw = request.getParameter("status");
        String search_raw = request.getParameter("search");
        String success = request.getParameter("success");
        if (page == null) {
            page = "1";
        }
        int subject = -1;
        if (subject_raw != null) {
            subject = (!subject_raw.equals("-1")) ? new Integer(subject_raw) : -1;
        }
        int status = -1;
        if (status_raw != null) {
            status = (!status_raw.equals("-1")) ? new Integer(status_raw) : -1;
        }
        System.out.println(status_raw);
        String search = (search_raw != null && search_raw.length() > 0) ? search_raw : null;

        int pageindex = Integer.parseInt(page);
        int count = assdb.ass_count(subject, status, search);
        
        int totalpage = (count % pagesize == 0) ? (count / pagesize)
                : (count / pagesize) + 1;
        
        ArrayList<Assignment> assignments = assdb.getAssignmentListWithFilter(pageindex, pagesize, subject, status, search);
        ArrayList<Subject> subjects = assdb.getAssSubject(user_id);
        
        request.setAttribute("success", success);
        request.setAttribute("subject", subject);
        request.setAttribute("status", status);
        request.setAttribute("search", search);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("ass", assignments);
        request.setAttribute("sub", subjects);
        

        request.getRequestDispatcher("../../view/admin/AssignmentList.jsp").forward(request, response);
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
