/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.SettingDBContext;
import dal.SubjectSettingDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Setting;
import model.SubjectSetting;

/**
 *
 * @author duyng
 */
public class SubjectSettingListController extends HttpServlet {
   
    Integer typeID;
    String namepart;
    
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        SubjectSettingDBContext ssdbc = new SubjectSettingDBContext();
        
        String page = request.getParameter("page");
        if (page == null || page.equals(""))
            page = "1";
        int pageIndex = Integer.parseInt(page);
        int pageSize = 8;
        if (namepart == null)
            namepart = "";
        ArrayList<SubjectSetting> subjectSettings = ssdbc.filter(typeID, namepart, pageIndex, pageSize);
        
        int count = ssdbc.countFilter(typeID, namepart);
        int totalpage = (count % pageSize == 0) ? (count / pageSize)
                : (count / pageSize) + 1;
        
        SettingDBContext sdbc = new SettingDBContext();
        ArrayList<Setting> types = sdbc.listByType(4);
        
        request.setAttribute("subjectSettings", subjectSettings);
        request.setAttribute("types", types);
        request.setAttribute("typeID", typeID);
        request.setAttribute("namepart", namepart);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("totalpage", totalpage);
        request.getRequestDispatcher("view/SubjectSettingList.jsp").forward(request, response);
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
        String type = request.getParameter("type");
        typeID = type.equals("-1")? null : Integer.parseInt(type);
        namepart = request.getParameter("namepart");
        
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

}
