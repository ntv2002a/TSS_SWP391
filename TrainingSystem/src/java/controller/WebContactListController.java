/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.WebContactDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.User;
import model.WebContact;

/**
 *
 * @author trung
 */
public class WebContactListController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Integer supporterId;
    Integer categoryId;
    Boolean response;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User sp = (User) request.getSession().getAttribute("user");
        supporterId = sp.getId();
        String page = request.getParameter("page");

        WebContactDBContext wdc = new WebContactDBContext();
        ArrayList<Integer> cids = wdc.getCategoryID();

        if (page == null) {
            page = "1";
        }
        int pageindex = Integer.parseInt(page);
        int pagesize = Integer.parseInt(request.getServletContext().getInitParameter("pagesize"));

        wdc = new WebContactDBContext();
        ArrayList<WebContact> wcs = wdc.filter(pageindex, pagesize, supporterId, categoryId, this.response);

        wdc = new WebContactDBContext();
        int count = wdc.count(supporterId, categoryId, this.response);

        int totalpage = (count % pagesize == 0) ? (count / pagesize)
                : (count / pagesize) + 1;

        request.setAttribute("categoryId", categoryId);
        request.setAttribute("webcontacts", wcs);
        request.setAttribute("categories", cids);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("pagesize", pagesize);

        request.getRequestDispatcher("../view/WebContactList.jsp").forward(request, response);

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
        String cid = request.getParameter("categoryid");

        if (cid.equals("-1")) {
            categoryId = null;
        } else {
            categoryId = Integer.parseInt(cid);
        }
        
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
