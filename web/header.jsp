<%-- 
    Document   : header
    Created on : Mar 15, 2025, 3:02:48 PM
    Author     : ACER
--%>


<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="/CSS/main.css">
 
        <%
            Users loggedInUser = (Users) session.getAttribute("user");
        %>
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="index.jsp">
                <img src="<%=request.getContextPath()%>/images/LogoBookShop.png" alt="Nhom4" style="height: 40px;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="SalesHistoryServlet">Sales</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="deposit.jsp">Deposit</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ProfileEditByUserServlet" >Profile</a>
                    </li>
                    <li class="nav-item">             
                        <%
                        if (loggedInUser != null) {%>
                        <a class='nav-link' href='LoginServlet'> <%= loggedInUser.getUsername()%>(Logout)</a>

                        <%  loggedInUser = null;
                    } else {%>
                        <a class='nav-link' href='login.jsp'> Login</a>
                        <%}
                        %>
                    </li>
                </ul>
            </div>
        </nav>
