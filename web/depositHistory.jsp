<%-- 
    Document   : depositHistory
    Created on : Mar 16, 2025, 12:50:03 AM
    Author     : ACER
--%>

<%@page import="model.Users"%>
<%@page import="model.DepositHistoryDB"%>
<%@page import="model.DepositHistory"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Deposit History</title>      
    </head>
    <body class="container mt-4">
        <%
            ArrayList<DepositHistory> listDeposit = (ArrayList) DepositHistoryDB.allListDeposit();
            Users user = (Users) session.getAttribute("user");
        %>

        <h2 class="mb-4">
            <a href="index.jsp" class="btn btn-outline-secondary">
                <i class="fa-solid fa-arrow-left"></i> Back
            </a>
            Deposit History
        </h2>

        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Deposit ID</th>
                    <th>User ID</th>
                    <th>Bank</th>
                    <th>Value</th>
                    <th>Deposit Date</th>   
                </tr>
            </thead>
            <tbody>
                <%  if (!user.isAdmin()) {
                        for (DepositHistory deposit : listDeposit) {
                            if (deposit.getUserID() == user.getUserID()) {
                %>
                <tr>
                    <td><%= deposit.getDepositID()%></td>
                    <td><%= deposit.getUserID()%></td>
                    <td><%= deposit.getBankName()%></td>
                    <td><%= deposit.getValue()%></td>
                    <td><%= deposit.getDepositDate()%></td>
                </tr>
                <%
                        }
                    }
                } else {
                    for (DepositHistory deposit : listDeposit) {%>
                <tr>
                    <td><%= deposit.getDepositID()%></td>
                    <td><%= deposit.getUserID()%></td>
                    <td><%= deposit.getBankName()%></td>
                    <td><%= deposit.getValue()%></td>
                    <td><%= deposit.getDepositDate()%></td>
                </tr>
                <%}
                    }
                %>
            </tbody>
        </table> 
        <!-- Bootstrap JS (Optional, chỉ cần nếu dùng JavaScript của Bootstrap) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </body>
</html>
