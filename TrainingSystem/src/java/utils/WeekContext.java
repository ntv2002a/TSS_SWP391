/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import model.Week;

/**
 *
 * @author duyng
 */
public class WeekContext {
    
    public ArrayList<Week> list(int year) {
        ArrayList<Week> weeks = new ArrayList<>();
        Calendar c = Calendar.getInstance();
        c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        c.set(Calendar.DAY_OF_WEEK_IN_MONTH, 1);
        c.set(Calendar.MONTH, Calendar.JANUARY);
        c.set(Calendar.YEAR, year);
        Date start, end;
        start = new java.sql.Date(c.getTime().getTime());
        
        while (start.before(Date.valueOf((year + 1) + "-01-01"))) {
            c.add(Calendar.DATE, 6);
            end = new java.sql.Date(c.getTime().getTime());
            Week week = new Week();
            week.setStart(start);
            week.setEnd(end);
            weeks.add(week);
            c.add(Calendar.DATE, 1);
            start = new java.sql.Date(c.getTime().getTime());
        }
        
        return weeks;
    }
    
    public Week get(int year, int index) {
        Week week = new Week();
        Calendar c = Calendar.getInstance();
        c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        c.set(Calendar.DAY_OF_WEEK_IN_MONTH, 1);
        c.set(Calendar.MONTH, Calendar.JANUARY);
        c.set(Calendar.YEAR, year);
        c.add(Calendar.DATE, index * 7);
        Date start = new java.sql.Date(c.getTime().getTime());
        c.add(Calendar.DATE, 6);
        Date end = new java.sql.Date(c.getTime().getTime());
        week.setStart(start);
        week.setEnd(end);
        return week;
    }
}
