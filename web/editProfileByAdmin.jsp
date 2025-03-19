<%-- 
    Document   : editprofilebyadmin
    Created on : Mar 15, 2025, 9:52:54 PM
    Author     : ACER
--%>

<%@page import="model.UsersDB"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="mb-4">  <a href="index.jsp" class="btn btn-outline-secondary">Back</a> User Profile</h2>

            <% Users profiles = UsersDB.getUserByID(Integer.parseInt(request.getParameter("userID")));
                if (profiles == null) { %>
            <p class="text-danger">User profile not found.</p>
            <% } else {%>     
            <!-- User profile form -->
            <form action="ProfileEditByAdminServlet" method="POST">
                <input type="hidden" class="form-control" name="adminID" value="<%= request.getParameter("adminID")%>" readonly>
                <input type="hidden" class="form-control" name="type" value="edit" readonly>
                <div class="mb-3">
                    <label class="form-label"><strong>UserID:</strong></label>
                    <input type="text" class="form-control" name="userID" value="<%= profiles.getUserID()%>" readonly>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>Username:</strong></label>
                    <input type="text" class="form-control" value="<%= profiles.getUsername()%>" readonly>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>Password:</strong></label>
                    <input type="text" class="form-control" name="password" value="<%= profiles.getPassword()%>" required=""/>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>Full Name:</strong></label>
                    <input type="text" class="form-control" name="fullName" value="<%= profiles.getFullName()%>" required=""/>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>BirthDay:</strong></label>
                    <input type="text" class="form-control" name="dateOfBirth" value="<%= profiles.getDateOfBirth()%>" required=""/>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>Email:</strong></label>
                    <input type="email" class="form-control" name="email" value="<%= profiles.getEmail()%>" required=""/>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>Phone:</strong></label>
                    <input type="text" class="form-control" name="phone" value="<%= profiles.getPhone()%>" required=""/>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>Address:</strong></label>
                    <input type="text" class="form-control" name="address" value="<%= profiles.getAddress()%>" required=""/>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>Money: </strong></label>
                    <input type="text" class="form-control" value="<%= profiles.getMoney()%>" readonly>
                </div>
                <div class="mb-3">
                    <label class="form-label"><strong>Registration Date:</strong></label>
                    <input type="text" class="form-control" value="<%= profiles.getRegistrationDate()%>" readonly>
                </div>
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </form>
            <%}%>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">