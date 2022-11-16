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
public class ClassDetailController extends HttpServlet {

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
            out.println("<title>Servlet ClassDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClassDetailController at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        User manager = (User) request.getSession().getAttribute("user");
        ClassDBContext cldc;

        if (action != null && action.equalsIgnoreCase("add")) {
            cldc = new ClassDBContext();
            ArrayList<Subject> list_subjects = cldc.listSubject(manager.getId());

            cldc = new ClassDBContext();
            ArrayList<Setting> list_terms = cldc.listTerm();

            cldc = new ClassDBContext();
            ArrayList<User> list_trainers = cldc.listTrainer();
            cldc = new ClassDBContext();
            ArrayList<User> list_supporters = cldc.listSupporter();

            request.setAttribute("subjects", list_subjects);
            request.setAttribute("terms", list_terms);
            request.setAttribute("trainers", list_trainers);
            request.setAttribute("supporters", list_supporters);
            request.setAttribute("action", "add");
            request.getRequestDispatcher("../view/ClassDetail.jsp").forward(request, response);
        } else {

            int id = Integer.parseInt(request.getParameter("id"));

            cldc = new ClassDBContext();
            Class c = cldc.get(id);

            cldc = new ClassDBContext();
            ArrayList<Subject> list_subjects = cldc.listSubject(manager.getId());

            cldc = new ClassDBContext();
            ArrayList<Setting> list_terms = cldc.listTerm();

            cldc = new ClassDBContext();
            ArrayList<User> list_trainers = cldc.listTrainer();
            cldc = new ClassDBContext();
            ArrayList<User> list_supporters = cldc.listSupporter();

            request.setAttribute("cldetail", c);
            request.setAttribute("subjects", list_subjects);
            request.setAttribute("terms", list_terms);
            request.setAttribute("trainers", list_trainers);
            request.setAttribute("supporters", list_supporters);

            request.getRequestDispatcher("../view/ClassDetail.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        if (action != null && action.equalsIgnoreCase("add")) {
            String class_name = request.getParameter("class_name");
            int class_subject = Integer.parseInt(request.getParameter("class_subject"));
            int class_term = Integer.parseInt(request.getParameter("class_term"));
            int trainer_id = Integer.parseInt(request.getParameter("trainerId"));
            int supporter_id = Integer.parseInt(request.getParameter("supporterId"));
            int class_status = Integer.parseInt(request.getParameter("class_status"));
            String description = request.getParameter("description");
            if (description == null) {
                description = "";
            }

            ClassDBContext cldc;
            Class c = new Class();

            cldc = new ClassDBContext();
            Subject s = cldc.getSubject(class_subject);

            cldc = new ClassDBContext();
            Setting st = cldc.getSetting(class_term);

            cldc = new ClassDBContext();
            User trainer = cldc.getTrainer(trainer_id);

            cldc = new ClassDBContext();
            User supporter = cldc.getSupporter(supporter_id);

            c.setClass_code(class_name);
            c.setSubject_id(s);
            c.setTerm_id(st);
            c.setTrainer_id(trainer);
            c.setSupporter_id(supporter);
            c.setStatus(class_status);
            c.setDescription(description);
            
            cldc = new ClassDBContext();
            int status = cldc.adds(c);
            
            if (status > 0) {
                response.sendRedirect("/TrainingSystem/class/list");
            }
            else {
                response.getWriter().println("Add Fail!");
            }
            
        } else {

            int id = Integer.parseInt(request.getParameter("id"));

            ClassDBContext cldc;
            Class c = new Class();

            int subject_id = Integer.parseInt(request.getParameter("subjectId"));
            cldc = new ClassDBContext();
            Subject s = cldc.getSubject(subject_id);

            int term_id = Integer.parseInt(request.getParameter("termId"));
            cldc = new ClassDBContext();
            Setting st = cldc.getSetting(term_id);

            int trainer_id = Integer.parseInt(request.getParameter("trainerId"));
            cldc = new ClassDBContext();
            User trainer = cldc.getTrainer(trainer_id);

            int supporter_id = Integer.parseInt(request.getParameter("supporterId"));
            cldc = new ClassDBContext();
            User supporter = cldc.getSupporter(supporter_id);

            String des = request.getParameter("description");

            c.setClass_id(id);
            c.setSubject_id(s);
            c.setTerm_id(st);
            c.setTrainer_id(trainer);
            c.setSupporter_id(supporter);
            c.setStatus(-1);
            c.setDescription(des);

            cldc = new ClassDBContext();
            int updateStatus = cldc.updates(c);

            cldc = new ClassDBContext();
            Class c1 = cldc.get(id);

            User manager = (User) request.getSession().getAttribute("user");

            cldc = new ClassDBContext();
            ArrayList<Subject> list_subjects = cldc.listSubject(manager.getId());

            cldc = new ClassDBContext();
            ArrayList<Setting> list_terms = cldc.listTerm();

            cldc = new ClassDBContext();
            ArrayList<User> list_trainers = cldc.listTrainer();
            cldc = new ClassDBContext();
            ArrayList<User> list_supporters = cldc.listSupporter();

            request.setAttribute("cldetail", c1);
            request.setAttribute("subjects", list_subjects);
            request.setAttribute("terms", list_terms);
            request.setAttribute("trainers", list_trainers);
            request.setAttribute("supporters", list_supporters);
            request.setAttribute("updateState", updateStatus);

            request.getRequestDispatcher("../view/ClassDetail.jsp").forward(request, response);
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
