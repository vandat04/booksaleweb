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
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import model.RevenueDB;
import model.Sales;
import model.SalesDB;
import model.UsersDB;

/**
 *
 * @author ACER
 */
@WebServlet(name = "PayOrCancelServlet", urlPatterns = {"/PayOrCancelServlet"})
public class PayOrCancelServlet extends HttpServlet {

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
            out.println("<title>Servlet PayServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PayServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String type = request.getParameter("type");
        String saleID = request.getParameter("saleID");
        String status = request.getParameter("status");

        // Xóa lỗi cũ trong session
        request.getSession().removeAttribute("err");

        // Kiểm tra saleID hợp lệ trước khi truy vấn
        Sales sale = null;
        if (saleID != null && !saleID.isEmpty()) {
            sale = SalesDB.getSale(Integer.parseInt(saleID));
        }

        if (sale != null) {
            if (type.equals("Completed")) {
                if (UsersDB.deductBalance(sale.getUserID(), sale.getTotalPrice())) {
                    SalesDB.updateSaleStatus(sale.getSaleID(), status);
                    String utilDate = new SimpleDateFormat("yyyy-MM-dd").format(sale.getSaleDate());
                    RevenueDB.increaseRevenue(Date.valueOf(utilDate), sale.getQuantity(), sale.getTotalPrice());
                } else {
                    request.setAttribute("err", "Not Enough Money");
                }
            } else if (type.equals("CancelledPending")) {
                if (UsersDB.refundBalance(sale.getUserID(), sale.getTotalPrice())) {
                    SalesDB.updateSaleStatus(sale.getSaleID(), status);
                    SalesDB.restoreBookStock(sale.getBookID(), sale.getQuantity());
                }
            } else if (type.equals("Return")) {
                if (UsersDB.refundBalance(sale.getUserID(), sale.getTotalPrice())) {
                    String utilDate = new SimpleDateFormat("yyyy-MM-dd").format(sale.getSaleDate());
                    RevenueDB.decreaseRevenue(Date.valueOf(utilDate), sale.getQuantity(), sale.getTotalPrice());
                    SalesDB.updateSaleStatus(sale.getSaleID(), status);
                    SalesDB.restoreBookStock(sale.getBookID(), sale.getQuantity());
                }
            }
        } else {
            request.getSession().setAttribute("err", "Sale not found.");
        }

        // Lấy danh sách sales và kiểm tra null
        ArrayList<Sales> saleList = (ArrayList<Sales>) SalesDB.listAllSales();
        if (saleList == null) {
            saleList = new ArrayList<>(); // Để tránh lỗi NullPointerException
        }

        // Cập nhật user & saleList vào request
        if (sale != null) {
            request.setAttribute("user", UsersDB.getUserByID(sale.getUserID()));
        }
        request.setAttribute("saleList", saleList);

        // Chuyển hướng đến trang JSP
        request.getRequestDispatcher("salesHistoryForUser.jsp").forward(request, response);
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
