/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author duyng
 */
public class Schedule {
    int schedule_id;
    Class classroom;
    Slot slot;
    String title;
    Date training_date;
    Room room;

    public Schedule() {
    }

    public Schedule(int schedule_id, Class classroom, Slot slot, String title, Date training_date, Room room) {
        this.schedule_id = schedule_id;
        this.classroom = classroom;
        this.slot = slot;
        this.title = title;
        this.training_date = training_date;
        this.room = room;
    }

    public int getSchedule_id() {
        return schedule_id;
    }

    public void setSchedule_id(int schedule_id) {
        this.schedule_id = schedule_id;
    }

    public Class getClassroom() {
        return classroom;
    }

    public void setClassroom(Class classroom) {
        this.classroom = classroom;
    }

    public Slot getSlot() {
        return slot;
    }

    public void setSlot(Slot slot) {
        this.slot = slot;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getTraining_date() {
        return training_date;
    }

    public void setTraining_date(Date training_date) {
        this.training_date = training_date;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    @Override
    public String toString() {
        return "Schedule{" + "schedule_id=" + schedule_id + ", classroom=" + classroom + ", slot=" + slot + ", title=" + title + ", training_date=" + training_date + ", room=" + room + '}';
    }
    
}
