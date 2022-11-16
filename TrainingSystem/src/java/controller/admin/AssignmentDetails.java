/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.AssignmentDAO;
import dal.SettingDBContext;
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
import model.Assignment;
import model.Setting;
import model.Subject;
import model.User;

/**
 *
 * @author tuand
 */
public class AssignmentDetails extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserDetailController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        String ass_id = request.getParameter("ass_id");

        HttpSession ses = request.getSession();
        User user_sess = (User) ses.getAttribute("user");
        int user_id = user_sess.getId();
        String success = request.getParameter("success");
        int id = 0;
        try {
            id = Integer.parseInt(ass_id);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        AssignmentDAO aDao = new AssignmentDAO();
        Assignment ass = aDao.getAssbyId(id);

        ArrayList<Subject> subjects = aDao.getAssSubject(user_id);
        if (ass_id == null) {
            request.setAttribute("action", "add");
            request.setAttribute("sub", subjects);
            request.setAttribute("success", success);
            request.getRequestDispatcher("../../view/admin/AssignmentDetails.jsp").forward(request, response);
            return;
        }
        request.setAttribute("ass", ass);
        request.setAttribute("action", "update");
        request.setAttribute("success", success);
        request.setAttribute("sub", subjects);
        request.getRequestDispatcher("../../view/admin/AssignmentDetails.jsp").forward(request, response);
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
        String action = request.getParameter("action");

        if (!request.getParameter("eval_weight").isEmpty() && !request.getParameter("subject").isEmpty() && action.equalsIgnoreCase("add") && (request.getParameter("status") != null)) {
            String title = request.getParameter("title");
            int status = Integer.parseInt(request.getParameter("status"));
            int is_ongoing = Integer.parseInt(request.getParameter("is_ongoing"));
            int is_team_work = Integer.parseInt(request.getParameter("is_team_work"));
            int sub_id = Integer.parseInt(request.getParameter("subject"));
            int eval_weight = Integer.parseInt(request.getParameter("eval_weight").trim());
            String ass_body = request.getParameter("ass_body");

            if (request.getParameter("eval_weight") != null && eval_weight > 0 && eval_weight < 100) {
                AssignmentDAO assDao = new AssignmentDAO();
                assDao.addAssginment(sub_id, title, ass_body, eval_weight, status);
                response.sendRedirect("list?success=atrue");
            } else {
                response.sendRedirect("detail?success=afalse");
            }
        } else if (action.equalsIgnoreCase("update") && (request.getParameter("status") != null)) {
            String title = request.getParameter("title");
            int status = Integer.parseInt(request.getParameter("status"));
            int is_ongoing = Integer.parseInt(request.getParameter("is_ongoing"));
            int is_team_work = Integer.parseInt(request.getParameter("is_team_work"));
            int eval_weight = Integer.parseInt(request.getParameter("eval_weight"));
            String ass_body = request.getParameter("ass_body");

            int id = Integer.parseInt(request.getParameter("ass_id"));

            AssignmentDAO assDao = new AssignmentDAO();
            if ((request.getParameter("eval_weight") != null) && eval_weight > 0 && eval_weight < 100) {
                assDao.updateAssginmentbyId(title, status, is_ongoing, is_team_work, eval_weight, ass_body, id);
                response.sendRedirect("list?success=utrue");
            } else {
                response.sendRedirect("detail?ass_id=" + id + "&success=ufalse");
            }
        } else {
            response.sendRedirect("detail?success=afalse");
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
