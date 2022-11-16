/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author duyng
 */
public class Week {
    Date start;
    Date end;
    private final String dateFormat = "dd/MM";

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public ArrayList<String> dateListString() {
        ArrayList<String> dates = new ArrayList<>();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(start);
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        while (!(calendar.getTime().after(end))) {
            Date date = new Date(calendar.getTime().getTime());
            dates.add(sdf.format(date));
            calendar.add(Calendar.DATE, 1);
        }
        return dates;
    }
    
    public ArrayList<Date> dateList() {
        ArrayList<Date> dates = new ArrayList<>();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(start);
        while (!(calendar.getTime().after(end))) {
            Date date = new Date(calendar.getTime().getTime());
            dates.add(date);
            calendar.add(Calendar.DATE, 1);
        }
        return dates;
    }
    
    @Override
    public String toString() {
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        return sdf.format(start) + " to " + sdf.format(end);
    }
}
