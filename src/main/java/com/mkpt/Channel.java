package com.mkpt;

import java.util.Date;

/**
 * Created by admin on 10/28/2016.
 */
public class Channel {
    private int ID;
    private int docID;
    private int hospitalID;
    private String weekDay;
    private String time;
    private Date nextDate;
    private int nextPatientNo;
    private int maxPatients;
    private int enabled;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getDocID() {
        return docID;
    }

    public void setDocID(int docID) {
        this.docID = docID;
    }

    public int getHospitalID() {
        return hospitalID;
    }

    public void setHospitalID(int hospitalID) {
        this.hospitalID = hospitalID;
    }

    public String getWeekDay() {
        return weekDay;
    }

    public void setWeekDay(String weekDay) {
        this.weekDay = weekDay;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Date getNextDate() {
        return nextDate;
    }

    public void setNextDate(Date nextDate) {
        this.nextDate = nextDate;
    }

    public int getMaxPatients() {
        return maxPatients;
    }

    public void setMaxPatients(int maxPatients) {
        this.maxPatients = maxPatients;
    }

    public int getEnabled() {
        return enabled;
    }

    public void setEnabled(int enabled) {
        this.enabled = enabled;
    }

    public int getNextPatientNo() {
        return nextPatientNo;
    }

    public void setNextPatientNo(int nextPatientNo) {
        this.nextPatientNo = nextPatientNo;
    }
}
