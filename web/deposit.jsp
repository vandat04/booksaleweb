<%-- 
    Document   : deposit
    Created on : Mar 15, 2025, 11:06:15 PM
    Author     : ACER
--%>

<%@page import="model.DepositHistory"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deposit JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="container py-5">
        <%  Users profile = (Users) session.getAttribute("user");
            String QRCode = (String) session.getAttribute("tempQR");
            String success = request.getParameter("success");
            String error = (String) request.getAttribute("error");
        %>
        <div class="card p-4 shadow">
            <% if (profile == null) { %>
            <p class="text-danger">User profile not found. Cannot deposit.</p>
            <a href="login.jsp"> Login </a>
            <% } else {
                if (profile.isAdmin()) {
                    request.getRequestDispatcher("depositHistory.jsp").forward(request, response);
                } else {
            %>

            <a href="depositHistory.jsp" class="btn btn-success mt-3"> Deposit History</a><h2>Deposit</h2>

            <% if (error != null) {%>
            <div class="alert alert-danger"><%= error%></div>
            <% } %>

            <% if (success != null) { %>
            <div class="alert alert-success">Payment Successful!</div>
            <% } %>

            <% if (QRCode == null) {%>
            <form action="DepositServlet" method="POST">
                <input type="hidden" name="getQR" value="getQRCode">
                <input type="hidden" name="userID" value="<%= profile.getUserID()%>">

                <div class="mb-3">
                    <label for="bank" class="form-label">Bank:</label>
                    <select id="bank" name="bank" class="form-select" required>
                        <option value="VCBank">VCBank</option>
                        <option value="MBBank">MBBank</option>
                        <option value="TPBank">TPBank</option>
                        <option value="VTBank">VTBank</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="value" class="form-label">Value:</label>
                    <select id="value" name="value" class="form-select" required>
                        <option value="10000">10,000 VND</option>
                        <option value="20000">20,000 VND</option>
                        <option value="50000">50,000 VND</option>
                        <option value="100000">100,000 VND</option>
                        <option value="200000">200,000 VND</option>
                        <option value="500000">500,000 VND</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Get QR Code</button> 
                <a href="index.jsp" class="btn btn-primary">Back</a>
            </form>

            <% } else {
                DepositHistory tempDeposit = (DepositHistory) session.getAttribute("tempDeposit");
            %>
            <form action="DepositServlet" method="POST">
                <input type="hidden" name="getQR" value="pay">
                <input type="hidden" name="userID" value="<%= tempDeposit.getUserID()%>">

                <div class="mb-3">
                    <label for="bank" class="form-label">Bank:</label>
                    <input type="text" id="bank" name="bank" class="form-control" value="<%= tempDeposit.getBankName()%>" readonly>
                </div>

                <div class="mb-3">
                    <label for="value" class="form-label">Value:</label>
                    <input type="text" id="value" name="value" class="form-control" value="<%= tempDeposit.getValue()%>" readonly>
                </div>

                <div class="text-center">
                    <img src="<%= request.getContextPath() + QRCode%>" alt="QR Code" class="img-fluid"/>
                </div>

                <button type="submit" class="btn btn-success mt-3">Payment Confirmation</button>
                <a href="DepositServlet" class="btn btn-success mt-3"> Cancel</a>
            </form>
            <% } %>
            <% } %>
        </div>
        <%}%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
