/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.SettingDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Setting;
import model.User;




/**
 *
 * @author ACER
 */
public class SettingListController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Integer type;
    Boolean status;
    String title;
    SettingDBContext setdb = new SettingDBContext();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        setdb = new SettingDBContext();
        int pagesize = Integer.parseInt(request.getServletContext().getInitParameter("pagesize"));
        String page = request.getParameter("page");
        if (page == null) {
            page = "1";
        }
        int pageindex = Integer.parseInt(page);
        int count = setdb.count(type,status,title);
        int totalpage = (count % pagesize == 0) ? (count / pagesize)
                : (count / pagesize) + 1;
        ArrayList<Setting> sets = setdb.getSettingListWithFilter(pageindex, pagesize, type, status, title);
        ArrayList<Setting> types = setdb.listType();
        
        request.setAttribute("type_id", type);
        request.setAttribute("status", status);
        request.setAttribute("title", title);
        request.setAttribute("types", types);
        request.setAttribute("settings", sets);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalpage", totalpage);
        request.getRequestDispatcher("../../view/admin/SettingList.jsp").forward(request, response);
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
        String type_raw = request.getParameter("type");
        String status_raw = request.getParameter("status");
        String title_raw = request.getParameter("title");
        String status_change_raw = request.getParameter("status_change");
        
        
        String[] status_change_split = (status_change_raw !=null && status_change_raw.length() >0) ? status_change_raw.split("_") :null;
        
        
        if(status_change_split != null){
            Boolean status_change = (status_change_split[0].equals("activate")) ? true:false;
            int setting_id = Integer.parseInt(status_change_split[1]);
            Setting s = new Setting();
            Setting type = new Setting();
            type.setSetting_id(-1);
            s.setSetting_id(setting_id);
            s.setType_id(type);
            s.setStatus(status_change);
            
            HttpSession session = request.getSession();
            User u = (User) session.getAttribute("user");
            setdb.saveSettingChange(u,s);
        }
        
        type = (type_raw !=null && type_raw.length() >0 && !type_raw.equals("-1")) ? new Integer(type_raw):null;
        status = (status_raw !=null && status_raw.length() >0 && !status_raw.equals("both"))? status_raw.equals("active"):null;
        title = (title_raw !=null && title_raw.length() >0) ? title_raw:null;
        
        
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
