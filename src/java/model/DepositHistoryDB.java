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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import static model.DatabaseInfo.DBURL;
import static model.DatabaseInfo.DRIVERNAME;
import static model.DatabaseInfo.PASSDB;
import static model.DatabaseInfo.USERDB;

public class DepositHistoryDB implements DatabaseInfo {

    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
            return DriverManager.getConnection(DBURL, USERDB, PASSDB);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    // Thêm phản hồi mới vào cơ sở dữ liệu
    public static boolean addDeposit(int userID, String bankName, double value) {
        String query = "INSERT INTO DepositHistory (UserID, bankName, value) VALUES (?, ?, ?)";

        try (Connection conn = getConnect(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userID);
            ps.setString(2, bankName);
            ps.setDouble(3, value);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            Logger.getLogger(FeedbacksDB.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public static List<DepositHistory> allListDeposit() {
        List<DepositHistory> depositList = new ArrayList<>();
        String query = "SELECT * FROM DepositHistory";

        try (Connection conn = getConnect(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                DepositHistory deposit = new DepositHistory(
                        rs.getInt("DepositID"),
                        rs.getInt("UserID"),
                        rs.getString("BankName"),
                        rs.getDouble("Value"),
                        rs.getDate("DepositDate")
                );
                depositList.add(deposit);
            }
        } catch (SQLException e) {
            Logger.getLogger(UsersDB.class.getName()).log(Level.SEVERE, null, e);
        }
        return depositList;
    }

    // Thêm nạp tiền vào cơ sở dữ liệu
    public static boolean addMoney(int userID, double value) {
        String updateMoneyQuery = "UPDATE Users SET Money = Money + ? WHERE UserID = ?";

        try (Connection conn = getConnect(); PreparedStatement updateMoneyPs = conn.prepareStatement(updateMoneyQuery)) {
            updateMoneyPs.setDouble(1, value);
            updateMoneyPs.setInt(2, userID);
            return updateMoneyPs.executeUpdate() > 0;
        } catch (SQLException e) {
            Logger.getLogger(DepositHistoryDB.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    // Cập nhật số dư sau khi mua sách
    public static boolean deductMoneyAfterPurchase(int userID, double totalPrice) {
        String query = "UPDATE Users SET Money = Money - ? WHERE UserID = ? AND Money >= ?";

        try (Connection conn = getConnect(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setDouble(1, totalPrice);
            ps.setInt(2, userID);
            ps.setDouble(3, totalPrice);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            Logger.getLogger(DepositHistoryDB.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public static void main(String[] args) {
        deductMoneyAfterPurchase(1, 110);
        System.out.println(allListDeposit());
    }
}
