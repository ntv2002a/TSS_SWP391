/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Lenovo
 */
public class PasswordChangeController extends HttpServlet {

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
            out.println("<title>Servlet PasswordChangeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PasswordChangeController at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        HttpSession ses = request.getSession();
        User user_sess = (User) ses.getAttribute("user");
        if (user_sess == null) {
            response.sendRedirect("Login");
            return;
        }
        int user_id = user_sess.getId();
        UserDBContext userDBContext = new UserDBContext();

        User user = userDBContext.get(user_id);
        request.setAttribute("id", user_id);
        request.setAttribute("avatar", user.getAvatarurl());
        request.setAttribute("fullname", user.getFullname());
        request.setAttribute("email", user.getEmail());
        request.setAttribute("phone", user.getMobile());
        request.getRequestDispatcher("view/PasswordChange.jsp").forward(request, response);
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
        //processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String uid = (String) request.getParameter("id");
        String email = (String) request.getParameter("email");
        String password = (String) request.getParameter("cpass");
        String newpassword = (String) request.getParameter("npass");
        String repassword = (String) request.getParameter("cnpass");
        UserDAO dao = new UserDAO();
        User a = dao.checkUid(uid);

        if (a == null) {
            request.setAttribute("msg", "Please login to change your password!");
            request.getRequestDispatcher("view/PasswordChange.jsp").forward(request, response);
        } else {
            if (newpassword.equals(repassword) && newpassword.length() >= 8) {
                dao.updatePass(newpassword, uid);
                //session.setAttribute("acc", a);
                request.setAttribute("msgt", "Change your password successfully! Please login again!");
                request.setAttribute("useremail", email);
                request.getRequestDispatcher("view/Login.jsp").forward(request, response);
            } else if (newpassword.length() < 8) {
                request.setAttribute("cpass", password);
                request.setAttribute("npass", newpassword);
                request.setAttribute("cnpass", repassword);
                request.setAttribute("msg", "New password must be longer than 8 characters! Please enter new password again!");
                request.getRequestDispatcher("view/PasswordChange.jsp").forward(request, response);
            } else if (!a.getPassword().equals(password)) {
                request.setAttribute("cpass", password);
                request.setAttribute("npass", newpassword);
                request.setAttribute("cnpass", repassword);
                request.setAttribute("msg", "Current password is wrong! Please enter your password again!");
                request.getRequestDispatcher("view/PasswordChange.jsp").forward(request, response);
            } else {
                request.setAttribute("cpass", password);
                request.setAttribute("npass", newpassword);
                request.setAttribute("cnpass", repassword);
                request.setAttribute("msg", "Re-password does not match the new password!");
                request.getRequestDispatcher("view/PasswordChange.jsp").forward(request, response);
            }
        }
//        if (password.equals(session.getAttribute("acc.pass"))) {
//            if (newpassword.equals(repassword)) {
//                dao.updatePass(newpassword, email);               
//                session.setAttribute("acc", dao.getAccount(email, newpassword));
//            } else {
//                request.setAttribute("message", "Re-password does not match the new password!");
//                request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
//            }
//        } else {
//            request.setAttribute("msg", "Wrong password!");
//            request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
//        }

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
