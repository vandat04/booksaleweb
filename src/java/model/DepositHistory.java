/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */

import java.util.Date;

public class DepositHistory {
    private int depositID;
    private int userID;
    private String bankName;
    private double value;
    private Date depositDate;

    // Constructor
    public DepositHistory(int depositID, int userID, String bankName, double value, Date depositDate) {
        this.depositID = depositID;
        this.userID = userID;
        this.bankName = bankName;
        this.value = value;
        this.depositDate = depositDate;
    }

    public DepositHistory() {
    }

    public DepositHistory(int userID, String bankName, double value) {
        this.userID = userID;
        this.bankName = bankName;
        this.value = value;
    }
    
    

    // Getters and Setters
    public int getDepositID() {
        return depositID;
    }

    public void setDepositID(int depositID) {
        this.depositID = depositID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

    public Date getDepositDate() {
        return depositDate;
    }

    public void setDepositDate(Date depositDate) {
        this.depositDate = depositDate;
    }

    @Override
    public String toString() {
        return "DepositHistory{" +
                "depositID=" + depositID +
                ", userID=" + userID +
                ", bankName='" + bankName + '\'' +
                ", value=" + value +
                ", depositDate=" + depositDate +
                '}';
    }
}