<%-- 
    Document   : editprofile
    Created on : Mar 15, 2025, 5:59:42 PM
    Author     : ACER
--%>

<%@page import="model.UsersDB"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<div class="container mt-5">
    <h2 class="mb-4">  <a href="index.jsp" class="btn btn-outline-secondary">Back</a> User Profile</h2>

    <% Users profile = (Users) session.getAttribute("user");
                if (profile == null) { %>
    <p class="text-danger">User profile not found.</p>
    <% } else {%>     
    <!-- User profile form -->
    <form action="ProfileEditByUserServlet" method="POST">
        <div class="mb-3">
            <label class="form-label"><strong>UserID:</strong></label>
            <input type="text" class="form-control" name="userID" value="<%= profile.getUserID()%>" readonly>
        </div>
        <div class="mb-3">
            <label class="form-label"><strong>Username:</strong></label>
            <input type="text" class="form-control" value="<%= profile.getUsername()%>" readonly>
        </div>
        <div class="mb-3">
            <label class="form-label"><strong>Password:</strong></label>
            <input type="text" class="form-control" name="password" value="<%= profile.getPassword()%>" required=""/>
        </div>
        <div class="mb-3">
            <label class="form-label"><strong>Full Name:</strong></label>
            <input type="text" class="form-control" name="fullName" value="<%= profile.getFullName()%>" required=""/>
        </div>
        <div class="mb-3">
            <label class="form-label"><strong>BirthDay:</strong></label>
            <input type="text" class="form-control" name="dateOfBirth" value="<%= profile.getDateOfBirth()%>" required=""/>
        </div>
        <div class="mb-3">
            <label class="form-label"><strong>Email:</strong></label>
            <input type="email" class="form-control" name="email" value="<%= profile.getEmail()%>" required=""/>
        </div>
        <div class="mb-3">
            <label class="form-label"><strong>Phone:</strong></label>
            <input type="text" class="form-control" name="phone" value="<%= profile.getPhone()%>" required=""/>
        </div>
        <div class="mb-3">
            <label class="form-label"><strong>Address:</strong></label>
            <input type="text" class="form-control" name="address" value="<%= profile.getAddress()%>" required=""/>
        </div>
        <div class="mb-3">
            <label class="form-label"><strong>Money: </strong></label>
            <input type="text" class="form-control" value="<%= profile.getMoney()%>" readonly>
        </div>
        <div class="mb-3">
            <label class="form-label"><strong>Registration Date:</strong></label>
            <input type="text" class="form-control" value="<%= profile.getRegistrationDate()%>" readonly>
        </div>
        <div class="d-grid gap-2">
            <button type="submit" class="btn btn-primary">Update</button>
        </div>
    </form>
    <%}%>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

