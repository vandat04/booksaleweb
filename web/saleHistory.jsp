<%-- 
    Document   : salesHistory
    Created on : Mar 16, 2025, 11:43:35 PM
    Author     : ACER
--%>

<%@page import="model.Sales"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<div class="container mt-5">
    <h2 class="mb-4">
        <a href="index.jsp" class="btn btn-outline-secondary">Back</a> User Profile
    </h2>

    <% 
        Users saleUser = (Users) request.getSession().getAttribute("user");
        if (saleUser == null) { 
    %>
        <p class="text-danger">User sale not found.</p>
    <% } else if (!saleUser.isAdmin()) { 
        // Nếu không phải admin, chuyển sang salesHistoryForUser.jsp
        request.getRequestDispatcher("salesHistoryForUser.jsp").forward(request, response);
        return; // Dừng chương trình để tránh thực thi tiếp
    } else { 
    %>
        <h3 class="mt-5">All Sales</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Sale ID</th>
                    <th>User ID</th>
                    <th>Book ID</th>
                    <th>Sale Date</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Sales> saleList = (List<Sales>) request.getAttribute("saleList");
                    if (saleList != null) {
                        for (Sales sale : saleList) {
                %>
                <tr>
                    <td><%= sale.getSaleID()%></td>
                    <td><%= sale.getUserID()%></td>
                    <td><%= sale.getBookID()%></td>
                    <td><%= sale.getSaleDate()%></td>
                    <td><%= sale.getQuantity() %></td>
                    <td><%= sale.getTotalPrice()%></td>
                    <td><%= sale.getStatus()%></td>
                </tr>
                <% 
                        }
                    } else { 
                %>
                <tr>
                    <td colspan="7" class="text-center text-muted">No sales found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    <% } %> <!-- Kết thúc kiểm tra user -->
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>