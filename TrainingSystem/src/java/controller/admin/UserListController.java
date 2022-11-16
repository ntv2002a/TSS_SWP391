/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.SettingDBContext;
import dal.UserDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Setting;
import model.User;

/**
 *
 * @author Lenovo
 */
public class UserListController extends HttpServlet {

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
        HttpSession ses = request.getSession();
        User user_sess = (User) ses.getAttribute("user");
        if(user_sess == null) {
            response.sendRedirect("../../Login");
            return;
        }
        int user_id = user_sess.getId();
        UserDBContext userDBContext = new UserDBContext();
        SettingDBContext settingDBContext = new SettingDBContext();

        String updateStatus = request.getParameter("updateStatus");
        String userID = request.getParameter("userId");
        if (userID != null) {
            int id = 0;
            try {
                id = Integer.parseInt(userID);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            if (updateStatus != null){
                if (updateStatus.equals("1")) {
                    new UserDBContext().updateStatus(0, id, user_id);
                } else if (updateStatus.equals("0")) {
                    new UserDBContext().updateStatus(1, id, user_id);
                }
            }
        }

        int pagesize = Integer.parseInt(request.getServletContext().getInitParameter("pagesize"));
        String page = request.getParameter("page");
        String role_raw = request.getParameter("role");
        String status_raw = request.getParameter("status");
        String search_raw = request.getParameter("search");

        int role = -1;
        if (role_raw != null) {
            role = (!role_raw.equals("-1")) ? new Integer(role_raw) : -1;
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

        int count = userDBContext.count(role, status, search);
        int totalpage = (count % pagesize == 0) ? (count / pagesize)
                : (count / pagesize) + 1;
        ArrayList<User> users = userDBContext.listUserWithFilter(pageindex, pagesize, role, status, search);
        ArrayList<Setting> settings = settingDBContext.listRole();
        request.setAttribute("users", users);
        request.setAttribute("settings", settings);
        request.setAttribute("role", role);
        request.setAttribute("status", status);
        request.setAttribute("search", search);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalpage", totalpage);
        request.getRequestDispatcher("../../view/admin/UserList.jsp").forward(request, response);
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
