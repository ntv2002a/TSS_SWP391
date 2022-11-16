/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.SubjectDBContext;
import dal.SubjectSettingDBContext;
import dal.UserDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Subject;
import model.User;

/**
 *
 * @author duyng
 */
public class SubjectListController extends HttpServlet {

    Integer manager_id;
    Integer expert_id;
    Boolean status;
    String namepart;

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
        SubjectDBContext sdbc = new SubjectDBContext();
        String page = request.getParameter("page");
        if (page == null) {
            page = "1";
        }
        int pageindex = Integer.parseInt(page);
        int pagesize = Integer.parseInt(request.getServletContext().getInitParameter("pagesize"));
        ArrayList<Subject> subjects = sdbc.filter(pageindex, pagesize, manager_id, expert_id, status, namepart);
        int count = sdbc.countFilter(manager_id, expert_id, status, namepart);
        int totalpage = (count % pagesize == 0) ? (count / pagesize)
                : (count / pagesize) + 1;

        UserDBContext udbc = new UserDBContext();
        ArrayList<User> managers = udbc.listByRole(12);
        udbc = new UserDBContext();
        ArrayList<User> experts = udbc.listByRole(15);

        request.setAttribute("subjects", subjects);
        request.setAttribute("managers", managers);
        request.setAttribute("experts", experts);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("manager_id", manager_id);
        request.setAttribute("expert_id", expert_id);
        request.setAttribute("status", status);
        request.setAttribute("namepart", namepart);

        request.getRequestDispatcher("../../view/admin/SubjectList.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User user_sess = (User) session.getAttribute("user");
        if (user_sess == null) {
            response.sendRedirect("../../Login");
            return;
        }
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

        try {
            String changeStatus = request.getParameter("changeStatus").trim();
            if (changeStatus != null || !changeStatus.isEmpty()) {
                int subject_id = Integer.parseInt(changeStatus);
                SubjectDBContext sdbc = new SubjectDBContext();
                sdbc.changeStatus(subject_id);
                
                SubjectSettingDBContext ssdbc = new SubjectSettingDBContext();
                ArrayList<Integer> settingIds = ssdbc.getSettingIdsOfSubject(subject_id);
                for (int id : settingIds) {
                    ssdbc.changeStatus(id);
                }
            }
        } catch (Exception e) {
        }

        String manager = request.getParameter("manager");
        String expert = request.getParameter("expert");
        String statusStr = request.getParameter("status");
        String namepart_str = request.getParameter("namepart");

        if (manager.equals("-1")) {
            manager_id = null;
        } else {
            manager_id = Integer.parseInt(manager);
        }

        if (expert.equals("-1")) {
            expert_id = null;
        } else {
            expert_id = Integer.parseInt(expert);
        }

        if (statusStr.equals("null")) {
            status = null;
        } else {
            status = statusStr.trim().equals("true");
        }

        if (namepart_str == null || namepart_str.trim().isEmpty()) {
            namepart = null;
        } else {
            namepart = namepart_str.trim();
        }

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
