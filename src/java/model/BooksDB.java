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

public class BooksDB implements DatabaseInfo {

    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
        }
        try {
            Connection con = DriverManager.getConnection(DBURL, USERDB, PASSDB);
            return con;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public static Books getBookByTitle(String title) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Books WHERE Title = ?");
            stmt.setString(1, title);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Books(
                        rs.getInt("BookID"),
                        rs.getString("Title"),
                        rs.getString("Author"),
                        rs.getString("Genre"),
                        rs.getInt("PublishedYear"),
                        rs.getString("Publisher"),
                        rs.getString("Description"),
                        rs.getInt("TotalCopies"),
                        rs.getInt("AvailableCopies"),
                        rs.getDouble("Price"),
                        rs.getString("ImagePath"),
                        rs.getInt("PageCount"),
                        rs.getString("Language"),
                        rs.getDate("AddedDate")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(BooksDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static Books getBookByID (int bookID) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Books WHERE BookID = ?");
            stmt.setInt(1, bookID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Books(
                        rs.getInt("BookID"),
                        rs.getString("Title"),
                        rs.getString("Author"),
                        rs.getString("Genre"),
                        rs.getInt("PublishedYear"),
                        rs.getString("Publisher"),
                        rs.getString("Description"),
                        rs.getInt("TotalCopies"),
                        rs.getInt("AvailableCopies"),
                        rs.getDouble("Price"),
                        rs.getString("ImagePath"),
                        rs.getInt("PageCount"),
                        rs.getString("Language"),
                        rs.getDate("AddedDate")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(BooksDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static Books getBookByGenre(String title) {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Books WHERE Genre = ?");
            stmt.setString(1, title);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Books(
                        rs.getInt("BookID"),
                        rs.getString("Title"),
                        rs.getString("Author"),
                        rs.getString("Genre"),
                        rs.getInt("PublishedYear"),
                        rs.getString("Publisher"),
                        rs.getString("Description"),
                        rs.getInt("TotalCopies"),
                        rs.getInt("AvailableCopies"),
                        rs.getDouble("Price"),
                        rs.getString("ImagePath"),
                        rs.getInt("PageCount"),
                        rs.getString("Language"),
                        rs.getDate("AddedDate")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(BooksDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static List<Books> getAllList() {
        List<Books> booksList = new ArrayList<>();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM Books");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Books book = new Books(
                        rs.getInt("BookID"),
                        rs.getString("Title"),
                        rs.getString("Author"),
                        rs.getString("Genre"),
                        rs.getInt("PublishedYear"),
                        rs.getString("Publisher"),
                        rs.getString("Description"),
                        rs.getInt("TotalCopies"),
                        rs.getInt("AvailableCopies"),
                        rs.getDouble("Price"),
                        rs.getString("ImagePath"),
                        rs.getInt("PageCount"),
                        rs.getString("Language"),
                        rs.getDate("AddedDate")
                );
                booksList.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BooksDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return booksList;
    }

    public static boolean bookExists(String title) {
        try (Connection con = getConnect(); PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) FROM Books WHERE Title = ?")) {
            stmt.setString(1, title);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(BooksDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static void main(String[] args) {
        System.out.println(getBookByID(1));
    }
}
