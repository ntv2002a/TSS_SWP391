/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.MilestoneDBContext;
import dal.SubmitDBContext;
import dal.TeamDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Milestone;
import model.Team;
import model.Class;
import model.Submit;
import model.User;

/**
 *
 * @author trung
 */
public class TeamDetailController extends HttpServlet {

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
            out.println("<title>Servlet TeamDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TeamDetailController at " + request.getContextPath() + "</h1>");
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
        String actioncheck = request.getParameter("action");
        if (actioncheck.equalsIgnoreCase("add")) {
            int raw_milestone_id = Integer.parseInt(request.getParameter("milestone_id"));
            MilestoneDBContext mdc = new MilestoneDBContext();
            Milestone m = mdc.get(raw_milestone_id);
            
            request.setAttribute("milestones", m);
            request.setAttribute("milestone", raw_milestone_id);
            request.getRequestDispatcher("../view/TeamDetail.jsp").forward(request, response);
        } else {
            int raw_team_id = Integer.parseInt(request.getParameter("team_id"));

            TeamDBContext tdc = new TeamDBContext();
            Team team = tdc.get(raw_team_id);

            request.setAttribute("team", team);
            request.setAttribute("team_id", raw_team_id);

            request.getRequestDispatcher("../view/TeamDetail.jsp").forward(request, response);
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
        String actioncheck = request.getParameter("action");
        if (actioncheck.equalsIgnoreCase("add")) {
            int raw_milestone_id = Integer.parseInt(request.getParameter("milestone_id"));

            String raw_team_code = request.getParameter("team_code").trim().length() > 0 ? request.getParameter("team_code").trim() : null;
            String raw_topic_name = request.getParameter("topic_name").trim().length() > 0 ? request.getParameter("topic_name").trim() : null;
            Boolean raw_status = request.getParameter("status").equals("1");
            String raw_description = request.getParameter("description").trim().length() > 0 ? request.getParameter("description").trim() : null;

            TeamDBContext tdc = new TeamDBContext();
            MilestoneDBContext mdc = new MilestoneDBContext();
            Milestone m = mdc.get(raw_milestone_id);

            Team insert_team = new Team();

            Class c = new Class();
            c.setClass_id(m.getClass_milestone().getClass_id());

            insert_team.setClass_id(c);
            insert_team.setTeam_code(raw_team_code);
            insert_team.setTopic_name(raw_topic_name);
            insert_team.setStatus(raw_status);
            insert_team.setDescription(raw_description);

            int insertTeamStatus = tdc.adds(insert_team);
            int insertSubmitStatus = 0;

            if (insertTeamStatus > 0) {

                //UserDBContext udc = new UserDBContext();
                User u = (User) request.getSession().getAttribute("user");

                SubmitDBContext sdc = new SubmitDBContext();
                Submit insert_submit = new Submit();
                
                insert_team.setTeam_id(insertTeamStatus);
                
                insert_submit.setMilestone_id(m);
                insert_submit.setClass_id(c);
                insert_submit.setTeam_id(insert_team);
                insert_submit.setUser_id(u);

                insertSubmitStatus = sdc.adds(insert_submit);
            }

            int insertStatus = 0;

            if (insertTeamStatus > 0 && insertSubmitStatus > 0) {
                insertStatus = 1;
            }

            request.setAttribute("milestones", m);
            request.setAttribute("insertState", insertStatus);
            request.setAttribute("milestone", raw_milestone_id);
            request.getRequestDispatcher("../view/TeamDetail.jsp").forward(request, response);
        } else {
            int raw_team_id = Integer.parseInt(request.getParameter("team_id"));

            TeamDBContext tdc = new TeamDBContext();
            Team rollback_team = tdc.get(raw_team_id);

            String raw_team_code = request.getParameter("team_code").trim().length() > 0 ? request.getParameter("team_code").trim() : null;
            String raw_topic_name = request.getParameter("topic_name").trim().length() > 0 ? request.getParameter("topic_name").trim() : null;
            Boolean raw_status = request.getParameter("status").equals("1");
            String raw_description = request.getParameter("description").trim().length() > 0 ? request.getParameter("description").trim() : null;

            Team update_team = new Team();
            update_team.setTeam_id(raw_team_id);
            update_team.setTeam_code(raw_team_code);
            update_team.setTopic_name(raw_topic_name);
            update_team.setStatus(raw_status);
            update_team.setDescription(raw_description);

            tdc = new TeamDBContext();
            int updateStatus = tdc.updates(update_team);

            if (updateStatus <= 0) {
                request.setAttribute("team", rollback_team);
            } else {
                tdc = new TeamDBContext();
                Team team = tdc.get(raw_team_id);

                request.setAttribute("team", team);
                request.setAttribute("team_id", raw_team_id);
            }

            request.setAttribute("updateState", updateStatus);
            request.getRequestDispatcher("../view/TeamDetail.jsp").forward(request, response);
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
