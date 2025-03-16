/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.util.Date;
/**
 *
 * @author ACER
 */
public class Revenue {
    private int revenueID;
    private Date revenueDate;
    private int totalSales;
    private double totalRevenue;

    public Revenue() {
    }

    public Revenue(int revenueID, Date revenueDate, int totalSales, double totalRevenue) {
        this.revenueID = revenueID;
        this.revenueDate = revenueDate;
        this.totalSales = totalSales;
        this.totalRevenue = totalRevenue;
    }

    public int getRevenueID() {
        return revenueID;
    }

    public void setRevenueID(int revenueID) {
        this.revenueID = revenueID;
    }

    public Date getRevenueDate() {
        return revenueDate;
    }

    public void setRevenueDate(Date revenueDate) {
        this.revenueDate = revenueDate;
    }

    public int getTotalSales() {
        return totalSales;
    }

    public void setTotalSales(int totalSales) {
        this.totalSales = totalSales;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    @Override
    public String toString() {
        return "Revenue{" +
                "revenueID=" + revenueID +
                ", revenueDate=" + revenueDate +
                ", totalSales=" + totalSales +
                ", totalRevenue=" + totalRevenue +
                '}';
    }
}
