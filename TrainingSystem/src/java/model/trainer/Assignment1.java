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
public class Assignment1 {

    int id;
    int subjectId;
    String title;
    String assBody;
    String evalWeight;
    boolean isTeamWork;
    boolean isOngoing;
    boolean status;
    Subject subject;

    public Assignment1() {
    }

    public Assignment1(int id, int subjectId, String title, String assBody, String evalWeight, boolean isTeamWork, boolean isOngoing, boolean status) {
        this.id = id;
        this.subjectId = subjectId;
        this.title = title;
        this.assBody = assBody;
        this.evalWeight = evalWeight;
        this.isTeamWork = isTeamWork;
        this.isOngoing = isOngoing;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAssBody() {
        return assBody;
    }

    public void setAssBody(String assBody) {
        this.assBody = assBody;
    }

    public String getEvalWeight() {
        return evalWeight;
    }

    public void setEvalWeight(String evalWeight) {
        this.evalWeight = evalWeight;
    }

    public boolean isIsTeamWork() {
        return isTeamWork;
    }

    public void setIsTeamWork(boolean isTeamWork) {
        this.isTeamWork = isTeamWork;
    }

    public boolean isIsOngoing() {
        return isOngoing;
    }

    public void setIsOngoing(boolean isOngoing) {
        this.isOngoing = isOngoing;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

}
