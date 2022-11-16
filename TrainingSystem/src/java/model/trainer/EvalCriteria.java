/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.trainer;

/**
 *
 * @author Admin
 */
public class EvalCriteria {
     int id;
    int assId;
    int milestoneId;
    String name;
    boolean isTeamEval;
    String evalWeight;
    int maxLoc;
    boolean status;
    String description;
    Assignment1 assignment;

    public EvalCriteria(int id, int assId, int milestoneId, String name, boolean isTeamEval, String evalWeight, int maxLoc, boolean status, String description) {
        this.id = id;
        this.assId = assId;
        this.milestoneId = milestoneId;
        this.name = name;
        this.isTeamEval = isTeamEval;
        this.evalWeight = evalWeight;
        this.maxLoc = maxLoc;
        this.status = status;
        this.description = description;
    }

    public EvalCriteria() {
    }

    public EvalCriteria(int id, int assId, int milestoneId, String name, boolean isTeamEval, String evalWeight, int maxLoc, String description) {
        this.id = id;
        this.assId = assId;
        this.milestoneId = milestoneId;
        this.name = name;
        this.isTeamEval = isTeamEval;
        this.evalWeight = evalWeight;
        this.maxLoc = maxLoc;
        this.description = description;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Assignment1 getAssignment() {
        return assignment;
    }

    public void setAssignment(Assignment1 assignment) {
        this.assignment = assignment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAssId() {
        return assId;
    }

    public void setAssId(int assId) {
        this.assId = assId;
    }

    public int getMilestoneId() {
        return milestoneId;
    }

    public void setMilestoneId(int milestoneId) {
        this.milestoneId = milestoneId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isIsTeamEval() {
        return isTeamEval;
    }

    public void setIsTeamEval(boolean isTeamEval) {
        this.isTeamEval = isTeamEval;
    }

    public String getEvalWeight() {
        return evalWeight;
    }

    public void setEvalWeight(String evalWeight) {
        this.evalWeight = evalWeight;
    }

    public int getMaxLoc() {
        return maxLoc;
    }

    public void setMaxLoc(int maxLoc) {
        this.maxLoc = maxLoc;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
