/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
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
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.User;
import utils.EmailUtils;
import utils.EmailUtils;

/**
 *
 * @author tuand
 */
@WebServlet("/EmailSending")
public class EmailSendingController extends HttpServlet {

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

    private static Message htmlForm(Session session, String account, String to, String subject, String link) {
        final String content = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    \n"
                + "</head>\n"
                + "<body>\n"
                + "    <div class=\"form\">\n"
                + "        <div class=\"content\">\n"
                + "            <h1>TSS</h1>\n"
                + "            <p>\n"
                + "                <a href=\"" + link + "\">This is your reset password link!</a>\n"
                + "            </p>\n"
                + "\n"
                + "            \n"
                + "        </div>\n"
                + "    </div>\n"
                + "</body>\n"
                + "</html>";

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(account));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setContent(content, "text/html; charset=UTF-8");
            return message;
        } catch (MessagingException mex) {
            System.out.println(mex);
        }
        return null;
    }
    public void sendHTMLEmail(String euser,String epass, final String to,  final String subject, final String link) throws MessagingException {
        final String account = euser;
        final String password = epass;
        Properties properties = System.getProperties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.auth", "true");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(account, password);
            }
        });

        session.setDebug(true);
        Message message = htmlForm(session, account, to, subject, link);
        Transport.send(message);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/SendEmailReset.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
        String email = request.getParameter("useremailreset");
        String subject = "TSS Password";
        String Link = "http://localhost:8080/TrainingSystem/Login";                                    
        UserDAO db = new UserDAO();
        User usermail = db.checkEmail(email);
        if (usermail != null) {
            //User user = db.addUser(name, email, password);
            String resultMessage = "";
            try {               
                sendHTMLEmail(euser, epass, email, "Reset Password", "http://localhost:8080/TrainingSystem/getlink?email=" + email);
                //emailutils.sendEmail(ehost, eport, euser, epass, email, subject, ND);
                resultMessage = "The e-mail with TSS password was sent successfully";
            } catch (Exception ex) {
                ex.printStackTrace();
                resultMessage = "There were an error: " + ex.getMessage();
            } finally {
            request.setAttribute("msgt", resultMessage);
//            request.getRequestDispatcher("EmailSending").forward(request, response);
            }
            request.setAttribute("msgt", resultMessage);
            request.getRequestDispatcher("view/Message.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "Your email you entered is not registered in the system!");
            request.getRequestDispatcher("view/Message.jsp").forward(request, response);          
        }
request.getRequestDispatcher("view/Message.jsp").forward(request, response);
    }
}
