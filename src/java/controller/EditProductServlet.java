/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Books;
import model.BooksDB;

/**
 *
 * @author ACER
 */
@WebServlet(name = "EditProductServlet", urlPatterns = {"/EditProductServlet"})
public class EditProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditBookServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditBookServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookID = request.getParameter("bookID");
        Books book = BooksDB.getBookByID(Integer.parseInt(bookID));
        request.setAttribute("bookForEdit", book);
        request.getRequestDispatcher("editProductByAdmin.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookID = Integer.parseInt(request.getParameter("bookID"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String genre = request.getParameter("genre");
        int publishedYear = Integer.parseInt(request.getParameter("publishedYear"));
        String publisher = request.getParameter("publisher");
        String description = request.getParameter("description");
        int totalCopies = Integer.parseInt(request.getParameter("totalCopies"));
        int availableCopies = Integer.parseInt(request.getParameter("availableCopies"));
        double price = Double.parseDouble(request.getParameter("price"));
        String imagePath = request.getParameter("imagePath");
        int pageCount = Integer.parseInt(request.getParameter("pageCount"));
        String language = request.getParameter("language");
        String addedDate = request.getParameter("addedDate");
        java.sql.Date dateOfBook = null;
        if (addedDate != null && !addedDate.isEmpty()) {
            try {
                // Nếu đầu vào là yyyy-MM-dd (HTML <input type="date"> gửi đúng định dạng này)
                dateOfBook = java.sql.Date.valueOf(addedDate);
            } catch (IllegalArgumentException e) {
            }
        }  
        if (BooksDB.updateBook(new Books(bookID, title, author, genre, publishedYear, publisher, description, totalCopies, availableCopies, price, imagePath, pageCount, language, dateOfBook))){
            request.getRequestDispatcher("listProductByUser.jsp").forward(request, response);
        }
    }   

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
