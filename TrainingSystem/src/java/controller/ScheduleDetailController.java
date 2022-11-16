/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AttendanceDBContext;
import dal.ClassDBContext;
import dal.RoomDBContext;
import dal.ScheduleDBContext;
import dal.SlotDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import model.Room;
import model.Schedule;
import model.Slot;
import model.Class;
import model.User;

/**
 *
 * @author duyng
 */
public class ScheduleDetailController extends HttpServlet {

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
        User user = (User)request.getSession().getAttribute("user");
        
        String action = request.getParameter("action");
        int id;

        ScheduleDBContext scdbc = new ScheduleDBContext();
        Schedule schedule;
        SlotDBContext sldbc;
        ArrayList<Slot> slots;
        RoomDBContext rdbc;
        ArrayList<Room> rooms;
        Date today = new Date(System.currentTimeMillis());

        switch (action) {
            case "view":
                id = Integer.parseInt(request.getParameter("id"));
                schedule = scdbc.get(id);
                request.setAttribute("schedule", schedule);
                break;
            case "edit":
                
                id = Integer.parseInt(request.getParameter("id"));
                schedule = scdbc.get(id);
                request.setAttribute("schedule", schedule);
                
                AttendanceDBContext adbc = new AttendanceDBContext();
                boolean isTaken = adbc.isTaken(id);
                if (isTaken) {
                    action = "view";
                    break;
                }

                sldbc = new SlotDBContext();
                slots = sldbc.list();
                request.setAttribute("slots", slots);

                rdbc = new RoomDBContext();
                rooms = rdbc.list();
                request.setAttribute("rooms", rooms);

                request.setAttribute("today", today);

                break;
            case "add":
                sldbc = new SlotDBContext();
                slots = sldbc.list();
                request.setAttribute("slots", slots);

                rdbc = new RoomDBContext();
                rooms = rdbc.list();
                request.setAttribute("rooms", rooms);

                ClassDBContext cdbc = new ClassDBContext();
                ArrayList<Class> classes = cdbc.listBySupporter(user.getId());
                request.setAttribute("classes", classes);

                request.setAttribute("today", today);

                break;
        }

        request.setAttribute("action", action);
        request.getRequestDispatcher("view/ScheduleDetail.jsp").forward(request, response);

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
        User user = (User)request.getSession().getAttribute("user");
        
        String action = request.getParameter("action");
        int id;
        int actionStatus = 0;
        String sqlMessage = "";

        ScheduleDBContext scdbc = new ScheduleDBContext();
        Schedule schedule;
        SlotDBContext sldbc;
        ArrayList<Slot> slots;
        RoomDBContext rdbc;
        ArrayList<Room> rooms;
        ClassDBContext cdbc;
        ArrayList<Class> classes;
        Date today = new Date(System.currentTimeMillis());

        int slot_id;
        String title;
        Date date;
        int room_id;

        switch (action) {
            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                schedule = scdbc.get(id);

                slot_id = Integer.parseInt(request.getParameter("slot"));
                schedule.setSlot(new Slot(slot_id, null, null, null));

                title = request.getParameter("title").trim();
                schedule.setTitle(title);

                date = Date.valueOf(request.getParameter("date"));
                schedule.setTraining_date(date);

                room_id = Integer.parseInt(request.getParameter("room"));
                schedule.setRoom(new Room(room_id, null));
                actionStatus = scdbc.updateSchedule(schedule);
                request.setAttribute("actionStatus", actionStatus);

                schedule = scdbc.get(id);
                request.setAttribute("schedule", schedule);

                break;

            case "add":
                schedule = new Schedule();

                int class_id = Integer.parseInt(request.getParameter("class"));
                cdbc = new ClassDBContext();
                Class c = cdbc.get(class_id);
                schedule.setClassroom(c);

                slot_id = Integer.parseInt(request.getParameter("slot"));
                schedule.setSlot(new Slot(slot_id, null, null, null));

                schedule.setTitle(request.getParameter("title").trim());

                schedule.setTraining_date(Date.valueOf(request.getParameter("date")));

                room_id = Integer.parseInt(request.getParameter("room"));
                schedule.setRoom(new Room(room_id, null));

                actionStatus = scdbc.addSchedule(schedule);
                request.setAttribute("actionStatus", actionStatus);
                int lastestId = scdbc.getLastestId();
                schedule = scdbc.get(lastestId);
                request.setAttribute("id", lastestId);
                
                if (actionStatus > 0) {
                    request.setAttribute("schedule", schedule);

                    sldbc = new SlotDBContext();
                    slots = sldbc.list();
                    request.setAttribute("slots", slots);

                    rdbc = new RoomDBContext();
                    rooms = rdbc.list();
                    request.setAttribute("rooms", rooms);

                    request.setAttribute("action", "edit");
                    request.getRequestDispatcher("view/ScheduleDetail.jsp").forward(request, response);
                    return;
                }

                break;
        }

        sldbc = new SlotDBContext();
        slots = sldbc.list();
        request.setAttribute("slots", slots);

        rdbc = new RoomDBContext();
        rooms = rdbc.list();
        request.setAttribute("rooms", rooms);
        
        cdbc = new ClassDBContext();
        classes = cdbc.listBySupporter(user.getId());
        request.setAttribute("classes", classes);

        request.setAttribute("today", today);
        request.setAttribute("action", action);
        request.getRequestDispatcher("view/ScheduleDetail.jsp").forward(request, response);
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
