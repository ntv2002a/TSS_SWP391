/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.Math.abs;
import java.security.SecureRandom;
import java.util.Random;
import model.User;
import utils.EmailUtils;

/**
 *
 * @author Lenovo
 */
public class RegisterController extends HttpServlet {

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
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    private String ehost;
    private String eport;
    private String euser;
    private String epass;
    public EmailUtils emailutils;

    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        ehost = context.getInitParameter("host");
        eport = context.getInitParameter("port");
        euser = context.getInitParameter("user");
        epass = context.getInitParameter("pass");
    }

    public String generatePassword() {
        int length = 8;
        SecureRandom rand = new SecureRandom();
        StringBuilder passwordStringBuilder = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int baseCharNumber = abs(rand.nextInt()) % 62;
            int charNumber = 0;
            if (baseCharNumber < 26) {
                charNumber = 65 + baseCharNumber;
            } else if (baseCharNumber < 52) {
                charNumber = 97 + (baseCharNumber - 26);
            } else {
                charNumber = 48 + (baseCharNumber - 52);
            }
            passwordStringBuilder.append((char) charNumber);
        }

        return passwordStringBuilder.toString();
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
        request.getRequestDispatcher("view/Register.jsp").forward(request, response);
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
        String email = request.getParameter("useremailr");
        String name = request.getParameter("usernamer");
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~`!@#$%^&*()-_=+[{]}\\|;:\'\",<.>/?";
        String password = generatePassword();
        UserDAO db = new UserDAO();
        String subject = "TSS Password";
        String nd = "Thank you " + email + "!\nThis is your password login to The Training System: " + password;
        User usermail = db.checkEmail(email);
        if (usermail == null) {
            User user = db.addUser(name, email, password);
            String resultMessage = "";
            try {
                emailutils.sendEmail(ehost, eport, euser, epass, email, subject, nd);
                resultMessage = "The TSS default password was sent successfully. Plase check your mail!";
            } catch (Exception ex) {
                ex.printStackTrace();
                resultMessage = "There were an error: " + ex.getMessage();
            } finally {
                request.setAttribute("Message", resultMessage);
            }
            request.setAttribute("usernamer", name);
            request.setAttribute("useremailr", email);
            request.setAttribute("msgt", resultMessage);
            request.getRequestDispatcher("view/Register.jsp").forward(request, response);
        } else {
            request.setAttribute("usernamer", name);
            request.setAttribute("useremailr", email);
            request.setAttribute("msg", "The email you entered is already registered in the system.");
            request.getRequestDispatcher("view/Register.jsp").forward(request, response);
        }
        request.getRequestDispatcher("view/Login.jsp").forward(request, response);
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
