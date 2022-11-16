/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.SettingDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Setting;
import model.User;

/**
 *
 * @author ACER
 */
public class SettingDetailController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Setting setting;
    Boolean confirm = false;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SettingDBContext setdb = new SettingDBContext();

        String id = request.getParameter("id");
        ArrayList<Setting> types = setdb.listType();
        request.setAttribute("types", types);

        if (confirm) {
            request.setAttribute("success", confirm);
        }
        confirm = false;
        if (id == null) {
            request.setAttribute("action", "add");
            request.getRequestDispatcher("../../view/admin/SettingDetails.jsp").forward(request, response);
            return;
        }

        setting = setdb.getSettingByID(Integer.parseInt(id));

        request.setAttribute("action", "edit");
        request.setAttribute("setting", setting);
        request.getRequestDispatcher("../../view/admin/SettingDetails.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        String type_raw = request.getParameter("type");
        String title = request.getParameter("title");
        String value = request.getParameter("value");
        String order = request.getParameter("order");
        String status_raw = request.getParameter("status");
        String description = request.getParameter("description");

        Boolean check = false;
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        SettingDBContext setdb = new SettingDBContext();

        int type = (type_raw == null) ? -1 : Integer.parseInt(type_raw);
        Boolean status = status_raw.equals("active");

        if (action.equalsIgnoreCase("add")) {
            Setting newset = new Setting();

            Setting newtype = new Setting();

            newtype.setSetting_id(type);
            newset.setType_id(newtype);
            newset.setSetting_title(title);
            newset.setSetting_value(value);
            newset.setDisplay_order(order);
            newset.setStatus(status);
            newset.setDescription(description);

            setdb.add(u, newset);

            response.sendRedirect("detail");

            confirm = true;
        }

        if (action.equalsIgnoreCase("edit")) {
            Setting setting_change = new Setting();
            Setting type_change = new Setting();

            if (type != setting.getType_id().getSetting_id()) {
                type_change.setSetting_id(type);
                setting_change.setType_id(type_change);
                check = true;
            } else {
                type_change.setSetting_id(-1);
                setting_change.setType_id(type_change);
            }

            if (!title.equals(setting.getSetting_title())) {
                setting_change.setSetting_title(title);
                check = true;
            }

            if (!value.equals(setting.getSetting_value())) {
                setting_change.setSetting_value(value);
                check = true;
            }

            if (!order.equals(setting.getDisplay_order())) {
                setting_change.setDisplay_order(order);
                check = true;
            }

            if (status != setting.getStatus()) {
                setting_change.setStatus(status);
                check = true;
            }

            if (!description.equals(setting.getDescription())) {
                setting_change.setDescription(description);
                check = true;
            }

            if (check) {
                setting_change.setSetting_id(setting.getSetting_id());

                confirm = true;

                setdb.saveSettingChange(u, setting_change);
            }

            response.sendRedirect("detail?id=" + setting.getSetting_id());
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
    }// </editor-fold>

}
