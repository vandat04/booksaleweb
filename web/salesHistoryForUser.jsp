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

    <% 
        // Lấy thông tin user từ session
        Users saleUserH = (Users) session.getAttribute("user");
        // Lấy thông báo lỗi từ request
        String errInSale = (String) request.getAttribute("err");
        if (errInSale != null && errInSale.equals("Not Enough Money")) {    
    %>
        <p class="text-danger">Nạp thêm tiền, số dư không đủ!</p>
    <% } %>

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
                // Lấy danh sách đơn hàng từ request hoặc session
                List<Sales> saleList = (List<Sales>) request.getAttribute("saleList");
                if (saleList == null) {
                    saleList = (List<Sales>) session.getAttribute("saleList"); // Nếu không có, lấy từ session
                }

                boolean hasSales = false;
                if (saleList != null && !saleList.isEmpty() && saleUserH != null) {
                    for (Sales sale : saleList) {
                        if (sale.getUserID() == saleUserH.getUserID()) {
                            hasSales = true;
            %>
                            <tr>
                                <td><%= sale.getSaleID() %></td>
                                <td><%= sale.getBookID() %></td>
                                <td><%= sale.getSaleDate() %></td>
                                <td><%= sale.getQuantity() %></td>
                                <td>$<%= sale.getTotalPrice() %></td>
                                <td>
                                    <span class="badge 
                                        <%= (sale.getStatus() != null) ? 
                                            (sale.getStatus().equals("Pending") ? "bg-warning" :
                                             sale.getStatus().equals("Completed") ? "bg-success" :
                                             "bg-danger") : "bg-secondary" %>">
                                        <%= (sale.getStatus() != null) ? sale.getStatus() : "Unknown" %>
                                    </span>
                                </td>
                                <td>
                                    <% if (sale.getStatus() != null && sale.getStatus().equals("Pending")) { %>
                                        <form action="PayOrCancelServlet" method="post" class="d-inline">
                                            <input type="hidden" name="type" value="Completed">
                                            <input type="hidden" name="saleID" value="<%= sale.getSaleID() %>">
                                            <input type="hidden" name="status" value="Completed">
                                            <button type="submit" class="btn btn-success btn-sm" onclick="return confirmAction('complete this sale?')">Completed</button>
                                        </form>

                                        <form action="PayOrCancelServlet" method="post" class="d-inline">
                                            <input type="hidden" name="type" value="CancelledPending">
                                            <input type="hidden" name="saleID" value="<%= sale.getSaleID() %>">
                                            <input type="hidden" name="status" value="Cancelled">
                                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirmAction('cancel this sale?')">Cancel</button>
                                        </form>
                                    <% } else if (sale.getStatus() != null && sale.getStatus().equals("Completed")) { %>
                                        <form action="PayOrCancelServlet" method="post" class="d-inline">
                                            <input type="hidden" name="type" value="Return">
                                            <input type="hidden" name="saleID" value="<%= sale.getSaleID() %>">
                                            <input type="hidden" name="status" value="Refunded">
                                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirmAction('request a refund?')">Return</button>
                                        </form>
                                    <% } %>
                                </td>
                            </tr>
            <%
                        }
                    }
                }
                if (!hasSales) {
            %>
                <tr>
                    <td colspan="7" class="text-center text-muted">No sales found.</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function confirmAction(message) {
        return confirm("Are you sure you want to " + message);
    }
</script>