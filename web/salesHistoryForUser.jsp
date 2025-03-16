<%-- 
    Document   : salesHistoryForUser
    Created on : Mar 17, 2025, 12:56:11 AM
    Author     : ACER
--%>

<%@page import="model.Users"%>
<%@page import="model.Sales"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<!DOCTYPE html>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<div class="container mt-5">
    <h2 class="mb-4">
        <a href="index.jsp" class="btn btn-outline-secondary">Back</a> Your Sales
    </h2>

    <% Users saleUserH = (Users) request.getSession().getAttribute("user"); %>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>Sale ID</th>
                <th>Book ID</th>
                <th>Sale Date</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Sales> saleList = (List<Sales>) request.getAttribute("saleList");
                if (saleList != null) {
                    boolean hasSales = false;
                    for (Sales sale : saleList) {
                        if (sale.getUserID() == saleUserH.getUserID()) {
                            hasSales = true;
            %>
            <tr>
                <td><%= sale.getSaleID()%></td>
                <td><%= sale.getBookID()%></td>
                <td><%= sale.getSaleDate()%></td>
                <td><%= sale.getQuantity()%></td>
                <td>$<%= sale.getTotalPrice()%></td>
                <td>
                    <span class="badge 
                          <%= sale.getStatus().equals("Pending") ? "bg-warning"
                                : sale.getStatus().equals("Completed") ? "bg-success"
                                : "bg-danger"%>">
                        <%= sale.getStatus()%>
                    </span>
                </td>
                <td>
                    <% if (sale.getStatus().equals("Pending")) {%>
                    <!-- Nếu đơn hàng đang "Pending", có 2 nút -->
                    <form action="UpdateSaleStatusServlet" method="post" class="d-inline">
                        <input type="hidden" name="saleID" value="<%= sale.getSaleID()%>">
                        <input type="hidden" name="status" value="Completed">
                        <button type="submit" class="btn btn-success btn-sm">Completed</button>
                    </form>

                    <form action="UpdateSaleStatusServlet" method="post" class="d-inline">
                        <input type="hidden" name="saleID" value="<%= sale.getSaleID()%>">
                        <input type="hidden" name="status" value="Cancelled">
                        <button type="submit" class="btn btn-danger btn-sm">Cancel</button>
                    </form>
                    <% } else if (sale.getStatus().equals("Completed")) {%>
                    <!-- Nếu đơn hàng đã "Completed", chỉ có nút Cancel -->
                    <form action="UpdateSaleStatusServlet" method="post" class="d-inline">
                        <input type="hidden" name="saleID" value="<%= sale.getSaleID()%>">
                        <input type="hidden" name="status" value="Cancelled">
                        <button type="submit" class="btn btn-danger btn-sm">Cancel</button>
                    </form>
                    <% } %>
                </td>
            </tr>
            <%
                    }
                }
                if (!hasSales) { // Nếu user không có đơn hàng nào
            %>
            <tr>
                <td colspan="7" class="text-center text-muted">No sales found.</td>
            </tr>
            <% }
            } else { // Nếu saleList null %>
            <tr>
                <td colspan="7" class="text-center text-muted">No sales found.</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>