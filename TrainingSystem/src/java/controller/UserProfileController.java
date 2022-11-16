/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import controller.admin.UserListController;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.net.URL;
import model.User;

/**
 *
 * @author Lenovo
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UserProfileController extends HttpServlet {

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
            out.println("<title>Servlet UserProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserProfileController at " + request.getContextPath() + "</h1>");
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
        HttpSession ses = request.getSession();
        User user_sess = (User) ses.getAttribute("user");
        if(user_sess == null) {
            response.sendRedirect("Login");
            return;
        }
        int user_id = user_sess.getId();
        String success = request.getParameter("success");
        UserDBContext userDBContext = new UserDBContext();
        User user = userDBContext.get(user_id);
        request.setAttribute("id", user_id);
        request.setAttribute("success", success);
        request.setAttribute("avatar", user.getAvatarurl());
        request.setAttribute("fullname", user.getFullname());
        request.setAttribute("email", user.getEmail());
        request.setAttribute("phone", user.getMobile());
        
        String role = request.getParameter("role");
        if(role!=null){
            request.getRequestDispatcher("view/admin/UserProfile.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("view/UserProfile.jsp").forward(request, response);
        }
        
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
        HttpSession ses = request.getSession();
        User user_sess = (User) ses.getAttribute("user");
        if(user_sess == null) {
            response.sendRedirect("Login");
            return;
        }
        int user_id = user_sess.getId();
        UserDBContext userDBContext = new UserDBContext();
        User user = userDBContext.get(user_id);
        File deleteFile = new File(this.getFolderUpload().getAbsolutePath() + File.separator + user.getAvatarurl());
        try{
            deleteFile.delete();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        
        Part filePart = request.getPart("avatar");
        String fileName = request.getPart("avatar").toString();
        fileName = new File(fileName).getName();
        filePart.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone");
        String company = request.getParameter("company");
        String position = request.getParameter("position");
        String address = request.getParameter("address");

        user.setAvatarurl(fileName);
        user.setFullname(fullname);
        user.setEmail(email);
        user.setMobile(phoneNumber);
        userDBContext = new UserDBContext();
        userDBContext.update(user, user_id);

        ses.removeAttribute("user");
        ses.setAttribute("user", user);
        response.sendRedirect("profile?success=1");
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    
    public File getFolderUpload() {
        URL location = UserListController.class.getProtectionDomain()
                .getCodeSource().getLocation();
        File file = new File(location.getFile());
        File folderUpload = new File(file.getParentFile().getParentFile().getParentFile().getParent() + "/web/img");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
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
