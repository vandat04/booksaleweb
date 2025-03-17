<%-- 
    Document   : revenue
    Created on : Mar 17, 2025, 11:28:02 AM
    Author     : ACER
--%>

<%@page import="model.Revenue"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>

<!-- Bootstrap 5 & Font Awesome -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<div class="container mt-5">
    <h2 class="mb-4">
        <a href="index.jsp" class="btn btn-outline-secondary">
            <i class="fa-solid fa-arrow-left"></i> Back
        </a>
        All Revenue
    </h2>

    <table class="table table-striped table-hover table-bordered text-center">
        <thead class="table-dark">
            <tr>
                <th><i class="fa-solid fa-calendar-days"></i> Revenue Date</th>
                <th><i class="fa-solid fa-cart-shopping"></i> Total Sales</th>
                <th><i class="fa-solid fa-dollar-sign"></i> Total Revenue</th>
            </tr>
        </thead>
        <tbody>
            <%
                ArrayList<Revenue> revenueList = (ArrayList) request.getAttribute("revenueList");
                if (revenueList != null && !revenueList.isEmpty()) {
                    for (Revenue revenue : revenueList) {
            %>  
                        <tr>
                            <td><%= revenue.getRevenueDate() %></td>
                            <td><span class="badge bg-primary fs-6"><%= revenue.getTotalSales() %></span></td>
                            <td><span class="fw-bold text-success">$<%= revenue.getTotalRevenue() %></span></td>  
                        </tr>
            <% 
                    }
                } else { 
            %>
                <tr>
                    <td colspan="3" class="text-muted text-center">No revenue data available.</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


