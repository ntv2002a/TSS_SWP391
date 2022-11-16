/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author duyng
 */
public class RoleList extends ArrayList<Role>{
    
    public boolean isAdmin() {
        for (Role role : this)
            if (role.getTitle().equals("Administrator"))
                return true;
        return false;
    }

}
