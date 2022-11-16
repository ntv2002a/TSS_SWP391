/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Math.abs;
import java.security.SecureRandom;
import java.util.Arrays;
import model.GooglePojo;
import model.User;
import utils.EmailUtils;
import utils.GoogleUtils;

/**
 *
 * @author tuand
 */
@WebServlet("/login-google")
public class LoginGoogleController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private String ehost;
    private String eport;
    private String euser;
    private String epass;

    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        ehost = context.getInitParameter("host");
        eport = context.getInitParameter("port");
        euser = context.getInitParameter("user");
        epass = context.getInitParameter("pass");
    }
    public EmailUtils emailutils;

    public LoginGoogleController() {
        super();
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("view/Login.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            String email = googlePojo.getEmail();
            String name = email.replaceAll("((@.*)|[^a-zA-Z])+", " ").trim();
            String avatar = googlePojo.getPicture();
            String namea = googlePojo.getGiven_name();
            String a = googlePojo.getFamily_name();
            UserDAO dao = new UserDAO();
            if (dao.checkEmail(email) == null) {
                String password = generatePassword();
                String subject = "TSS Password";
                String nd = "Thank you " + email + "!\nThis is your password login to The Training System: " + password;
                dao.addUserGoogle(name, email, password, avatar);

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
                User u = dao.getAccountemail(email);
                request.getSession().setAttribute("role", "something");
                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(1000);
                session.setAttribute("user", u);
                request.getRequestDispatcher("home").forward(request, response);
            } else {                
                User u = dao.getAccountemail(email);
                request.getSession().setAttribute("role", "something");
                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(1000);
                session.setAttribute("user", u);
                request.getRequestDispatcher("home").forward(request, response);

            }
//            request.setAttribute("id", googlePojo.getId());
//            request.setAttribute("name", googlePojo.getName());
//            request.setAttribute("email", googlePojo.getEmail());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
