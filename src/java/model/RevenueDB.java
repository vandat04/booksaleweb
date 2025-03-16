/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
import java.sql.*;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.SQLException;

public class RevenueDB implements DatabaseInfo {

    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
        }
        try {
            return DriverManager.getConnection(DBURL, USERDB, PASSDB);
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }
    
    public static Revenue getRevenue(int id) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT RevenueDate, TotalSales, TotalRevenue FROM Revenue WHERE RevenueID=?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Date revenueDate = rs.getDate(1);
                int totalSales = rs.getInt(2);
                double totalRevenue = rs.getDouble(3);
                return new Revenue(id, revenueDate, totalSales, totalRevenue);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(RevenueDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static ArrayList<Revenue> listAll() {
        ArrayList<Revenue> list = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT RevenueID, RevenueDate, TotalSales, TotalRevenue FROM Revenue");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Revenue(
                    rs.getInt(1), 
                    rs.getDate(2), 
                    rs.getInt(3), 
                    rs.getDouble(4)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(RevenueDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void main(String[] args) throws SQLException {
        System.out.println(RevenueDB.getRevenue(1));  
    }
}

