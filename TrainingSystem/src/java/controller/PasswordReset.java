package controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import model.User;

/**
 *
 * @author tuand
 */
public class PasswordReset extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ad</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ad at " + request.getContextPath() + "</h1>");
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
        String npass = request.getParameter("npass");
        String cnpass = request.getParameter("cnpass");
        String email = request.getParameter("email");

        UserDAO dao = new UserDAO();
        if (npass.equals(cnpass) && npass.length() >= 8) {
            request.setAttribute("msgt", "Your password has been reset successfully, please login again!");
            request.setAttribute("email", email);
            dao.updatePassMail(npass, email);
            request.getRequestDispatcher("view/Login.jsp").forward(request, response);
        } else if (!npass.equals(cnpass)) {
            request.setAttribute("email", email);
            request.setAttribute("npass", npass);
            request.setAttribute("cnpass", cnpass);
            request.setAttribute("msg", "Change password unsuccessful! Re-password does not match the new password!");
            request.getRequestDispatcher("/view/PasswordReset.jsp").forward(request, response);
        } else {
            request.setAttribute("email", email);
            request.setAttribute("npass", npass);
            request.setAttribute("cnpass", cnpass);
            request.setAttribute("msg", "Change password unsuccessful! New password must contain more than 8 characters");
            request.getRequestDispatcher("/view/PasswordReset.jsp").forward(request, response);
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
    }// </edito

}
