/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ClassDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Class;
import model.Setting;
import model.Subject;
import model.User;

/**
 *
 * @author trung
 */
public class ClassListController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String code;
    Integer subject_id;
    Integer trainer_id;
    Integer supporter_id;
    Integer term_id;
    Integer status;
    String description;
    User manager_id;
    boolean firsttime = true;

    ClassDBContext cldc = new ClassDBContext();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        manager_id = (User) request.getSession().getAttribute("user");
        cldc = new ClassDBContext();
        int pagesize = Integer.parseInt(request.getServletContext().getInitParameter("pagesize"));
        String page = request.getParameter("page");
        if (page == null) {
            page = "1";
        }
        int pageindex = Integer.parseInt(page);
        int count = cldc.count(code, subject_id, term_id, trainer_id, supporter_id, status, manager_id.getId());
        int totalpage = (count % pagesize == 0) ? (count / pagesize)
                : (count / pagesize) + 1;
        cldc = new ClassDBContext();
        ArrayList<Class> classes = cldc.filter(pageindex, pagesize, code, subject_id, term_id, trainer_id, supporter_id, status, manager_id.getId());
        cldc = new ClassDBContext();
        ArrayList<Subject> list_subjects = cldc.listSubject(manager_id.getId());
        cldc = new ClassDBContext();
        ArrayList<Setting> list_terms = cldc.listTerm();
        cldc = new ClassDBContext();
        ArrayList<User> list_trainers = cldc.listTrainer();
        cldc = new ClassDBContext();
        ArrayList<User> list_supporters = cldc.listSupporter();
        cldc = new ClassDBContext();
        ArrayList<Integer> list_status = cldc.listStatus();

        request.setAttribute("pagesize", pagesize);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("classes", classes);
        request.setAttribute("subjects", list_subjects);
        request.setAttribute("terms", list_terms);
        request.setAttribute("trainers", list_trainers);
        request.setAttribute("supporters", list_supporters);
        request.setAttribute("status", list_status);
        request.setAttribute("subjectID", subject_id);
        request.setAttribute("trainerID", trainer_id);
        request.setAttribute("supporterID", supporter_id);
        request.setAttribute("termID", term_id);
        request.setAttribute("statusFlag", status);

        request.getRequestDispatcher("../view/ClassList.jsp").forward(request, response);
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
        if (firsttime) {
            code = null;
            subject_id = null;
            trainer_id = null;
            supporter_id = null;
            term_id = null;
            status = null;
            firsttime = false;
        }
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
        String raw_code = request.getParameter("search_by_code");
        String raw_subject_id = request.getParameter("subjectId");
        String raw_trainer_id = request.getParameter("trainerId");
        String raw_supporter_id = request.getParameter("supporterId");
        String raw_term_id = request.getParameter("termId");
        String raw_status = request.getParameter("status");
        String raw_status_check = request.getParameter("status_change_check");

        if (raw_status_check != null) {
            int status_id = Integer.parseInt(raw_status_check);
            int status_new = Integer.parseInt(request.getParameter("status_change_" + status_id));

            Class cl = new Class();
            cl.setClass_code(null);

            Subject s = new Subject();
            s.setId(-1);

            cl.setSubject_id(s);

            User u = new User();
            u.setId(-1);

            cl.setTrainer_id(u);

            u = new User();
            u.setId(-1);

            cl.setSupporter_id(u);

            Setting st = new Setting();
            st.setSetting_id(-1);

            cl.setTerm_id(st);
            cl.setClass_id(status_id);
            cl.setStatus(status_new);
            cl.setDescription(null);
            cldc = new ClassDBContext();
            cldc.update(cl);
        }

        code = (raw_code != null && raw_code.trim().length() > 0) ? raw_code : null;
        subject_id = (raw_subject_id != null && raw_subject_id.length() > 0 && !raw_subject_id.equals("-1")) ? new Integer(raw_subject_id) : null;
        trainer_id = (raw_trainer_id != null && raw_trainer_id.length() > 0 && !raw_trainer_id.equals("-1")) ? new Integer(raw_trainer_id) : null;
        supporter_id = (raw_supporter_id != null && raw_supporter_id.length() > 0 && !raw_supporter_id.equals("-1")) ? new Integer(raw_supporter_id) : null;
        term_id = (raw_term_id != null && raw_term_id.length() > 0 && !raw_term_id.equals("-1")) ? new Integer(raw_term_id) : null;
        status = (raw_status != null && raw_status.length() > 0 && !raw_status.equals("-1")) ? new Integer(raw_status) : null;
        manager_id = (User) request.getSession().getAttribute("user");

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
