/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

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
import model.Setting;
import model.User;

/**
 *
 * @author Lenovo
 */
public class UserDetailController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserDetailController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserDetailController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        //processRequest(request, response);
        HttpSession ses = request.getSession();
        User user_sess = (User) ses.getAttribute("user");
        if(user_sess == null) {
            response.sendRedirect("../../Login");
            return;
        }
        String userId = request.getParameter("userId");
        String success = request.getParameter("success");
        int id = 0;
        try{
            id = Integer.parseInt(userId);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        
        UserDBContext userDBContext = new UserDBContext();
        User user = userDBContext.get(id);
        userDBContext = new UserDBContext();
        HashMap<String,Integer> userRoles = userDBContext.getUserRole(id);
        SettingDBContext settingDBContext = new SettingDBContext();
        ArrayList<Setting> roles = settingDBContext.listRole();
        
        request.setAttribute("roles", roles);
        request.setAttribute("user", user);
        request.setAttribute("userRoles", userRoles);
        request.setAttribute("success", success);
        request.getRequestDispatcher("../../view/admin/UserDetail.jsp").forward(request, response);
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
        //processRequest(request, response);
        HttpSession ses = request.getSession();
        User user_sess = (User) ses.getAttribute("user");
        if(user_sess == null) {
            response.sendRedirect("Login");
            return;
        }
        int user_id = user_sess.getId();
        String userId = request.getParameter("userId");
        String fullname = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String status = request.getParameter("status");
        String[] roles = request.getParameterValues("role");
        String note = request.getParameter("note");

        int id = 0;
        int statusNumber = 0;
        try{
            id = Integer.parseInt(userId);
            statusNumber = Integer.parseInt(status);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        
        UserDBContext userDBContext = new UserDBContext();
        User user = userDBContext.get(id);
        user.setFullname(fullname);
        user.setEmail(email);
        user.setMobile(phone);
        user.setNote(note);
        user.setStatus(statusNumber);
        userDBContext = new UserDBContext();
        userDBContext.update(user,user_id);

        userDBContext = new UserDBContext();
        userDBContext.deleteUserRole(id);
        for (String role : roles) {
            int roleId = 0;
            try{
                roleId = Integer.parseInt(role);
                userDBContext = new UserDBContext();
                userDBContext.addUserRole(id, roleId,user_id);
            }catch(Exception e){
                System.out.println(e.getMessage());
            }
        }
        
        response.sendRedirect("detail?userId="+id+"&success=true");
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
