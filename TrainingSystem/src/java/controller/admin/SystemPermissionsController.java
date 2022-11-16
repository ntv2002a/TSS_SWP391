/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.SettingDBContext;
import dal.SystemPermissionDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Permission;
import model.Setting;

/**
 *
 * @author ACER
 */
public class SystemPermissionsController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    SystemPermissionDBContext spdb;
    ArrayList<Permission> perms;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SettingDBContext setdb = new SettingDBContext();
        int pagesize = Integer.parseInt(request.getServletContext().getInitParameter("pagesize"));
        String page = request.getParameter("page");
        if (page == null) {
            page = "1";
        }
        int pageindex = Integer.parseInt(page);
        int count = setdb.countScreen();
        int totalpage = (count % pagesize == 0) ? (count / pagesize)
                : (count / pagesize) + 1;

        ArrayList<Setting> roles = setdb.listRole();
        ArrayList<Setting> screens = setdb.listScreenWithPagination(pageindex, pagesize);

        spdb = new SystemPermissionDBContext();
        perms = spdb.listPermissionByScreens(screens);

        request.setAttribute("perms", perms);
        request.setAttribute("roles", roles);
        request.setAttribute("screens", screens);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalpage", totalpage);
        request.getRequestDispatcher("../../view/admin/SystemPermissions.jsp").forward(request, response);
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
        Boolean flag = false;
        ArrayList<Permission> permissions = new ArrayList<>();

        for (Permission perm : perms) {
            String[] perms_string = request.getParameterValues(perm.getScreen_id() + "_" + perm.getRole_id());
            Permission perms_change = new Permission();
            Boolean get_all_data = false;
            Boolean can_delete = false;
            Boolean can_add = false;
            Boolean can_edit = false;

            Boolean check = false;

            if (perms_string != null) {
                for (String string : perms_string) {
                    int action = Integer.parseInt(string.split("_")[0]);

                    switch (action) {
                        case 1:
                            get_all_data = true;
                            break;
                        case 2:
                            can_delete = true;
                            break;
                        case 3:
                            can_add = true;
                            break;
                        case 4:
                            can_edit = true;
                            break;
                    }
                }
            }
            
            if (perm.getGet_all_data() != get_all_data) {
                perms_change.setGet_all_data(get_all_data);
                check = true;
            }

            if (perm.getCan_delete() != can_delete) {
                perms_change.setCan_delete(can_delete);
                check = true;
            }

            if (perm.getCan_add() != can_add) {
                perms_change.setCan_add(can_add);
                check = true;
            }

            if (perm.getCan_edit() != can_edit) {
                perms_change.setCan_edit(can_edit);
                check = true;
            }

            if (check) {
                perms_change.setScreen_id(perm.getScreen_id());
                perms_change.setRole_id(perm.getRole_id());
                permissions.add(perms_change);
            }
        }

        spdb.savePermissionsChange(permissions);
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
