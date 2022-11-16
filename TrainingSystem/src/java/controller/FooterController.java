/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDBContext;
import dal.WebContactDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import model.User;
import model.WebContact;

/**
 *
 * @author trung
 */
public class FooterController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException { 
        WebContactDBContext wcd;
//        = new WebContactDBContext();
//        HashMap<Integer, String> categoryList = wcd.getListCategoryID();
//        HttpSession session = request.getSession();
//        session.setAttribute("categoryList", categoryList);

        String raw_name = request.getParameter("fullname");
        int raw_category = Integer.parseInt(request.getParameter("category"));
        String raw_email = request.getParameter("email");
        String raw_mobile = request.getParameter("mobile");
        String raw_message = request.getParameter("message");
        
        WebContact wc = new WebContact();
        wc.setCategoryid(raw_category);
        wc.setFullname(raw_name);
        wc.setEmail(raw_email);
        wc.setMobile(raw_mobile);
        wc.setMessage(raw_message);
        
        wcd = new WebContactDBContext();
        wcd.add(wc);

        String url = request.getParameter("url");
        String new_url = url.substring(37);

        response.sendRedirect(new_url);
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
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
//<select name="category">
//<c:forEach items="${sessionScope.categogyList}" var="c"><option value="${c.getKey}">${c.getValue}</option></c:forEach>
//</select>
//<input type="password" name="category" class="form-control" placeholder="Contact type (*)">
//for jsp
}
