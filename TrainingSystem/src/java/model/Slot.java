/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Time;

/**
 *
 * @author duyng
 */
public class Slot {
    int slot_id;
    String slot_name;
    Time time_start;
    Time time_end;

    public Slot() {
    }

    public Slot(int slot_id, String slot_name, Time time_start, Time time_end) {
        this.slot_id = slot_id;
        this.slot_name = slot_name;
        this.time_start = time_start;
        this.time_end = time_end;
    }

    public int getSlot_id() {
        return slot_id;
    }

    public void setSlot_id(int slot_id) {
        this.slot_id = slot_id;
    }

    public String getSlot_name() {
        return slot_name;
    }

    public void setSlot_name(String slot_name) {
        this.slot_name = slot_name;
    }

    public Time getTime_start() {
        return time_start;
    }

    public void setTime_start(Time time_start) {
        this.time_start = time_start;
    }

    public Time getTime_end() {
        return time_end;
    }

    public void setTime_end(Time time_end) {
        this.time_end = time_end;
    }

    @Override
    public String toString() {
        return "Slot{" + "slot_id=" + slot_id + ", slot_name=" + slot_name + ", time_start=" + time_start + ", time_end=" + time_end + '}';
    }
    
}
